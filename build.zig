const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("hello_final_game_tech_zig", "src/main.zig");
    exe.addCSourceFile("src/final_game_tech.c", [][]const u8{});
    exe.setBuildMode(mode);
    exe.linkSystemLibrary("c");
    exe.addIncludeDir("src");
    exe.addIncludeDir("/usr/include");

    const run_cmd = exe.run();
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
