#define FPL_IMPLEMENTATION
#include "final_platform_layer.h"

#define FGL_IMPLEMENTATION
#include "final_dynamic_opengl.h"

// final_dynamic_opengl loads the functions into static variables. That means
// that we can't have implementation and headers seperated. Zig cannot translate
// this header into Zig code yet, so the best workaround is to just have functions
// call the static variables.
void fgl_gl_clear(GLbitfield mask) {
    glClear(mask);
}

void fgl_gl_begin(GLenum mode) {
    glBegin(mode);
}

void fgl_gl_color_3f(GLfloat red, GLfloat green, GLfloat blue) {
    glColor3f(red, green, blue);
}

void fgl_gl_vertex_2f(GLfloat x, GLfloat y) {
    glVertex2f(x, y);
}

void fgl_gl_end() {
    glEnd();
}
