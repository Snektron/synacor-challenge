const std = @import("std");
const Allocator = std.mem.Allocator;
const ArrayList = std.ArrayList;

pub fn VirtualMachine(comptime ReadError: type, comptime WriteError: type) type {
    return struct {
        const Self = @This();
        pub const InStream = std.io.InStream(ReadError);
        pub const OutStream = std.io.OutStream(WriteError);

        pub memory: [32768]u16,
        pub registerBank: [8]u16,
        stack: ArrayList(u16),
        pub pc: u16,
        in: *InStream,
        out: *OutStream,

        pub fn init(allocator: *Allocator, in: *InStream, out: *OutStream) Self {
            return Self {
                .memory = undefined,
                .registerBank = []u16{0} ** 8,
                .stack = ArrayList(u16).init(allocator),
                .pc = 0,
                .in = in,
                .out = out
            };
        }

        pub fn instr(self: *Self) !bool {
            switch (self.memory[self.pc]) {
                0 => return false,
                1 => {
                    const reg = try self.readDst();
                    const value = try self.readValue();
                    reg.* = value;
                },
                2 => {
                    const value = try self.readValue();
                    try self.push(value);
                },
                3 => {
                    const dst = try self.readDst();
                    dst.* = try self.pop();
                },
                4 => {
                    const dst = try self.readDst();
                    const lhs = try self.readValue();
                    const rhs = try self.readValue();
                    dst.* = @boolToInt(lhs == rhs);
                },
                5 => {
                    const dst = try self.readDst();
                    const lhs = try self.readValue();
                    const rhs = try self.readValue();
                    dst.* = @boolToInt(lhs > rhs);
                },
                6 => {
                    self.pc = try self.readValue();
                    return true;
                },
                7 => {
                    const cond = try self.readValue();
                    const dst = try self.readValue();

                    if (cond != 0) {
                        self.pc = dst;
                        return true;
                    }
                },
                8 => {
                    const cond = try self.readValue();
                    const dst = try self.readValue();

                    if (cond == 0) {
                        self.pc = dst;
                        return true;
                    }
                },
                9, 10, 11, 12, 13 => {
                    const op = self.memory[self.pc];
                    const dst = try self.readDst();
                    const lhs = @intCast(u15, try self.readValue());
                    const rhs = @intCast(u15, try self.readValue());

                    const res = switch (op) {
                        9 => lhs +% rhs,
                        10 => lhs *% rhs,
                        11 => lhs % rhs,
                        12 => lhs & rhs,
                        13 => lhs | rhs,
                        else => unreachable
                    };

                    dst.* = @intCast(u16, res);
                },
                14 => {
                    const dst = try self.readDst();
                    const arg = @intCast(u15, try self.readValue());
                    dst.* = @intCast(u16, ~arg);
                },
                15 => {
                    const dst = try self.readDst();
                    const addr = try self.readValue();
                    dst.* = self.memory[addr];
                },
                16 => {
                    const addr = try self.readValue();
                    const val = try self.readValue();
                    self.memory[addr] = val;
                },
                17 => {
                    const dstAddr = try self.readValue();
                    try self.push(self.pc + 1);
                    self.pc = dstAddr;
                    return true;
                },
                18 => {
                    self.pc = try self.pop();
                    return true;
                },
                19 => try self.out.writeIntLe(u16, try self.readValue()),
                20 => {
                    const dst = try self.readDst();
                    dst.* = try self.in.readByte();
                },
                21 => {},
                else => return error.IllegalInstruction
            }

            self.pc += 1;
            return true;
        }

        pub fn run(self: *Self) !void {
            while (try self.instr()) {
                continue;
            }
        }

        fn push(self: *Self, value: u16) !void {
            try self.stack.append(value);
        }

        fn pop(self: *Self) !u16 {
            return self.stack.popOrNull() orelse error.StackUnderflow;
        }

        fn write(self: *Self, addr: u16, value: u16) !void {
            switch (addr) {
                0 ... 32767 => self.memory[addr] = value,
                32768 ... 32775 => self.registerBank[addr - 32768] = value,
                else => error.InvalidWrite
            }
        }

        fn decode(self: *Self, value: u16) !u16 {
            return switch (value) {
                0 ... 32767 => value,
                32768 ... 32775 => self.registerBank[value - 32768],
                else => error.InvalidArg
            };
        }

        fn readValue(self: *Self) !u16 {
            self.pc += 1;
            return self.decode(self.memory[self.pc]);
        }

        fn readDst(self: *Self) !*u16 {
            self.pc += 1;
            const v = self.memory[self.pc];
            return switch (v) {
                0 ... 32767 => &self.memory[v],
                32768 ... 32775 => &self.registerBank[v - 32768],
                else => error.InvalidDst
            };
        }
    };
}