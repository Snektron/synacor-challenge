const std = @import("std");
const DirectAllocator = std.heap.DirectAllocator;
const ArenaAllocator = std.heap.ArenaAllocator;
const File = std.os.File;
const debug = @import("debug.zig");
const zignal = @import("zignal.zig");
const VirtualMachine = @import("vm.zig").VirtualMachine;

var globalDbg: ?*debug.Debugger = null;

export fn sigHandler(sig: c_int) void {
    if (globalDbg) |dbg| {
        dbg.interrupted = true;
    }
}

pub fn main() !void {
    var direct = DirectAllocator.init();
    defer direct.deinit();
    var arena = ArenaAllocator.init(&direct.allocator);
    defer arena.deinit();

    var dbg = try debug.Debugger.init(&arena.allocator);
    globalDbg = &dbg;
    defer globalDbg = null;
    defer dbg.deinit();

    var sa: zignal.struct_sigaction = undefined;
    sa.__sigaction_handler.sa_handler = sigHandler;
    _ = zignal.sigemptyset(@ptrCast(?[*]zignal.sigset_t, &sa.sa_mask));
    sa.sa_flags = 0;
    sa.sa_restorer = null;
    _ = zignal.sigaction(zignal.SIGINT, @ptrCast(?[*]const zignal.struct_sigaction, &sa), null);

    {
        const src = try File.openRead("challenge.bin");
        defer src.close();
        var srcIn = File.inStream(src);

        var i: usize = 0;

        while (srcIn.stream.readIntLe(u16)) |word| {
            dbg.vm.memory[i] = word;
            i += 1;
        } else |err| {
            if (err != error.EndOfStream)
                return err;
        }
    }

    try dbg.interactive_prompt();
}
