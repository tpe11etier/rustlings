// In this exercise you'll capitalize the first character of a string,
// then apply it to a slice of strings.

const std = @import("std");
const testing = std.testing;

// TODO: Complete this function.
// "hello" -> "Hello"
// Hint: std.ascii.toUpper works on a single u8 (byte).
// Strings in Zig are []const u8 — index into the slice to get individual bytes.
// You'll need an allocator to build the result string.
fn capitalizeFirst(allocator: std.mem.Allocator, input: []const u8) ![]u8 {
    if (input.len == 0) return try allocator.dupe(u8, input);
    const result = try allocator.dupe(u8, input);
    result[0] = std.ascii.toUpper(result[0]);
    return result;
}

// TODO: Apply `capitalizeFirst` to a slice of strings.
// Return a newly allocated slice of strings.
// ["hello", "world"] -> ["Hello", "World"]
fn capitalizeWordsVector(allocator: std.mem.Allocator, words: []const []const u8) ![][]u8 {
    const result = try allocator.alloc([]u8, words.len);
    for (words, 0..) |word, i| {
        result[i] = try capitalizeFirst(allocator, word);
    }
    return result;
}

// // TODO: Apply `capitalizeFirst` to a slice of strings and join them into one string.
// // ["hello", " ", "world"] -> "Hello World"
// fn capitalizeWordsString(allocator: std.mem.Allocator, words: []const []const u8) ![]u8 {
//     _ = allocator;
//     _ = words;
//     return error.Todo;
// }

test "capitalize first" {
    const result = try capitalizeFirst(testing.allocator, "hello");
    defer testing.allocator.free(result);
    try testing.expectEqualStrings("Hello", result);
}

test "capitalize empty string" {
    const result = try capitalizeFirst(testing.allocator, "");
    defer testing.allocator.free(result);
    try testing.expectEqualStrings("", result);
}

test "capitalize words vector" {
    const words = [_][]const u8{ "hello", "world" };
    const result = try capitalizeWordsVector(testing.allocator, &words);
    defer {
        for (result) |s| testing.allocator.free(s);
        testing.allocator.free(result);
    }
    try testing.expectEqualStrings("Hello", result[0]);
    try testing.expectEqualStrings("World", result[1]);
}

// test "capitalize words into string" {
//     const words = [_][]const u8{ "hello", " ", "world" };
//     const result = try capitalizeWordsString(testing.allocator, &words);
//     defer testing.allocator.free(result);
//     try testing.expectEqualStrings("Hello World", result);
// }