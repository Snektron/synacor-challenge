const std = @import("std");

fn magic(a: u15, b: u15, h: u15) u15 {
    if (a == 1) {
        return h +% b +% 1;
    } else if (a == 2) {
        return h +% (b +% 1) *% (h +% 1);
    }

    var a2 = a;
    var b2 = b;

    if (b2 == 0) {
        b2 = h;
        a2 -= 1;
    }

    while (a2 != 0) {
        b2 = magic(a2, b2 -% 1, h);
        a2 -= 1;
    }

    return b2 +% 1;
}

pub fn main() !void {
    var stdout = try std.io.getStdOut();
    var out = stdout.outStream();

    var h: usize = 0;
    while (h <= 32768) {
        const x = magic(4, 1, @intCast(u15, h));
        if (x == 6) {
            return out.stream.print("found h = {}\n", h);
        } else if (h % 1024 == 0) {
            try out.stream.print("{}/32768\n", h);
        }
        h += 1;
    }
}