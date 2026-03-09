const std = @import("std");

pub const Resume = struct {
    name: []const u8,
    title: []const u8,
};

const json_bytes = @embedFile("resume.json");

pub fn parse(allocator: std.mem.Allocator) !Resume {
    return std.json.parseFromSliceLeaky(Resume, allocator, json_bytes, .{});
}
