// Track exercise progress using a hash map.
// Recreate two counting functions — first with a loop, then without one.

const std = @import("std");
const testing = std.testing;

const Progress = enum {
    none,
    some,
    complete,
};

// Provided for reference — do not change.
fn countFor(map: std.StringHashMap(Progress), value: Progress) usize {
    var count: usize = 0;
    var iter = map.valueIterator();
    while (iter.next()) |val| {
        if (val.* == value) count += 1;
    }
    return count;
}

// TODO: Implement the same logic as `countFor` but without a `while` loop.
// Hint: Zig doesn't have higher-order iterator methods like Rust's `.filter().count()`,
// but you can use `std.mem.count` or build your own approach with slices.
fn countIterator(map: std.StringHashMap(Progress), value: Progress) usize {
    _ = map;
    _ = value;
    return 0;
}

// Provided for reference — do not change.
fn countCollectionFor(collection: []const std.StringHashMap(Progress), value: Progress) usize {
    var count: usize = 0;
    for (collection) |map| {
        var iter = map.valueIterator();
        while (iter.next()) |val| {
            if (val.* == value) count += 1;
        }
    }
    return count;
}

// TODO: Implement the same logic as `countCollectionFor` without nested while loops.
fn countCollectionIterator(collection: []const std.StringHashMap(Progress), value: Progress) usize {
    _ = collection;
    _ = value;
    return 0;
}

fn makeMap(allocator: std.mem.Allocator) !std.StringHashMap(Progress) {
    var map = std.StringHashMap(Progress).init(allocator);
    try map.put("variables1", .complete);
    try map.put("functions1", .complete);
    try map.put("hashmap1", .complete);
    try map.put("arc1", .some);
    try map.put("as_ref_mut", .none);
    try map.put("from_str", .none);
    return map;
}

test "count complete" {
    var map = try makeMap(testing.allocator);
    defer map.deinit();
    try testing.expectEqual(@as(usize, 3), countIterator(map, .complete));
}

test "count some" {
    var map = try makeMap(testing.allocator);
    defer map.deinit();
    try testing.expectEqual(@as(usize, 1), countIterator(map, .some));
}

test "count none" {
    var map = try makeMap(testing.allocator);
    defer map.deinit();
    try testing.expectEqual(@as(usize, 2), countIterator(map, .none));
}

test "count matches for loop" {
    var map = try makeMap(testing.allocator);
    defer map.deinit();
    const states = [_]Progress{ .complete, .some, .none };
    for (states) |state| {
        try testing.expectEqual(countFor(map, state), countIterator(map, state));
    }
}