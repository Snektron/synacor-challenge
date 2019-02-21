const std = @import("std");
const DirectAllocator = std.heap.DirectAllocator;
const ArenaAllocator = std.heap.ArenaAllocator;
const File = std.os.File;
const debug = @import("debug.zig");

pub fn main() !void {
    var direct = DirectAllocator.init();
    defer direct.deinit();
    var arena = ArenaAllocator.init(&direct.allocator);
    defer arena.deinit();

    var it = std.os.args();
    _ = it.skip();
    const input = try it.next(&arena.allocator) orelse return error.InvalidArgument;
    const output = try it.next(&arena.allocator) orelse return error.InvalidArgument;

    const src = try File.openRead(input);
    defer src.close();
    var srcIn = File.inStream(src);

    var memory = []u16{0} ** 32768;
    var i: usize = 0;

    while (srcIn.stream.readIntLe(u16)) |word| {
        memory[i] = word;
        i += 1;
    } else |err| {
        if (err != error.EndOfStream)
            return err;
    }

    const out = try File.openWrite(output);
    var outStream = out.outStream();

    i = 0;
    while (i < 32768) {
        const instr = debug.decode(memory[i..]);
        try outStream.stream.print("{}:\t{}\n", i, instr);
        i += instr.size();
    }
}