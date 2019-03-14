const c = @cImport({
    @cDefine("FGL_IMPLEMENTATION", "");
    @cInclude("final_dynamic_opengl.h");
});

pub fn loadOpenGl(load_functions: bool) !void {
    if (!c.fglLoadOpenGL(load_functions))
        return error.FglLoadOpenGlFailed;
}

pub const gl = struct {
    pub const CURRENT_BIT = c.GL_CURRENT_BIT;
    pub const POINT_BIT = c.GL_POINT_BIT;
    pub const LINE_BIT = c.GL_LINE_BIT;
    pub const POLYGON_BIT = c.GL_POLYGON_BIT;
    pub const POLYGON_STIPPLE_BIT = c.GL_POLYGON_STIPPLE_BIT;
    pub const PIXEL_MODE_BIT = c.GL_PIXEL_MODE_BIT;
    pub const LIGHTING_BIT = c.GL_LIGHTING_BIT;
    pub const FOG_BIT = c.GL_FOG_BIT;
    pub const DEPTH_BUFFER_BIT = c.GL_DEPTH_BUFFER_BIT;
    pub const ACCUM_BUFFER_BIT = c.GL_ACCUM_BUFFER_BIT;
    pub const STENCIL_BUFFER_BIT = c.GL_STENCIL_BUFFER_BIT;
    pub const VIEWPORT_BIT = c.GL_VIEWPORT_BIT;
    pub const TRANSFORM_BIT = c.GL_TRANSFORM_BIT;
    pub const ENABLE_BIT = c.GL_ENABLE_BIT;
    pub const COLOR_BUFFER_BIT = c.GL_COLOR_BUFFER_BIT;
    pub const HINT_BIT = c.GL_HINT_BIT;
    pub const EVAL_BIT = c.GL_EVAL_BIT;
    pub const LIST_BIT = c.GL_LIST_BIT;
    pub const TEXTURE_BIT = c.GL_TEXTURE_BIT;
    pub const SCISSOR_BIT = c.GL_SCISSOR_BIT;
    pub const ALL_ATTRIB_BITS = c.GL_ALL_ATTRIB_BITS;

    pub fn clear(mask: c.GLbitfield) void {
        c.glClear.*(mask);
    }
};