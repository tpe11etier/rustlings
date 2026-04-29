// When performing operations on elements within a collection, iterators are
// essential. This exercise gets you familiar with iterating over arrays in Zig.

const std = @import("std");
const testing = std.testing;

test "iterators" {
    const my_fav_fruits = [_][]const u8{ "banana", "custard apple", "avocado", "peach", "raspberry" };

    // TODO: Create an iterator-like mechanism to go through the array.
    // In Zig there is no built-in iterator type for arrays — use an index or a slice.
    // Try using a slice and manually advancing through it with a variable.

    // Hint: you can get the next element and advance with something like:
      // var i: usize = 0;
    //   const first = my_fav_fruits[i]; i += 1;
    // for (my_fav_fruits) |*item| {

    // }

    // _ = my_fav_fruits;

    // TODO: Replace each `todo` with the correct expected value.
    try testing.expectEqualStrings("banana", my_fav_fruits[0]);
    try testing.expectEqualStrings("custard apple", my_fav_fruits[1]);
    try testing.expectEqualStrings("avocado", my_fav_fruits[2]);
    try testing.expectEqualStrings("peach", my_fav_fruits[3]);
    try testing.expectEqualStrings("raspberry", my_fav_fruits[4]);
    // After the last element, what should happen when you try to go further?
}
