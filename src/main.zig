const fpl = @import("fpl.zig");
const fgl = @import("fgl.zig");

pub fn main() !void {
    try fpl.init(fpl.InitFlags.All, null);
    defer fpl.release();

    try fgl.loadOpenGl(true);

    while (fpl.windowUpdate()) {
        fgl.gl.clear(fgl.gl.COLOR_BUFFER_BIT);
    }
}
