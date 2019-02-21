const std = @import("std");
const mem = std.mem;
const Allocator = mem.Allocator;
const File = std.os.File;
const VirtualMachine = @import("vm.zig").VirtualMachine;

pub const Opcode = enum(u16) {
    Halt = 0,
    Set = 1,
    Push = 2,
    Pop = 3,
    Eq = 4,
    Gt = 5,
    Jmp = 6,
    Jt = 7,
    Jf = 8,
    Add = 9,
    Mult = 10,
    Mod = 11,
    And = 12,
    Or = 13,
    Not = 14,
    Rmem = 15,
    Wmem = 16,
    Call = 17,
    Ret = 18,
    Out = 19,
    In = 20,
    Noop = 21,
    Invalid = 22,

    pub fn arity(self: Opcode) usize {
        const arities = []const usize{
            0, 2, 1, 1, 3, 3,
            1, 2, 2, 3, 3, 3,
            3, 3, 2, 2, 2, 1,
            0, 1, 1, 0, 0
        };

        return arities[@enumToInt(self)];
    }
};

pub const Argument = struct {
    const Self = @This();

    arg: u16,

    pub fn format(
        self: *const Self,
        comptime fmt: []const u8,
        context: var,
        comptime Errors: type,
        output: fn (@typeOf(context), []const u8) Errors!void
    ) Errors!void {
        return switch (self.arg) {
            0 ... 32767 => std.fmt.format(context, Errors, output, "{}", self.arg),
            32768 ... 32775 => std.fmt.format(context, Errors, output, "{c}", @intCast(u8, self.arg - 32768 + 'a')),
            else => std.fmt.format(context, Errors, output, "<invalid>")
        };
    }
};

pub const Instruction = struct {
    const Self = @This();

    opcode: Opcode,
    args: [3]Argument,

    pub fn format(
        self: *const Self,
        comptime fmt: []const u8,
        context: var,
        comptime Errors: type,
        output: fn (@typeOf(context), []const u8) Errors!void
    ) Errors!void {
        try output(context, @tagName(self.opcode));
        const arity = self.opcode.arity();
        var i: usize = 0;
        while (i < arity) {
            try std.fmt.format(context, Errors, output, " {}", self.args[i]);
            i += 1;
        }
    }

    pub fn size(self: *const Self) usize {
        return self.opcode.arity() + 1;
    }
};

pub fn decode(memory: []u16) Instruction {
    const opcode = switch(memory[0]) {
        0 ... 21 => @intToEnum(Opcode, memory[0]),
        else => Opcode.Invalid
    };

    var instr = Instruction {
        .opcode = opcode,
        .args = undefined
    };

    var i: usize = 0;
    const arity = opcode.arity();
    while (i < arity) {
        instr.args[i] = Argument {
            .arg = memory[i + 1]
        };
        i += 1;
    }

    return instr;
}

fn isCommand(cmd: []const u8, comptime full: []const u8, comptime short: u8) bool {
    return mem.eql(u8, cmd, full) or mem.eql(u8, cmd, []const u8{short});
}

fn readLine(stream: *std.io.InStream(File.InStream.Error), buf: []u8) !usize {
    var index: usize = 0;
    while (true) {
        const byte = stream.readByte() catch return error.EndOfFile;
        switch (byte) {
            '\r' => {
                // trash the following \n
                _ = stream.readByte() catch return error.EndOfFile;
                return index;
            },
            '\n' => return index,
            else => {
                if (index == buf.len) return error.InputTooLong;
                buf[index] = byte;
                index += 1;
            },
        }
    }
}

const OverrideFileStream = struct {
    const Self = @This();

    file: File,
    pub stream: File.InStream,

    fn init(path: []const u8) !Self {
        var self = Self {
            .file = try File.openRead(path),
            .stream = undefined
        };

        self.stream = self.file.inStream();
        return self;
    }

    fn deinit(self: *Self) void {
        self.file.close();
    }
};

pub const DebugInStream = struct {
    const Self = @This();
    const Error = File.InStream.Error;
    const Stream = std.io.InStream(Error);

    stdin: File,
    pub stdinStream: File.InStream,
    overrideFileStream: ?OverrideFileStream,

    pub stream: Stream,

    pub fn init() !Self {
        var self = Self {
            .stdin = try std.io.getStdIn(),
            .stdinStream = undefined,
            .overrideFileStream = null,
            .stream = Stream {
                .readFn = readFn
            }
        };

        self.stdinStream = self.stdin.inStream();

        return self;
    }

    pub fn deinit(self: *Self) void {
        self.stdin.close();

        if (self.overrideFileStream) |*fs| {
            fs.deinit();
        }
    }

    pub fn overrideInput(self: *Self, path: []const u8) !void {
        const override = try OverrideFileStream.init(path);

        if (self.overrideFileStream) |*fs| {
            fs.deinit();
        }

        self.overrideFileStream = override;
    }

    fn readFn(in_stream: *Stream, dest: []u8) Error!usize {
        const self = @fieldParentPtr(Self, "stream", in_stream);

        if (self.overrideFileStream) |*fs| {
            const read = try fs.stream.stream.readFull(dest);
            if (read == dest.len) {
                return read;
            }
            
            fs.deinit();
            self.overrideFileStream = null;

            // read the remaining bytes
            return read + try self.stdinStream.stream.read(dest[read..]);
        } else {
            return self.stdinStream.stream.read(dest);  
        }
    }
};

