// Practice error handling while iterating over a collection.

const std = @import("std");
const testing = std.testing;

const DivisionError = error{
    DivideByZero,
    IntegerOverflow,
    NotDivisible,
};

// TODO: Return `a` divided by `b` if `a` is evenly divisible by `b`.
// Otherwise return a suitable error.
// Handle: divide by zero, integer overflow (i64 min / -1), not evenly divisible.
fn divide(a: i64, b: i64) DivisionError!i64 {
    _ = a;
    _ = b;
    return error.DivideByZero;
}

// TODO: Divide each number in `numbers` by 27 and collect successful results.
// If any division fails, return the error.
// Desired output: [1, 11, 1426, 3]
fn resultWithList(allocator: std.mem.Allocator) ![]i64 {
    const numbers = [_]i64{ 27, 297, 38502, 81 };
    _ = numbers;
    _ = allocator;
    return error.Todo;
}

// TODO: Divide each number in `numbers` by 27 and collect all results (ok and err).
// Desired output: each element is either the divided value or an error.
// Return a slice of error unions: []DivisionError!i64
fn listOfResults(allocator: std.mem.Allocator) ![]DivisionError!i64 {
    const numbers = [_]i64{ 27, 297, 38502, 81 };
    _ = numbers;
    _ = allocator;
    return error.Todo;
}

test "divide success" {
    try testing.expectEqual(@as(i64, 9), try divide(81, 9));
    try testing.expectEqual(@as(i64, -81), try divide(81, -1));
    try testing.expectEqual(@as(i64, 1), try divide(std.math.minInt(i64), std.math.minInt(i64)));
}

test "divide by zero" {
    try testing.expectError(DivisionError.DivideByZero, divide(81, 0));
}

test "integer overflow" {
    try testing.expectError(DivisionError.IntegerOverflow, divide(std.math.minInt(i64), -1));
}

test "not divisible" {
    try testing.expectError(DivisionError.NotDivisible, divide(81, 6));
}

test "divide zero by something" {
    try testing.expectEqual(@as(i64, 0), try divide(0, 81));
}

test "result with list" {
    const result = try resultWithList(testing.allocator);
    defer testing.allocator.free(result);
    try testing.expectEqualSlices(i64, &[_]i64{ 1, 11, 1426, 3 }, result);
}