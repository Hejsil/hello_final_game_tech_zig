const c = @cImport(@cInclude("final_dynamic_opengl.h"));

extern fn fgl_gl_clear(c.GLbitfield) void;
extern fn fgl_gl_begin(c.GLenum) void;
extern fn fgl_gl_color_3f(c.GLfloat, c.GLfloat, c.GLfloat) void;
extern fn fgl_gl_vertex_2f(c.GLfloat, c.GLfloat) void;
extern fn fgl_gl_end() void;

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
        fgl_gl_clear(mask);
    }

    pub const POINTS = c.GL_POINTS;
    pub const LINES = c.GL_LINES;
    pub const LINE_LOOP = c.GL_LINE_LOOP;
    pub const LINE_STRIP = c.GL_LINE_STRIP;
    pub const TRIANGLES = c.GL_TRIANGLES;
    pub const TRIANGLE_STRIP = c.GL_TRIANGLE_STRIP;
    pub const TRIANGLE_FAN = c.GL_TRIANGLE_FAN;
    pub const QUADS = c.GL_QUADS;
    pub const QUAD_STRIP = c.GL_QUAD_STRIP;
    pub const POLYGON = c.GL_POLYGON;

    pub fn begin(mode: c.GLenum) void {
        fgl_gl_begin(mode);
    }

    pub fn color3f(red: c.GLfloat, green: c.GLfloat, blue: c.GLfloat) void {
        fgl_gl_color_3f(red, green, blue);
    }

    pub fn vertex2f(x: c.GLfloat, y: c.GLfloat) void {
        fgl_gl_vertex_2f(x, y);
    }

    pub fn end() void {
        fgl_gl_end();
    }
};