pub const Debugger = struct {
    const Self = @This();

    allocator: *Allocator, 
    debugIn: *DebugInStream,

    stdout: File,
    stdoutStream: *File.OutStream,

    pub vm: VirtualMachine(DebugInStream.Error, File.OutStream.Error),
    pub interrupted: bool,
    pub quit: bool,

    pub fn init(allocator: *Allocator) !Self {
        var self = Self {
            .allocator = allocator,
            .debugIn = undefined,

            .stdout = try std.io.getStdOut(),
            .stdoutStream = undefined,

            .vm = undefined,
            .interrupted = false,
            .quit = false
        };

        self.debugIn = try self.allocator.createOne(DebugInStream);
        errdefer self.allocator.destroy(self.debugIn);
        self.debugIn.* = try DebugInStream.init();
    
        self.stdoutStream = try self.allocator.createOne(File.OutStream);
        errdefer self.allocator.destroy(self.stdoutStream);        
        self.stdoutStream.* = self.stdout.outStream();

        self.vm = VirtualMachine(DebugInStream.Error, File.OutStream.Error)
            .init(allocator, &self.debugIn.stream, &self.stdoutStream.stream);

        return self;
    }

    pub fn deinit(self: *Self) void {
        self.debugIn.deinit();
        self.stdout.close();
        self.allocator.destroy(self.debugIn);
        self.allocator.destroy(self.stdoutStream);
    }

    pub fn instr(self: *Self) !bool {
        return self.vm.instr();
    }

    pub fn run(self: *Self) !bool {
        self.interrupted = false;

        while (!self.interrupted) {
            if (!try self.instr()) {
                return false;
            }
        }

        return true;
    }

    pub fn printVmState(self: *Self) !void {
        try self.stdoutStream.stream.print("Virtual machine state: \nRegisters: \n");
        for (self.vm.registerBank) |value, i| {
            try self.stdoutStream.stream.print("{c}: {}", @intCast(u8, i + 'a'), value);
            if (i % 4 == 3) {
                try self.stdoutStream.stream.print("\n");
            } else {
                try self.stdoutStream.stream.print("\t");
            }
        }
        try self.stdoutStream.stream.print("pc: {}\tstack size: {}\n", self.vm.pc, self.vm.stack.count());
    }

    pub fn setReg(self: *Self, reg: []const u8, val: []const u8) !void {
        const parsedVal = try std.fmt.parseInt(u16, val, 10);
        if (mem.eql(u8, "pc", reg)) {
            self.vm.pc = parsedVal;            
        } else if (reg.len == 1) {
            const i = reg[0] - 'a';
            self.vm.registerBank[i] = parsedVal;
        } else {
            return error.InvalidArgument;
        }
    }

    pub fn stackDump(self: *Self) !void {
        try self.stdoutStream.stream.print("Virtual machine stack dump:\n");
        var i = self.vm.stack.count();
        while (i != 0) {
            i -= 1;
            try self.stdoutStream.stream.print("{}: \t{}\n", i, self.vm.stack.at(i));
        }
    }

    fn runcmd(self: *Self) !void {
        if (!try self.run())
            try self.stdoutStream.stream.print("Halted\n");
    }

    pub fn command(self: *Self, input: []const u8) !void {
        var it = std.mem.split(input, []const u8{' ', '\t'});

        const cmd = it.next() orelse return;

        if (isCommand(cmd, "run", 'r')) {
            try self.runcmd();
        } else if (isCommand(cmd, "quit", 'q')) {
            self.quit = true;
        } else if (isCommand(cmd, "feed", 'f')) {
            return self.debugIn.overrideInput(it.next() orelse return error.InvalidArgument);
        } else if (isCommand(cmd, "info", 'i')) {
            return self.printVmState();
        } else if (isCommand(cmd, "set", 's')) {
            const reg = it.next() orelse return error.InvalidArgument;
            const val = it.next() orelse return error.InvalidArgument;
            return self.setReg(reg, val);
        } else if (isCommand(cmd, "dump", 'd')) {
            const path = it.next() orelse return error.InvalidArgument;
            try std.io.writeFile(path, @sliceToBytes(self.vm.memory[0..]));
        } else if (isCommand(cmd, "stack", 't')) {
            return self.stackDump();
        } else if (isCommand(cmd, "write", 'w')) {
            const loc = it.next() orelse return error.InvalidArgument;
            const locp = try std.fmt.parseInt(u15, loc, 10);

            const val = it.next() orelse return error.InvalidArgument;
            const valp = try std.fmt.parseInt(u15, val, 10);

            self.vm.memory[locp] = valp;
        } else if (isCommand(cmd, "read", 'p')) {
            const loc = it.next() orelse return error.InvalidArgument;
            const locp = try std.fmt.parseInt(u15, loc, 10);

            try self.stdoutStream.stream.print("memory[{}] = {}\n", locp, self.vm.memory[locp]);
        } else if (isCommand(cmd, "bypass", 'b')) {
            self.vm.memory[5478] = 0;
            self.vm.registerBank[7] = 25734;
            try self.runcmd();
            self.vm.registerBank[0] = 6;
            self.vm.pc = 5491;
            try self.runcmd();
        } else {
            return self.stdoutStream.stream.print("Invalid command '{}'\n", cmd);
        }
    }

    pub fn interactive_prompt(self: *Self) !void {
        var buffer: [1024]u8 = undefined;

        try self.stdoutStream.stream.print("Synacor challenge debugger\n");

        while (!self.quit) {
            try self.stdoutStream.stream.print("> ");
            const len = try readLine(&self.debugIn.stdinStream.stream, buffer[0..]);
            self.command(buffer[0 .. len]) catch |err| {
               try self.stdoutStream.stream.print("Error: {}\n", @errorName(err));
            };
        }
    }
};
