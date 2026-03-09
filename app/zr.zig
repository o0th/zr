const std = @import("std");

pub const Headline = struct {
    show: bool = true,
    name: ?[]const u8 = null,
    title: ?[]const u8 = null,
};

pub const Skill = struct {
    show: bool = true,
    name: ?[]const u8 = null,
    exp: ?[]const u8 = null,
    sub: ?[]const u8 = null,
};

pub const Language = struct {
    show: bool = true,
    name: ?[]const u8 = null,
    exp: ?[]const u8 = null,
};

pub const Interest = struct {
    show: bool = true,
    name: ?[]const u8 = null,
    desc: ?[]const u8 = null,
};

pub const Resume = struct {
    headline: ?Headline = null,
    skills: ?[]Skill = null,
    languages: ?[]Language = null,
    interests: ?[]Interest = null,
};

const json_bytes = @embedFile("resume.json");

pub fn parse(allocator: std.mem.Allocator) !Resume {
    return std.json.parseFromSliceLeaky(Resume, allocator, json_bytes, .{});
}
