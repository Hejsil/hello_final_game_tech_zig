const fpl = @import("fpl.zig");
const fgl = @import("fgl.zig");

pub fn main() !void {
    try fpl.init(fpl.InitFlags.All, null);
    defer fpl.release();

    try fgl.loadOpenGl(true);

    while (fpl.windowUpdate()) {
        fgl.gl.clear(fgl.gl.COLOR_BUFFER_BIT);
        fgl.gl.begin(fgl.gl.TRIANGLES);
        fgl.gl.color3f(1, 0, 0);
        fgl.gl.vertex2f(0, 0.5);
        fgl.gl.color3f(0, 1, 0);
        fgl.gl.vertex2f(-0.5, -0.5);
        fgl.gl.color3f(0, 0, 1);
        fgl.gl.vertex2f(0.5, -0.5);
        fgl.gl.end();
        fpl.videoFlip();
    }
}
