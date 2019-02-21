const std = @import("std");
const DirectAllocator = std.heap.DirectAllocator;
const ArenaAllocator = std.heap.ArenaAllocator;
const Allocator = std.mem.Allocator;
const ArrayList = std.ArrayList;
const OutStream = std.io.OutStream(std.os.File.OutStream.Error);

const Edge = struct {
    target: usize,
    label: u8
};

fn edge(target: usize, label: u8) Edge {
    return Edge {
        .target = target,
        .label = label,
    };
}

const nodes = []const isize{
    22, 4, 4, 8,
    9, 11, 18, 1
};

const edges = [][]const Edge{
    []const Edge{edge(1, '+'), edge(2, '+'), edge(2, '-'), edge(4, '-')},
    []const Edge{edge(2, '+'), edge(2, '*'), edge(3, '*'), edge(5, '*')},
    []const Edge{edge(4, '-'), edge(1, '+'), edge(1, '*'), edge(3, '*'), edge(5, '*'), edge(6, '-'), edge(5, '-')},
    []const Edge{edge(1, '*'), edge(2, '*'), edge(5, '*'), edge(5, '-'), edge(7, '-')},
    []const Edge{edge(2, '-'), edge(5, '-'), edge(6, '-'), edge(6, '*')},
    []const Edge{edge(1, '*'), edge(2, '*'), edge(2, '-'), edge(3, '*'), edge(3, '-'),
        edge(4, '-'), edge(6, '-'), edge(6, '*'), edge(7, '-'), edge(7, '*')},
    []const Edge{edge(4, '*'), edge(4, '-'), edge(2, '-'), edge(5, '-'), edge(5, '*'), edge(7, '*')},
};

const Link = struct {
    state: *const State,
    op: u8
};

const State = struct {
    node: usize,
    value: isize,
    prev: ?Link,

    fn init() State {
        return State {
            .node = 0,
            .value = 22,
            .prev = null
        };
    }

    fn print(self: *const State, out: *OutStream) OutStream.Error!void {
        if (self.prev) |link| {
            try link.state.print(out);
            try out.print(" {c} ", link.op);
        }

        return out.print("{}", nodes[self.node]);
    }
};

pub fn search_vault(allocator: *Allocator, out: *OutStream) !void {
    var list = ArrayList(State).init(allocator);

    try list.append(State.init());

    var round: usize = 0;
    var base: usize = 0;
    while (round < 13) {
        var i = base;
        base = list.count();
        while (i < base) {
            const s = list.at(i);
            if (s.node == 7) {
                if (s.value == 30) {
                    try out.print("Found a solution in round {}: ", round);
                    try s.print(out);
                    return out.print("\n");
                }
            } else {
                for (edges[s.node]) |*e, j| {
                    const new = State {
                        .node = e.target,
                        .value = switch (e.label) {
                            '+' => s.value + nodes[e.target],
                            '*' => s.value * nodes[e.target],
                            '-' => s.value - nodes[e.target],
                            else => unreachable
                        },
                        .prev = Link {
                            .state = &list.toSlice()[i],
                            .op = e.label
                        }
                    };

                    try list.append(new);
                }
            }

            i += 1;
        }

        round += 1;
    }
}

pub fn main() !void {
    var direct = DirectAllocator.init();
    defer direct.deinit();
    var arena = ArenaAllocator.init(&direct.allocator);
    defer arena.deinit();

    var stdout = try std.io.getStdOut();
    var out = stdout.outStream();

    try search_vault(&arena.allocator, &out.stream);
}