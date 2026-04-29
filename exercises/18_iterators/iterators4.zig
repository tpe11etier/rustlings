// Practice computing a factorial using iteration rather than recursion.

const std = @import("std");
const testing = std.testing;

// TODO: Complete this function to return the factorial of `num`.
// Factorial: 1 * 2 * 3 * … * num. factorial(0) = 1 by definition.
//
// Try not to use:
// - recursion
// Challenge: use std.mem.reduce or a comptime range instead of a while loop.
fn factorial(num: u64) u64 {
    _ = num;
    return 0;
}

test "factorial of 0" {
    try testing.expectEqual(@as(u64, 1), factorial(0));
}

test "factorial of 1" {
    try testing.expectEqual(@as(u64, 1), factorial(1));
}

test "factorial of 2" {
    try testing.expectEqual(@as(u64, 2), factorial(2));
}

test "factorial of 4" {
    try testing.expectEqual(@as(u64, 24), factorial(4));
}