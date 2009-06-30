from numpy import array
from numpy cimport ndarray

cdef extern from "/usr/include/GL/gl.h":
    ctypedef unsigned int GLenum
    ctypedef unsigned char GLboolean
    ctypedef unsigned int GLbitfield
    ctypedef void GLvoid
    ctypedef signed char GLbyte
    ctypedef short GLshort
    ctypedef int GLint
    ctypedef unsigned char GLubyte
    ctypedef unsigned short GLushort
    ctypedef unsigned int GLuint
    ctypedef int GLsizei
    ctypedef float GLfloat
    ctypedef float GLclampf
    ctypedef double GLdouble
    ctypedef double GLclampd

    void c_glClearIndex "glClearIndex"(GLfloat c)
    void c_glClearColor "glClearColor"(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha)
    void c_glClear "glClear"(GLbitfield mask)
    void c_glIndexMask "glIndexMask"(GLuint mask)
    void c_glColorMask "glColorMask"(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha)
    void c_glAlphaFunc "glAlphaFunc"(GLenum func, GLclampf ref)
    void c_glBlendFunc "glBlendFunc"(GLenum sfactor, GLenum dfactor)
    void c_glLogicOp "glLogicOp"(GLenum opcode)
    void c_glCullFace "glCullFace"(GLenum mode)
    void c_glFrontFace "glFrontFace"(GLenum mode)
    void c_glPointSize "glPointSize"(GLfloat size)
    void c_glLineWidth "glLineWidth"(GLfloat width)
    void c_glLineStipple "glLineStipple"(GLint factor, GLushort pattern)
    void c_glPolygonMode "glPolygonMode"(GLenum face, GLenum mode)
    void c_glPolygonOffset "glPolygonOffset"(GLfloat factor, GLfloat units)
    void c_glPolygonStipple "glPolygonStipple"(GLubyte* mask)
    void c_glGetPolygonStipple "glGetPolygonStipple"(GLubyte* mask)
    void c_glEdgeFlag "glEdgeFlag"(GLboolean flag)
    void c_glEdgeFlagv "glEdgeFlagv"(GLboolean* flag)
    void c_glScissor "glScissor"(GLint x, GLint y, GLsizei width, GLsizei height)
    void c_glClipPlane "glClipPlane"(GLenum plane, GLdouble* equation)
    void c_glGetClipPlane "glGetClipPlane"(GLenum plane, GLdouble* equation)
    void c_glDrawBuffer "glDrawBuffer"(GLenum mode)
    void c_glReadBuffer "glReadBuffer"(GLenum mode)
    void c_glEnable "glEnable"(GLenum cap)
    void c_glDisable "glDisable"(GLenum cap)
    void c_glIsEnabled "glIsEnabled"(GLenum cap)
    void c_glEnableClientState "glEnableClientState"(GLenum cap)
    void c_glDisableClientState "glDisableClientState"(GLenum cap)
    void c_glGetBooleanv "glGetBooleanv"(GLenum pname, GLboolean* params)
    void c_glGetDoublev "glGetDoublev"(GLenum pname, GLdouble* params)
    void c_glGetFloatv "glGetFloatv"(GLenum pname, GLfloat* params)
    void c_glGetIntegerv "glGetIntegerv"(GLenum pname, GLint* params)
    void c_glPushAttrib "glPushAttrib"(GLbitfield mask)
    void c_glPopAttrib "glPopAttrib"()
    void c_glPushClientAttrib "glPushClientAttrib"(GLbitfield mask)
    void c_glPopClientAttrib "glPopClientAttrib"()
    void c_glRenderMode "glRenderMode"(GLenum mode)
    void c_glGetError "glGetError"()
    void c_glGetString "glGetString"(GLenum name)
    void c_glFinish "glFinish"()
    void c_glFlush "glFlush"()
    void c_glHint "glHint"(GLenum target, GLenum mode)
    void c_glClearDepth "glClearDepth"(GLclampd depth)
    void c_glDepthFunc "glDepthFunc"(GLenum func)
    void c_glDepthMask "glDepthMask"(GLboolean flag)
    void c_glDepthRange "glDepthRange"(GLclampd near_val, GLclampd far_val)
    void c_glClearAccum "glClearAccum"(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
    void c_glAccum "glAccum"(GLenum op, GLfloat value)
    void c_glMatrixMode "glMatrixMode"(GLenum mode)
    void c_glOrtho "glOrtho"(GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val)
    void c_glFrustum "glFrustum"(GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble near_val, GLdouble far_val)
    void c_glViewport "glViewport"(GLint x, GLint y, GLsizei width, GLsizei height)
    void c_glPushMatrix "glPushMatrix"()
    void c_glPopMatrix "glPopMatrix"()
    void c_glLoadIdentity "glLoadIdentity"()
    void c_glLoadMatrixd "glLoadMatrixd"(GLdouble* m)
    void c_glLoadMatrixf "glLoadMatrixf"(GLfloat* m)
    void c_glMultMatrixd "glMultMatrixd"(GLdouble* m)
    void c_glMultMatrixf "glMultMatrixf"(GLfloat* m)
    void c_glRotated "glRotated"(GLdouble angle, GLdouble x, GLdouble y, GLdouble z)
    void c_glRotatef "glRotatef"(GLfloat angle, GLfloat x, GLfloat y, GLfloat z)
    void c_glScaled "glScaled"(GLdouble x, GLdouble y, GLdouble z)
    void c_glScalef "glScalef"(GLfloat x, GLfloat y, GLfloat z)
    void c_glTranslated "glTranslated"(GLdouble x, GLdouble y, GLdouble z)
    void c_glTranslatef "glTranslatef"(GLfloat x, GLfloat y, GLfloat z)
    void c_glIsList "glIsList"(GLuint list)
    void c_glDeleteLists "glDeleteLists"(GLuint list, GLsizei range)
    void c_glGenLists "glGenLists"(GLsizei range)
    void c_glNewList "glNewList"(GLuint list, GLenum mode)
    void c_glEndList "glEndList"()
    void c_glCallList "glCallList"(GLuint list)
    void c_glCallLists "glCallLists"(GLsizei n, GLenum type, GLvoid* lists)
    void c_glListBase "glListBase"(GLuint base)
    void c_glBegin "glBegin"(GLenum mode)
    void c_glEnd "glEnd"()
    void c_glVertex2d "glVertex2d"(GLdouble x, GLdouble y)
    void c_glVertex2f "glVertex2f"(GLfloat x, GLfloat y)
    void c_glVertex2i "glVertex2i"(GLint x, GLint y)
    void c_glVertex2s "glVertex2s"(GLshort x, GLshort y)
    void c_glVertex3d "glVertex3d"(GLdouble x, GLdouble y, GLdouble z)
    void c_glVertex3f "glVertex3f"(GLfloat x, GLfloat y, GLfloat z)
    void c_glVertex3i "glVertex3i"(GLint x, GLint y, GLint z)
    void c_glVertex3s "glVertex3s"(GLshort x, GLshort y, GLshort z)
    void c_glVertex4d "glVertex4d"(GLdouble x, GLdouble y, GLdouble z, GLdouble w)
    void c_glVertex4f "glVertex4f"(GLfloat x, GLfloat y, GLfloat z, GLfloat w)
    void c_glVertex4i "glVertex4i"(GLint x, GLint y, GLint z, GLint w)
    void c_glVertex4s "glVertex4s"(GLshort x, GLshort y, GLshort z, GLshort w)
    void c_glVertex2dv "glVertex2dv"(GLdouble* v)
    void c_glVertex2fv "glVertex2fv"(GLfloat* v)
    void c_glVertex2iv "glVertex2iv"(GLint* v)
    void c_glVertex2sv "glVertex2sv"(GLshort* v)
    void c_glVertex3dv "glVertex3dv"(GLdouble* v)
    void c_glVertex3fv "glVertex3fv"(GLfloat* v)
    void c_glVertex3iv "glVertex3iv"(GLint* v)
    void c_glVertex3sv "glVertex3sv"(GLshort* v)
    void c_glVertex4dv "glVertex4dv"(GLdouble* v)
    void c_glVertex4fv "glVertex4fv"(GLfloat* v)
    void c_glVertex4iv "glVertex4iv"(GLint* v)
    void c_glVertex4sv "glVertex4sv"(GLshort* v)
    void c_glNormal3b "glNormal3b"(GLbyte nx, GLbyte ny, GLbyte nz)
    void c_glNormal3d "glNormal3d"(GLdouble nx, GLdouble ny, GLdouble nz)
    void c_glNormal3f "glNormal3f"(GLfloat nx, GLfloat ny, GLfloat nz)
    void c_glNormal3i "glNormal3i"(GLint nx, GLint ny, GLint nz)
    void c_glNormal3s "glNormal3s"(GLshort nx, GLshort ny, GLshort nz)
    void c_glNormal3bv "glNormal3bv"(GLbyte* v)
    void c_glNormal3dv "glNormal3dv"(GLdouble* v)
    void c_glNormal3fv "glNormal3fv"(GLfloat* v)
    void c_glNormal3iv "glNormal3iv"(GLint* v)
    void c_glNormal3sv "glNormal3sv"(GLshort* v)
    void c_glIndexd "glIndexd"(GLdouble c)
    void c_glIndexf "glIndexf"(GLfloat c)
    void c_glIndexi "glIndexi"(GLint c)
    void c_glIndexs "glIndexs"(GLshort c)
    void c_glIndexub "glIndexub"(GLubyte c)
    void c_glIndexdv "glIndexdv"(GLdouble* c)
    void c_glIndexfv "glIndexfv"(GLfloat* c)
    void c_glIndexiv "glIndexiv"(GLint* c)
    void c_glIndexsv "glIndexsv"(GLshort* c)
    void c_glIndexubv "glIndexubv"(GLubyte* c)
    void c_glColor3b "glColor3b"(GLbyte red, GLbyte green, GLbyte blue)
    void c_glColor3d "glColor3d"(GLdouble red, GLdouble green, GLdouble blue)
    void c_glColor3f "glColor3f"(GLfloat red, GLfloat green, GLfloat blue)
    void c_glColor3i "glColor3i"(GLint red, GLint green, GLint blue)
    void c_glColor3s "glColor3s"(GLshort red, GLshort green, GLshort blue)
    void c_glColor3ub "glColor3ub"(GLubyte red, GLubyte green, GLubyte blue)
    void c_glColor3ui "glColor3ui"(GLuint red, GLuint green, GLuint blue)
    void c_glColor3us "glColor3us"(GLushort red, GLushort green, GLushort blue)
    void c_glColor4b "glColor4b"(GLbyte red, GLbyte green, GLbyte blue, GLbyte alpha)
    void c_glColor4d "glColor4d"(GLdouble red, GLdouble green, GLdouble blue, GLdouble alpha)
    void c_glColor4f "glColor4f"(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
    void c_glColor4i "glColor4i"(GLint red, GLint green, GLint blue, GLint alpha)
    void c_glColor4s "glColor4s"(GLshort red, GLshort green, GLshort blue, GLshort alpha)
    void c_glColor4ub "glColor4ub"(GLubyte red, GLubyte green, GLubyte blue, GLubyte alpha)
    void c_glColor4ui "glColor4ui"(GLuint red, GLuint green, GLuint blue, GLuint alpha)
    void c_glColor4us "glColor4us"(GLushort red, GLushort green, GLushort blue, GLushort alpha)
    void c_glColor3bv "glColor3bv"(GLbyte* v)
    void c_glColor3dv "glColor3dv"(GLdouble* v)
    void c_glColor3fv "glColor3fv"(GLfloat* v)
    void c_glColor3iv "glColor3iv"(GLint* v)
    void c_glColor3sv "glColor3sv"(GLshort* v)
    void c_glColor3ubv "glColor3ubv"(GLubyte* v)
    void c_glColor3uiv "glColor3uiv"(GLuint* v)
    void c_glColor3usv "glColor3usv"(GLushort* v)
    void c_glColor4bv "glColor4bv"(GLbyte* v)
    void c_glColor4dv "glColor4dv"(GLdouble* v)
    void c_glColor4fv "glColor4fv"(GLfloat* v)
    void c_glColor4iv "glColor4iv"(GLint* v)
    void c_glColor4sv "glColor4sv"(GLshort* v)
    void c_glColor4ubv "glColor4ubv"(GLubyte* v)
    void c_glColor4uiv "glColor4uiv"(GLuint* v)
    void c_glColor4usv "glColor4usv"(GLushort* v)
    void c_glTexCoord1d "glTexCoord1d"(GLdouble s)
    void c_glTexCoord1f "glTexCoord1f"(GLfloat s)
    void c_glTexCoord1i "glTexCoord1i"(GLint s)
    void c_glTexCoord1s "glTexCoord1s"(GLshort s)
    void c_glTexCoord2d "glTexCoord2d"(GLdouble s, GLdouble t)
    void c_glTexCoord2f "glTexCoord2f"(GLfloat s, GLfloat t)
    void c_glTexCoord2i "glTexCoord2i"(GLint s, GLint t)
    void c_glTexCoord2s "glTexCoord2s"(GLshort s, GLshort t)
    void c_glTexCoord3d "glTexCoord3d"(GLdouble s, GLdouble t, GLdouble r)
    void c_glTexCoord3f "glTexCoord3f"(GLfloat s, GLfloat t, GLfloat r)
    void c_glTexCoord3i "glTexCoord3i"(GLint s, GLint t, GLint r)
    void c_glTexCoord3s "glTexCoord3s"(GLshort s, GLshort t, GLshort r)
    void c_glTexCoord4d "glTexCoord4d"(GLdouble s, GLdouble t, GLdouble r, GLdouble q)
    void c_glTexCoord4f "glTexCoord4f"(GLfloat s, GLfloat t, GLfloat r, GLfloat q)
    void c_glTexCoord4i "glTexCoord4i"(GLint s, GLint t, GLint r, GLint q)
    void c_glTexCoord4s "glTexCoord4s"(GLshort s, GLshort t, GLshort r, GLshort q)
    void c_glTexCoord1dv "glTexCoord1dv"(GLdouble* v)
    void c_glTexCoord1fv "glTexCoord1fv"(GLfloat* v)
    void c_glTexCoord1iv "glTexCoord1iv"(GLint* v)
    void c_glTexCoord1sv "glTexCoord1sv"(GLshort* v)
    void c_glTexCoord2dv "glTexCoord2dv"(GLdouble* v)
    void c_glTexCoord2fv "glTexCoord2fv"(GLfloat* v)
    void c_glTexCoord2iv "glTexCoord2iv"(GLint* v)
    void c_glTexCoord2sv "glTexCoord2sv"(GLshort* v)
    void c_glTexCoord3dv "glTexCoord3dv"(GLdouble* v)
    void c_glTexCoord3fv "glTexCoord3fv"(GLfloat* v)
    void c_glTexCoord3iv "glTexCoord3iv"(GLint* v)
    void c_glTexCoord3sv "glTexCoord3sv"(GLshort* v)
    void c_glTexCoord4dv "glTexCoord4dv"(GLdouble* v)
    void c_glTexCoord4fv "glTexCoord4fv"(GLfloat* v)
    void c_glTexCoord4iv "glTexCoord4iv"(GLint* v)
    void c_glTexCoord4sv "glTexCoord4sv"(GLshort* v)
    void c_glRasterPos2d "glRasterPos2d"(GLdouble x, GLdouble y)
    void c_glRasterPos2f "glRasterPos2f"(GLfloat x, GLfloat y)
    void c_glRasterPos2i "glRasterPos2i"(GLint x, GLint y)
    void c_glRasterPos2s "glRasterPos2s"(GLshort x, GLshort y)
    void c_glRasterPos3d "glRasterPos3d"(GLdouble x, GLdouble y, GLdouble z)
    void c_glRasterPos3f "glRasterPos3f"(GLfloat x, GLfloat y, GLfloat z)
    void c_glRasterPos3i "glRasterPos3i"(GLint x, GLint y, GLint z)
    void c_glRasterPos3s "glRasterPos3s"(GLshort x, GLshort y, GLshort z)
    void c_glRasterPos4d "glRasterPos4d"(GLdouble x, GLdouble y, GLdouble z, GLdouble w)
    void c_glRasterPos4f "glRasterPos4f"(GLfloat x, GLfloat y, GLfloat z, GLfloat w)
    void c_glRasterPos4i "glRasterPos4i"(GLint x, GLint y, GLint z, GLint w)
    void c_glRasterPos4s "glRasterPos4s"(GLshort x, GLshort y, GLshort z, GLshort w)
    void c_glRasterPos2dv "glRasterPos2dv"(GLdouble* v)
    void c_glRasterPos2fv "glRasterPos2fv"(GLfloat* v)
    void c_glRasterPos2iv "glRasterPos2iv"(GLint* v)
    void c_glRasterPos2sv "glRasterPos2sv"(GLshort* v)
    void c_glRasterPos3dv "glRasterPos3dv"(GLdouble* v)
    void c_glRasterPos3fv "glRasterPos3fv"(GLfloat* v)
    void c_glRasterPos3iv "glRasterPos3iv"(GLint* v)
    void c_glRasterPos3sv "glRasterPos3sv"(GLshort* v)
    void c_glRasterPos4dv "glRasterPos4dv"(GLdouble* v)
    void c_glRasterPos4fv "glRasterPos4fv"(GLfloat* v)
    void c_glRasterPos4iv "glRasterPos4iv"(GLint* v)
    void c_glRasterPos4sv "glRasterPos4sv"(GLshort* v)
    void c_glRectd "glRectd"(GLdouble x1, GLdouble y1, GLdouble x2, GLdouble y2)
    void c_glRectf "glRectf"(GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2)
    void c_glRecti "glRecti"(GLint x1, GLint y1, GLint x2, GLint y2)
    void c_glRects "glRects"(GLshort x1, GLshort y1, GLshort x2, GLshort y2)
    void c_glRectdv "glRectdv"(GLdouble* v1, GLdouble* v2)
    void c_glRectfv "glRectfv"(GLfloat* v1, GLfloat* v2)
    void c_glRectiv "glRectiv"(GLint* v1, GLint* v2)
    void c_glRectsv "glRectsv"(GLshort* v1, GLshort* v2)
    void c_glVertexPointer "glVertexPointer"(GLint size, GLenum type, GLsizei stride, GLvoid* ptr)
    void c_glNormalPointer "glNormalPointer"(GLenum type, GLsizei stride, GLvoid* ptr)
    void c_glColorPointer "glColorPointer"(GLint size, GLenum type, GLsizei stride, GLvoid* ptr)
    void c_glIndexPointer "glIndexPointer"(GLenum type, GLsizei stride, GLvoid* ptr)
    void c_glTexCoordPointer "glTexCoordPointer"(GLint size, GLenum type, GLsizei stride, GLvoid* ptr)
    void c_glEdgeFlagPointer "glEdgeFlagPointer"(GLsizei stride, GLvoid* ptr)
    void c_glGetPointerv "glGetPointerv"(GLenum pname, GLvoid** params)
    void c_glArrayElement "glArrayElement"(GLint i)
    void c_glDrawArrays "glDrawArrays"(GLenum mode, GLint first, GLsizei count)
    void c_glDrawElements "glDrawElements"(GLenum mode, GLsizei count, GLenum type, GLvoid* indices)
    void c_glInterleavedArrays "glInterleavedArrays"(GLenum format, GLsizei stride, GLvoid* pointer)
    void c_glShadeModel "glShadeModel"(GLenum mode)
    void c_glLightf "glLightf"(GLenum light, GLenum pname, GLfloat param)
    void c_glLighti "glLighti"(GLenum light, GLenum pname, GLint param)
    void c_glLightfv "glLightfv"(GLenum light, GLenum pname, GLfloat* params)
    void c_glLightiv "glLightiv"(GLenum light, GLenum pname, GLint* params)
    void c_glGetLightfv "glGetLightfv"(GLenum light, GLenum pname, GLfloat* params)
    void c_glGetLightiv "glGetLightiv"(GLenum light, GLenum pname, GLint* params)
    void c_glLightModelf "glLightModelf"(GLenum pname, GLfloat param)
    void c_glLightModeli "glLightModeli"(GLenum pname, GLint param)
    void c_glLightModelfv "glLightModelfv"(GLenum pname, GLfloat* params)
    void c_glLightModeliv "glLightModeliv"(GLenum pname, GLint* params)
    void c_glMaterialf "glMaterialf"(GLenum face, GLenum pname, GLfloat param)
    void c_glMateriali "glMateriali"(GLenum face, GLenum pname, GLint param)
    void c_glMaterialfv "glMaterialfv"(GLenum face, GLenum pname, GLfloat* params)
    void c_glMaterialiv "glMaterialiv"(GLenum face, GLenum pname, GLint* params)
    void c_glGetMaterialfv "glGetMaterialfv"(GLenum face, GLenum pname, GLfloat* params)
    void c_glGetMaterialiv "glGetMaterialiv"(GLenum face, GLenum pname, GLint* params)
    void c_glColorMaterial "glColorMaterial"(GLenum face, GLenum mode)
    void c_glPixelZoom "glPixelZoom"(GLfloat xfactor, GLfloat yfactor)
    void c_glPixelStoref "glPixelStoref"(GLenum pname, GLfloat param)
    void c_glPixelStorei "glPixelStorei"(GLenum pname, GLint param)
    void c_glPixelTransferf "glPixelTransferf"(GLenum pname, GLfloat param)
    void c_glPixelTransferi "glPixelTransferi"(GLenum pname, GLint param)
    void c_glPixelMapfv "glPixelMapfv"(GLenum map, GLsizei mapsize, GLfloat* values)
    void c_glPixelMapuiv "glPixelMapuiv"(GLenum map, GLsizei mapsize, GLuint* values)
    void c_glPixelMapusv "glPixelMapusv"(GLenum map, GLsizei mapsize, GLushort* values)
    void c_glGetPixelMapfv "glGetPixelMapfv"(GLenum map, GLfloat* values)
    void c_glGetPixelMapuiv "glGetPixelMapuiv"(GLenum map, GLuint* values)
    void c_glGetPixelMapusv "glGetPixelMapusv"(GLenum map, GLushort* values)
    void c_glBitmap "glBitmap"(GLsizei width, GLsizei height, GLfloat xorig, GLfloat yorig, GLfloat xmove, GLfloat ymove, GLubyte* bitmap)
    void c_glReadPixels "glReadPixels"(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid* pixels)
    void c_glDrawPixels "glDrawPixels"(GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid* pixels)
    void c_glCopyPixels "glCopyPixels"(GLint x, GLint y, GLsizei width, GLsizei height, GLenum type)
    void c_glStencilFunc "glStencilFunc"(GLenum func, GLint ref, GLuint mask)
    void c_glStencilMask "glStencilMask"(GLuint mask)
    void c_glStencilOp "glStencilOp"(GLenum fail, GLenum zfail, GLenum zpass)
    void c_glClearStencil "glClearStencil"(GLint s)
    void c_glTexGend "glTexGend"(GLenum coord, GLenum pname, GLdouble param)
    void c_glTexGenf "glTexGenf"(GLenum coord, GLenum pname, GLfloat param)
    void c_glTexGeni "glTexGeni"(GLenum coord, GLenum pname, GLint param)
    void c_glTexGendv "glTexGendv"(GLenum coord, GLenum pname, GLdouble* params)
    void c_glTexGenfv "glTexGenfv"(GLenum coord, GLenum pname, GLfloat* params)
    void c_glTexGeniv "glTexGeniv"(GLenum coord, GLenum pname, GLint* params)
    void c_glGetTexGendv "glGetTexGendv"(GLenum coord, GLenum pname, GLdouble* params)
    void c_glGetTexGenfv "glGetTexGenfv"(GLenum coord, GLenum pname, GLfloat* params)
    void c_glGetTexGeniv "glGetTexGeniv"(GLenum coord, GLenum pname, GLint* params)
    void c_glTexEnvf "glTexEnvf"(GLenum target, GLenum pname, GLfloat param)
    void c_glTexEnvi "glTexEnvi"(GLenum target, GLenum pname, GLint param)
    void c_glTexEnvfv "glTexEnvfv"(GLenum target, GLenum pname, GLfloat* params)
    void c_glTexEnviv "glTexEnviv"(GLenum target, GLenum pname, GLint* params)
    void c_glGetTexEnvfv "glGetTexEnvfv"(GLenum target, GLenum pname, GLfloat* params)
    void c_glGetTexEnviv "glGetTexEnviv"(GLenum target, GLenum pname, GLint* params)
    void c_glTexParameterf "glTexParameterf"(GLenum target, GLenum pname, GLfloat param)
    void c_glTexParameteri "glTexParameteri"(GLenum target, GLenum pname, GLint param)
    void c_glTexParameterfv "glTexParameterfv"(GLenum target, GLenum pname, GLfloat* params)
    void c_glTexParameteriv "glTexParameteriv"(GLenum target, GLenum pname, GLint* params)
    void c_glGetTexParameterfv "glGetTexParameterfv"(GLenum target, GLenum pname, GLfloat* params)
    void c_glGetTexParameteriv "glGetTexParameteriv"(GLenum target, GLenum pname, GLint* params)
    void c_glGetTexLevelParameterfv "glGetTexLevelParameterfv"(GLenum target, GLint level, GLenum pname, GLfloat* params)
    void c_glGetTexLevelParameteriv "glGetTexLevelParameteriv"(GLenum target, GLint level, GLenum pname, GLint* params)
    void c_glTexImage1D "glTexImage1D"(GLenum target, GLint level, GLint internalFormat, GLsizei width, GLint border, GLenum format, GLenum type, GLvoid* pixels)
    void c_glTexImage2D "glTexImage2D"(GLenum target, GLint level, GLint internalFormat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, GLvoid* pixels)
    void c_glGetTexImage "glGetTexImage"(GLenum target, GLint level, GLenum format, GLenum type, GLvoid* pixels)
    void c_glGenTextures "glGenTextures"(GLsizei n, GLuint* textures)
    void c_glDeleteTextures "glDeleteTextures"(GLsizei n, GLuint* textures)
    void c_glBindTexture "glBindTexture"(GLenum target, GLuint texture)
    void c_glPrioritizeTextures "glPrioritizeTextures"(GLsizei n, GLuint* textures, GLclampf* priorities)
    void c_glAreTexturesResident "glAreTexturesResident"(GLsizei n, GLuint* textures, GLboolean* residences)
    void c_glIsTexture "glIsTexture"(GLuint texture)
    void c_glTexSubImage1D "glTexSubImage1D"(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, GLvoid* pixels)
    void c_glTexSubImage2D "glTexSubImage2D"(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid* pixels)
    void c_glCopyTexImage1D "glCopyTexImage1D"(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border)
    void c_glCopyTexImage2D "glCopyTexImage2D"(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border)
    void c_glCopyTexSubImage1D "glCopyTexSubImage1D"(GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width)
    void c_glCopyTexSubImage2D "glCopyTexSubImage2D"(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)
    void c_glMap1d "glMap1d"(GLenum target, GLdouble u1, GLdouble u2, GLint stride, GLint order, GLdouble* points)
    void c_glMap1f "glMap1f"(GLenum target, GLfloat u1, GLfloat u2, GLint stride, GLint order, GLfloat* points)
    void c_glMap2d "glMap2d"(GLenum target, GLdouble u1, GLdouble u2, GLint ustride, GLint uorder, GLdouble v1, GLdouble v2, GLint vstride, GLint vorder, GLdouble* points)
    void c_glMap2f "glMap2f"(GLenum target, GLfloat u1, GLfloat u2, GLint ustride, GLint uorder, GLfloat v1, GLfloat v2, GLint vstride, GLint vorder, GLfloat* points)
    void c_glGetMapdv "glGetMapdv"(GLenum target, GLenum query, GLdouble* v)
    void c_glGetMapfv "glGetMapfv"(GLenum target, GLenum query, GLfloat* v)
    void c_glGetMapiv "glGetMapiv"(GLenum target, GLenum query, GLint* v)
    void c_glEvalCoord1d "glEvalCoord1d"(GLdouble u)
    void c_glEvalCoord1f "glEvalCoord1f"(GLfloat u)
    void c_glEvalCoord1dv "glEvalCoord1dv"(GLdouble* u)
    void c_glEvalCoord1fv "glEvalCoord1fv"(GLfloat* u)
    void c_glEvalCoord2d "glEvalCoord2d"(GLdouble u, GLdouble v)
    void c_glEvalCoord2f "glEvalCoord2f"(GLfloat u, GLfloat v)
    void c_glEvalCoord2dv "glEvalCoord2dv"(GLdouble* u)
    void c_glEvalCoord2fv "glEvalCoord2fv"(GLfloat* u)
    void c_glMapGrid1d "glMapGrid1d"(GLint un, GLdouble u1, GLdouble u2)
    void c_glMapGrid1f "glMapGrid1f"(GLint un, GLfloat u1, GLfloat u2)
    void c_glMapGrid2d "glMapGrid2d"(GLint un, GLdouble u1, GLdouble u2, GLint vn, GLdouble v1, GLdouble v2)
    void c_glMapGrid2f "glMapGrid2f"(GLint un, GLfloat u1, GLfloat u2, GLint vn, GLfloat v1, GLfloat v2)
    void c_glEvalPoint1 "glEvalPoint1"(GLint i)
    void c_glEvalPoint2 "glEvalPoint2"(GLint i, GLint j)
    void c_glEvalMesh1 "glEvalMesh1"(GLenum mode, GLint i1, GLint i2)
    void c_glEvalMesh2 "glEvalMesh2"(GLenum mode, GLint i1, GLint i2, GLint j1, GLint j2)
    void c_glFogf "glFogf"(GLenum pname, GLfloat param)
    void c_glFogi "glFogi"(GLenum pname, GLint param)
    void c_glFogfv "glFogfv"(GLenum pname, GLfloat* params)
    void c_glFogiv "glFogiv"(GLenum pname, GLint* params)
    void c_glFeedbackBuffer "glFeedbackBuffer"(GLsizei size, GLenum type, GLfloat* buffer)
    void c_glPassThrough "glPassThrough"(GLfloat token)
    void c_glSelectBuffer "glSelectBuffer"(GLsizei size, GLuint* buffer)
    void c_glInitNames "glInitNames"()
    void c_glLoadName "glLoadName"(GLuint name)
    void c_glPushName "glPushName"(GLuint name)
    void c_glPopName "glPopName"()
    void c_glDrawRangeElements "glDrawRangeElements"(GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, GLvoid* indices)
    void c_glTexImage3D "glTexImage3D"(GLenum target, GLint level, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, GLvoid* pixels)
    void c_glTexSubImage3D "glTexSubImage3D"(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLvoid* pixels)
    void c_glCopyTexSubImage3D "glCopyTexSubImage3D"(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height)
    void c_glColorTable "glColorTable"(GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, GLvoid* table)
    void c_glColorSubTable "glColorSubTable"(GLenum target, GLsizei start, GLsizei count, GLenum format, GLenum type, GLvoid* data)
    void c_glColorTableParameteriv "glColorTableParameteriv"(GLenum target, GLenum pname, GLint* params)
    void c_glColorTableParameterfv "glColorTableParameterfv"(GLenum target, GLenum pname, GLfloat* params)
    void c_glCopyColorSubTable "glCopyColorSubTable"(GLenum target, GLsizei start, GLint x, GLint y, GLsizei width)
    void c_glCopyColorTable "glCopyColorTable"(GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width)
    void c_glGetColorTable "glGetColorTable"(GLenum target, GLenum format, GLenum type, GLvoid* table)
    void c_glGetColorTableParameterfv "glGetColorTableParameterfv"(GLenum target, GLenum pname, GLfloat* params)
    void c_glGetColorTableParameteriv "glGetColorTableParameteriv"(GLenum target, GLenum pname, GLint* params)
    void c_glBlendEquation "glBlendEquation"(GLenum mode)
    void c_glBlendColor "glBlendColor"(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha)
    void c_glHistogram "glHistogram"(GLenum target, GLsizei width, GLenum internalformat, GLboolean sink)
    void c_glResetHistogram "glResetHistogram"(GLenum target)
    void c_glGetHistogram "glGetHistogram"(GLenum target, GLboolean reset, GLenum format, GLenum type, GLvoid* values)
    void c_glGetHistogramParameterfv "glGetHistogramParameterfv"(GLenum target, GLenum pname, GLfloat* params)
    void c_glGetHistogramParameteriv "glGetHistogramParameteriv"(GLenum target, GLenum pname, GLint* params)
    void c_glMinmax "glMinmax"(GLenum target, GLenum internalformat, GLboolean sink)
    void c_glResetMinmax "glResetMinmax"(GLenum target)
    void c_glGetMinmax "glGetMinmax"(GLenum target, GLboolean reset, GLenum format, GLenum types, GLvoid* values)
    void c_glGetMinmaxParameterfv "glGetMinmaxParameterfv"(GLenum target, GLenum pname, GLfloat* params)
    void c_glGetMinmaxParameteriv "glGetMinmaxParameteriv"(GLenum target, GLenum pname, GLint* params)
    void c_glConvolutionFilter1D "glConvolutionFilter1D"(GLenum target, GLenum internalformat, GLsizei width, GLenum format, GLenum type, GLvoid* image)
    void c_glConvolutionFilter2D "glConvolutionFilter2D"(GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid* image)
    void c_glConvolutionParameterf "glConvolutionParameterf"(GLenum target, GLenum pname, GLfloat params)
    void c_glConvolutionParameterfv "glConvolutionParameterfv"(GLenum target, GLenum pname, GLfloat* params)
    void c_glConvolutionParameteri "glConvolutionParameteri"(GLenum target, GLenum pname, GLint params)
    void c_glConvolutionParameteriv "glConvolutionParameteriv"(GLenum target, GLenum pname, GLint* params)
    void c_glCopyConvolutionFilter1D "glCopyConvolutionFilter1D"(GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width)
    void c_glCopyConvolutionFilter2D "glCopyConvolutionFilter2D"(GLenum target, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height)
    void c_glGetConvolutionFilter "glGetConvolutionFilter"(GLenum target, GLenum format, GLenum type, GLvoid* image)
    void c_glGetConvolutionParameterfv "glGetConvolutionParameterfv"(GLenum target, GLenum pname, GLfloat* params)
    void c_glGetConvolutionParameteriv "glGetConvolutionParameteriv"(GLenum target, GLenum pname, GLint* params)
    void c_glSeparableFilter2D "glSeparableFilter2D"(GLenum target, GLenum internalformat, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid* row, GLvoid* column)
    void c_glGetSeparableFilter "glGetSeparableFilter"(GLenum target, GLenum format, GLenum type, GLvoid* row, GLvoid* column, GLvoid* span)
    void c_glActiveTexture "glActiveTexture"(GLenum texture)
    void c_glClientActiveTexture "glClientActiveTexture"(GLenum texture)
    void c_glCompressedTexImage1D "glCompressedTexImage1D"(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, GLvoid* data)
    void c_glCompressedTexImage2D "glCompressedTexImage2D"(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, GLvoid* data)
    void c_glCompressedTexImage3D "glCompressedTexImage3D"(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, GLvoid* data)
    void c_glCompressedTexSubImage1D "glCompressedTexSubImage1D"(GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, GLvoid* data)
    void c_glCompressedTexSubImage2D "glCompressedTexSubImage2D"(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, GLvoid* data)
    void c_glCompressedTexSubImage3D "glCompressedTexSubImage3D"(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, GLvoid* data)
    void c_glGetCompressedTexImage "glGetCompressedTexImage"(GLenum target, GLint lod, GLvoid* img)
    void c_glMultiTexCoord1d "glMultiTexCoord1d"(GLenum target, GLdouble s)
    void c_glMultiTexCoord1dv "glMultiTexCoord1dv"(GLenum target, GLdouble* v)
    void c_glMultiTexCoord1f "glMultiTexCoord1f"(GLenum target, GLfloat s)
    void c_glMultiTexCoord1fv "glMultiTexCoord1fv"(GLenum target, GLfloat* v)
    void c_glMultiTexCoord1i "glMultiTexCoord1i"(GLenum target, GLint s)
    void c_glMultiTexCoord1iv "glMultiTexCoord1iv"(GLenum target, GLint* v)
    void c_glMultiTexCoord1s "glMultiTexCoord1s"(GLenum target, GLshort s)
    void c_glMultiTexCoord1sv "glMultiTexCoord1sv"(GLenum target, GLshort* v)
    void c_glMultiTexCoord2d "glMultiTexCoord2d"(GLenum target, GLdouble s, GLdouble t)
    void c_glMultiTexCoord2dv "glMultiTexCoord2dv"(GLenum target, GLdouble* v)
    void c_glMultiTexCoord2f "glMultiTexCoord2f"(GLenum target, GLfloat s, GLfloat t)
    void c_glMultiTexCoord2fv "glMultiTexCoord2fv"(GLenum target, GLfloat* v)
    void c_glMultiTexCoord2i "glMultiTexCoord2i"(GLenum target, GLint s, GLint t)
    void c_glMultiTexCoord2iv "glMultiTexCoord2iv"(GLenum target, GLint* v)
    void c_glMultiTexCoord2s "glMultiTexCoord2s"(GLenum target, GLshort s, GLshort t)
    void c_glMultiTexCoord2sv "glMultiTexCoord2sv"(GLenum target, GLshort* v)
    void c_glMultiTexCoord3d "glMultiTexCoord3d"(GLenum target, GLdouble s, GLdouble t, GLdouble r)
    void c_glMultiTexCoord3dv "glMultiTexCoord3dv"(GLenum target, GLdouble* v)
    void c_glMultiTexCoord3f "glMultiTexCoord3f"(GLenum target, GLfloat s, GLfloat t, GLfloat r)
    void c_glMultiTexCoord3fv "glMultiTexCoord3fv"(GLenum target, GLfloat* v)
    void c_glMultiTexCoord3i "glMultiTexCoord3i"(GLenum target, GLint s, GLint t, GLint r)
    void c_glMultiTexCoord3iv "glMultiTexCoord3iv"(GLenum target, GLint* v)
    void c_glMultiTexCoord3s "glMultiTexCoord3s"(GLenum target, GLshort s, GLshort t, GLshort r)
    void c_glMultiTexCoord3sv "glMultiTexCoord3sv"(GLenum target, GLshort* v)
    void c_glMultiTexCoord4d "glMultiTexCoord4d"(GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q)
    void c_glMultiTexCoord4dv "glMultiTexCoord4dv"(GLenum target, GLdouble* v)
    void c_glMultiTexCoord4f "glMultiTexCoord4f"(GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q)
    void c_glMultiTexCoord4fv "glMultiTexCoord4fv"(GLenum target, GLfloat* v)
    void c_glMultiTexCoord4i "glMultiTexCoord4i"(GLenum target, GLint s, GLint t, GLint r, GLint q)
    void c_glMultiTexCoord4iv "glMultiTexCoord4iv"(GLenum target, GLint* v)
    void c_glMultiTexCoord4s "glMultiTexCoord4s"(GLenum target, GLshort s, GLshort t, GLshort r, GLshort q)
    void c_glMultiTexCoord4sv "glMultiTexCoord4sv"(GLenum target, GLshort* v)
    void c_glSampleCoverage "glSampleCoverage"(GLclampf value, GLboolean invert)
    void c_glActiveTextureARB "glActiveTextureARB"(GLenum texture)
    void c_glClientActiveTextureARB "glClientActiveTextureARB"(GLenum texture)
    void c_glMultiTexCoord1dARB "glMultiTexCoord1dARB"(GLenum target, GLdouble s)
    void c_glMultiTexCoord1dvARB "glMultiTexCoord1dvARB"(GLenum target, GLdouble* v)
    void c_glMultiTexCoord1fARB "glMultiTexCoord1fARB"(GLenum target, GLfloat s)
    void c_glMultiTexCoord1fvARB "glMultiTexCoord1fvARB"(GLenum target, GLfloat* v)
    void c_glMultiTexCoord1iARB "glMultiTexCoord1iARB"(GLenum target, GLint s)
    void c_glMultiTexCoord1ivARB "glMultiTexCoord1ivARB"(GLenum target, GLint* v)
    void c_glMultiTexCoord1sARB "glMultiTexCoord1sARB"(GLenum target, GLshort s)
    void c_glMultiTexCoord1svARB "glMultiTexCoord1svARB"(GLenum target, GLshort* v)
    void c_glMultiTexCoord2dARB "glMultiTexCoord2dARB"(GLenum target, GLdouble s, GLdouble t)
    void c_glMultiTexCoord2dvARB "glMultiTexCoord2dvARB"(GLenum target, GLdouble* v)
    void c_glMultiTexCoord2fARB "glMultiTexCoord2fARB"(GLenum target, GLfloat s, GLfloat t)
    void c_glMultiTexCoord2fvARB "glMultiTexCoord2fvARB"(GLenum target, GLfloat* v)
    void c_glMultiTexCoord2iARB "glMultiTexCoord2iARB"(GLenum target, GLint s, GLint t)
    void c_glMultiTexCoord2ivARB "glMultiTexCoord2ivARB"(GLenum target, GLint* v)
    void c_glMultiTexCoord2sARB "glMultiTexCoord2sARB"(GLenum target, GLshort s, GLshort t)
    void c_glMultiTexCoord2svARB "glMultiTexCoord2svARB"(GLenum target, GLshort* v)
    void c_glMultiTexCoord3dARB "glMultiTexCoord3dARB"(GLenum target, GLdouble s, GLdouble t, GLdouble r)
    void c_glMultiTexCoord3dvARB "glMultiTexCoord3dvARB"(GLenum target, GLdouble* v)
    void c_glMultiTexCoord3fARB "glMultiTexCoord3fARB"(GLenum target, GLfloat s, GLfloat t, GLfloat r)
    void c_glMultiTexCoord3fvARB "glMultiTexCoord3fvARB"(GLenum target, GLfloat* v)
    void c_glMultiTexCoord3iARB "glMultiTexCoord3iARB"(GLenum target, GLint s, GLint t, GLint r)
    void c_glMultiTexCoord3ivARB "glMultiTexCoord3ivARB"(GLenum target, GLint* v)
    void c_glMultiTexCoord3sARB "glMultiTexCoord3sARB"(GLenum target, GLshort s, GLshort t, GLshort r)
    void c_glMultiTexCoord3svARB "glMultiTexCoord3svARB"(GLenum target, GLshort* v)
    void c_glMultiTexCoord4dARB "glMultiTexCoord4dARB"(GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q)
    void c_glMultiTexCoord4dvARB "glMultiTexCoord4dvARB"(GLenum target, GLdouble* v)
    void c_glMultiTexCoord4fARB "glMultiTexCoord4fARB"(GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q)
    void c_glMultiTexCoord4fvARB "glMultiTexCoord4fvARB"(GLenum target, GLfloat* v)
    void c_glMultiTexCoord4iARB "glMultiTexCoord4iARB"(GLenum target, GLint s, GLint t, GLint r, GLint q)
    void c_glMultiTexCoord4ivARB "glMultiTexCoord4ivARB"(GLenum target, GLint* v)
    void c_glMultiTexCoord4sARB "glMultiTexCoord4sARB"(GLenum target, GLshort s, GLshort t, GLshort r, GLshort q)
    void c_glMultiTexCoord4svARB "glMultiTexCoord4svARB"(GLenum target, GLshort* v)
    # void c_glCreateDebugObjectMESA "glCreateDebugObjectMESA"()
    # void c_glClearDebugLogMESA "glClearDebugLogMESA"(GLhandleARB obj, GLenum logType, GLenum shaderType)
    # void c_glGetDebugLogMESA "glGetDebugLogMESA"(GLhandleARB obj, GLenum logType, GLenum shaderType, GLsizei maxLength, GLsizei* length, GLcharARB* debugLog)
    # void c_glGetDebugLogLengthMESA "glGetDebugLogLengthMESA"(GLhandleARB obj, GLenum logType, GLenum shaderType)
    # void c_glProgramCallbackMESA "glProgramCallbackMESA"(GLenum target, GLprogramcallbackMESA callback, GLvoid* data)
    void c_glGetProgramRegisterfvMESA "glGetProgramRegisterfvMESA"(GLenum target, GLsizei len, GLubyte* name, GLfloat* v)
    void c_glFramebufferTextureLayerEXT "glFramebufferTextureLayerEXT"(GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer)
    # void c_glBlendEquationSeparateATI "glBlendEquationSeparateATI"(GLenum modeRGB, GLenum modeA)

def glClearIndex(c):
    c_glClearIndex(c)

def glClearColor(red, green, blue, alpha):
    c_glClearColor(red, green, blue, alpha)

def glClear(mask):
    c_glClear(mask)

def glIndexMask(mask):
    c_glIndexMask(mask)

def glColorMask(red, green, blue, alpha):
    c_glColorMask(red, green, blue, alpha)

def glAlphaFunc(func, ref):
    c_glAlphaFunc(func, ref)

def glBlendFunc(sfactor, dfactor):
    c_glBlendFunc(sfactor, dfactor)

def glLogicOp(opcode):
    c_glLogicOp(opcode)

def glCullFace(mode):
    c_glCullFace(mode)

def glFrontFace(mode):
    c_glFrontFace(mode)

def glPointSize(size):
    c_glPointSize(size)

def glLineWidth(width):
    c_glLineWidth(width)

def glLineStipple(factor, pattern):
    c_glLineStipple(factor, pattern)

def glPolygonMode(face, mode):
    c_glPolygonMode(face, mode)

def glPolygonOffset(factor, units):
    c_glPolygonOffset(factor, units)

def glEdgeFlag(flag):
    c_glEdgeFlag(flag)

def glScissor(x, y, width, height):
    c_glScissor(x, y, width, height)

def glDrawBuffer(mode):
    c_glDrawBuffer(mode)

def glReadBuffer(mode):
    c_glReadBuffer(mode)

def glEnable(cap):
    c_glEnable(cap)

def glDisable(cap):
    c_glDisable(cap)

def glIsEnabled(cap):
    c_glIsEnabled(cap)

def glEnableClientState(cap):
    c_glEnableClientState(cap)

def glDisableClientState(cap):
    c_glDisableClientState(cap)

def glPushAttrib(mask):
    c_glPushAttrib(mask)

def glPopAttrib():
    c_glPopAttrib()

def glPushClientAttrib(mask):
    c_glPushClientAttrib(mask)

def glPopClientAttrib():
    c_glPopClientAttrib()

def glRenderMode(mode):
    c_glRenderMode(mode)

def glGetError():
    c_glGetError()

def glGetString(name):
    c_glGetString(name)

def glFinish():
    c_glFinish()

def glFlush():
    c_glFlush()

def glHint(target, mode):
    c_glHint(target, mode)

def glClearDepth(depth):
    c_glClearDepth(depth)

def glDepthFunc(func):
    c_glDepthFunc(func)

def glDepthMask(flag):
    c_glDepthMask(flag)

def glDepthRange(near_val, far_val):
    c_glDepthRange(near_val, far_val)

def glClearAccum(red, green, blue, alpha):
    c_glClearAccum(red, green, blue, alpha)

def glAccum(op, value):
    c_glAccum(op, value)

def glMatrixMode(mode):
    c_glMatrixMode(mode)

def glOrtho(left, right, bottom, top, near_val, far_val):
    c_glOrtho(left, right, bottom, top, near_val, far_val)

def glFrustum(left, right, bottom, top, near_val, far_val):
    c_glFrustum(left, right, bottom, top, near_val, far_val)

def glViewport(x, y, width, height):
    c_glViewport(x, y, width, height)

def glPushMatrix():
    c_glPushMatrix()

def glPopMatrix():
    c_glPopMatrix()

def glLoadIdentity():
    c_glLoadIdentity()

def glRotated(angle, x, y, z):
    c_glRotated(angle, x, y, z)

def glRotatef(angle, x, y, z):
    c_glRotatef(angle, x, y, z)

def glScaled(x, y, z):
    c_glScaled(x, y, z)

def glScalef(x, y, z):
    c_glScalef(x, y, z)

def glTranslated(x, y, z):
    c_glTranslated(x, y, z)

def glTranslatef(x, y, z):
    c_glTranslatef(x, y, z)

def glIsList(list):
    c_glIsList(list)

def glDeleteLists(list, range):
    c_glDeleteLists(list, range)

def glGenLists(range):
    c_glGenLists(range)

def glNewList(list, mode):
    c_glNewList(list, mode)

def glEndList():
    c_glEndList()

def glCallList(list):
    c_glCallList(list)

def glListBase(base):
    c_glListBase(base)

def glBegin(mode):
    c_glBegin(mode)

def glEnd():
    c_glEnd()

def glVertex2d(x, y):
    c_glVertex2d(x, y)

def glVertex2f(x, y):
    c_glVertex2f(x, y)

def glVertex2i(x, y):
    c_glVertex2i(x, y)

def glVertex2s(x, y):
    c_glVertex2s(x, y)

def glVertex3d(x, y, z):
    c_glVertex3d(x, y, z)

def glVertex3f(x, y, z):
    c_glVertex3f(x, y, z)

def glVertex3i(x, y, z):
    c_glVertex3i(x, y, z)

def glVertex3s(x, y, z):
    c_glVertex3s(x, y, z)

def glVertex4d(x, y, z, w):
    c_glVertex4d(x, y, z, w)

def glVertex4f(x, y, z, w):
    c_glVertex4f(x, y, z, w)

def glVertex4i(x, y, z, w):
    c_glVertex4i(x, y, z, w)

def glVertex4s(x, y, z, w):
    c_glVertex4s(x, y, z, w)

def glNormal3b(nx, ny, nz):
    c_glNormal3b(nx, ny, nz)

def glNormal3d(nx, ny, nz):
    c_glNormal3d(nx, ny, nz)

def glNormal3f(nx, ny, nz):
    c_glNormal3f(nx, ny, nz)

def glNormal3i(nx, ny, nz):
    c_glNormal3i(nx, ny, nz)

def glNormal3s(nx, ny, nz):
    c_glNormal3s(nx, ny, nz)

def glIndexd(c):
    c_glIndexd(c)

def glIndexf(c):
    c_glIndexf(c)

def glIndexi(c):
    c_glIndexi(c)

def glIndexs(c):
    c_glIndexs(c)

def glIndexub(c):
    c_glIndexub(c)

def glColor3b(red, green, blue):
    c_glColor3b(red, green, blue)

def glColor3d(red, green, blue):
    c_glColor3d(red, green, blue)

def glColor3f(red, green, blue):
    c_glColor3f(red, green, blue)

def glColor3i(red, green, blue):
    c_glColor3i(red, green, blue)

def glColor3s(red, green, blue):
    c_glColor3s(red, green, blue)

def glColor3ub(red, green, blue):
    c_glColor3ub(red, green, blue)

def glColor3ui(red, green, blue):
    c_glColor3ui(red, green, blue)

def glColor3us(red, green, blue):
    c_glColor3us(red, green, blue)

def glColor4b(red, green, blue, alpha):
    c_glColor4b(red, green, blue, alpha)

def glColor4d(red, green, blue, alpha):
    c_glColor4d(red, green, blue, alpha)

def glColor4f(red, green, blue, alpha):
    c_glColor4f(red, green, blue, alpha)

def glColor4i(red, green, blue, alpha):
    c_glColor4i(red, green, blue, alpha)

def glColor4s(red, green, blue, alpha):
    c_glColor4s(red, green, blue, alpha)

def glColor4ub(red, green, blue, alpha):
    c_glColor4ub(red, green, blue, alpha)

def glColor4ui(red, green, blue, alpha):
    c_glColor4ui(red, green, blue, alpha)

def glColor4us(red, green, blue, alpha):
    c_glColor4us(red, green, blue, alpha)

def glTexCoord1d(s):
    c_glTexCoord1d(s)

def glTexCoord1f(s):
    c_glTexCoord1f(s)

def glTexCoord1i(s):
    c_glTexCoord1i(s)

def glTexCoord1s(s):
    c_glTexCoord1s(s)

def glTexCoord2d(s, t):
    c_glTexCoord2d(s, t)

def glTexCoord2f(s, t):
    c_glTexCoord2f(s, t)

def glTexCoord2i(s, t):
    c_glTexCoord2i(s, t)

def glTexCoord2s(s, t):
    c_glTexCoord2s(s, t)

def glTexCoord3d(s, t, r):
    c_glTexCoord3d(s, t, r)

def glTexCoord3f(s, t, r):
    c_glTexCoord3f(s, t, r)

def glTexCoord3i(s, t, r):
    c_glTexCoord3i(s, t, r)

def glTexCoord3s(s, t, r):
    c_glTexCoord3s(s, t, r)

def glTexCoord4d(s, t, r, q):
    c_glTexCoord4d(s, t, r, q)

def glTexCoord4f(s, t, r, q):
    c_glTexCoord4f(s, t, r, q)

def glTexCoord4i(s, t, r, q):
    c_glTexCoord4i(s, t, r, q)

def glTexCoord4s(s, t, r, q):
    c_glTexCoord4s(s, t, r, q)

def glRasterPos2d(x, y):
    c_glRasterPos2d(x, y)

def glRasterPos2f(x, y):
    c_glRasterPos2f(x, y)

def glRasterPos2i(x, y):
    c_glRasterPos2i(x, y)

def glRasterPos2s(x, y):
    c_glRasterPos2s(x, y)

def glRasterPos3d(x, y, z):
    c_glRasterPos3d(x, y, z)

def glRasterPos3f(x, y, z):
    c_glRasterPos3f(x, y, z)

def glRasterPos3i(x, y, z):
    c_glRasterPos3i(x, y, z)

def glRasterPos3s(x, y, z):
    c_glRasterPos3s(x, y, z)

def glRasterPos4d(x, y, z, w):
    c_glRasterPos4d(x, y, z, w)

def glRasterPos4f(x, y, z, w):
    c_glRasterPos4f(x, y, z, w)

def glRasterPos4i(x, y, z, w):
    c_glRasterPos4i(x, y, z, w)

def glRasterPos4s(x, y, z, w):
    c_glRasterPos4s(x, y, z, w)

def glRectd(x1, y1, x2, y2):
    c_glRectd(x1, y1, x2, y2)

def glRectf(x1, y1, x2, y2):
    c_glRectf(x1, y1, x2, y2)

def glRecti(x1, y1, x2, y2):
    c_glRecti(x1, y1, x2, y2)

def glRects(x1, y1, x2, y2):
    c_glRects(x1, y1, x2, y2)

def glArrayElement(i):
    c_glArrayElement(i)

def glDrawArrays(mode, first, count):
    c_glDrawArrays(mode, first, count)

def glShadeModel(mode):
    c_glShadeModel(mode)

def glLightf(light, pname, param):
    c_glLightf(light, pname, param)

def glLighti(light, pname, param):
    c_glLighti(light, pname, param)

def glLightModelf(pname, param):
    c_glLightModelf(pname, param)

def glLightModeli(pname, param):
    c_glLightModeli(pname, param)

def glMaterialf(face, pname, param):
    c_glMaterialf(face, pname, param)

def glMateriali(face, pname, param):
    c_glMateriali(face, pname, param)

def glColorMaterial(face, mode):
    c_glColorMaterial(face, mode)

def glPixelZoom(xfactor, yfactor):
    c_glPixelZoom(xfactor, yfactor)

def glPixelStoref(pname, param):
    c_glPixelStoref(pname, param)

def glPixelStorei(pname, param):
    c_glPixelStorei(pname, param)

def glPixelTransferf(pname, param):
    c_glPixelTransferf(pname, param)

def glPixelTransferi(pname, param):
    c_glPixelTransferi(pname, param)

def glCopyPixels(x, y, width, height, type):
    c_glCopyPixels(x, y, width, height, type)

def glStencilFunc(func, ref, mask):
    c_glStencilFunc(func, ref, mask)

def glStencilMask(mask):
    c_glStencilMask(mask)

def glStencilOp(fail, zfail, zpass):
    c_glStencilOp(fail, zfail, zpass)

def glClearStencil(s):
    c_glClearStencil(s)

def glTexGend(coord, pname, param):
    c_glTexGend(coord, pname, param)

def glTexGenf(coord, pname, param):
    c_glTexGenf(coord, pname, param)

def glTexGeni(coord, pname, param):
    c_glTexGeni(coord, pname, param)

def glTexEnvf(target, pname, param):
    c_glTexEnvf(target, pname, param)

def glTexEnvi(target, pname, param):
    c_glTexEnvi(target, pname, param)

def glTexParameterf(target, pname, param):
    c_glTexParameterf(target, pname, param)

def glTexParameteri(target, pname, param):
    c_glTexParameteri(target, pname, param)

def glBindTexture(target, texture):
    c_glBindTexture(target, texture)

def glIsTexture(texture):
    c_glIsTexture(texture)

def glCopyTexImage1D(target, level, internalformat, x, y, width, border):
    c_glCopyTexImage1D(target, level, internalformat, x, y, width, border)

def glCopyTexImage2D(target, level, internalformat, x, y, width, height, border):
    c_glCopyTexImage2D(target, level, internalformat, x, y, width, height, border)

def glCopyTexSubImage1D(target, level, xoffset, x, y, width):
    c_glCopyTexSubImage1D(target, level, xoffset, x, y, width)

def glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height):
    c_glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height)

def glEvalCoord1d(u):
    c_glEvalCoord1d(u)

def glEvalCoord1f(u):
    c_glEvalCoord1f(u)

def glEvalCoord2d(u, v):
    c_glEvalCoord2d(u, v)

def glEvalCoord2f(u, v):
    c_glEvalCoord2f(u, v)

def glMapGrid1d(un, u1, u2):
    c_glMapGrid1d(un, u1, u2)

def glMapGrid1f(un, u1, u2):
    c_glMapGrid1f(un, u1, u2)

def glMapGrid2d(un, u1, u2, vn, v1, v2):
    c_glMapGrid2d(un, u1, u2, vn, v1, v2)

def glMapGrid2f(un, u1, u2, vn, v1, v2):
    c_glMapGrid2f(un, u1, u2, vn, v1, v2)

def glEvalPoint1(i):
    c_glEvalPoint1(i)

def glEvalPoint2(i, j):
    c_glEvalPoint2(i, j)

def glEvalMesh1(mode, i1, i2):
    c_glEvalMesh1(mode, i1, i2)

def glEvalMesh2(mode, i1, i2, j1, j2):
    c_glEvalMesh2(mode, i1, i2, j1, j2)

def glFogf(pname, param):
    c_glFogf(pname, param)

def glFogi(pname, param):
    c_glFogi(pname, param)

def glPassThrough(token):
    c_glPassThrough(token)

def glInitNames():
    c_glInitNames()

def glLoadName(name):
    c_glLoadName(name)

def glPushName(name):
    c_glPushName(name)

def glPopName():
    c_glPopName()

def glCopyTexSubImage3D(target, level, xoffset, yoffset, zoffset, x, y, width, height):
    c_glCopyTexSubImage3D(target, level, xoffset, yoffset, zoffset, x, y, width, height)

def glCopyColorSubTable(target, start, x, y, width):
    c_glCopyColorSubTable(target, start, x, y, width)

def glCopyColorTable(target, internalformat, x, y, width):
    c_glCopyColorTable(target, internalformat, x, y, width)

def glBlendEquation(mode):
    c_glBlendEquation(mode)

def glBlendColor(red, green, blue, alpha):
    c_glBlendColor(red, green, blue, alpha)

def glHistogram(target, width, internalformat, sink):
    c_glHistogram(target, width, internalformat, sink)

def glResetHistogram(target):
    c_glResetHistogram(target)

def glMinmax(target, internalformat, sink):
    c_glMinmax(target, internalformat, sink)

def glResetMinmax(target):
    c_glResetMinmax(target)

def glConvolutionParameterf(target, pname, params):
    c_glConvolutionParameterf(target, pname, params)

def glConvolutionParameteri(target, pname, params):
    c_glConvolutionParameteri(target, pname, params)

def glCopyConvolutionFilter1D(target, internalformat, x, y, width):
    c_glCopyConvolutionFilter1D(target, internalformat, x, y, width)

def glCopyConvolutionFilter2D(target, internalformat, x, y, width, height):
    c_glCopyConvolutionFilter2D(target, internalformat, x, y, width, height)

def glActiveTexture(texture):
    c_glActiveTexture(texture)

def glClientActiveTexture(texture):
    c_glClientActiveTexture(texture)

def glMultiTexCoord1d(target, s):
    c_glMultiTexCoord1d(target, s)

def glMultiTexCoord1f(target, s):
    c_glMultiTexCoord1f(target, s)

def glMultiTexCoord1i(target, s):
    c_glMultiTexCoord1i(target, s)

def glMultiTexCoord1s(target, s):
    c_glMultiTexCoord1s(target, s)

def glMultiTexCoord2d(target, s, t):
    c_glMultiTexCoord2d(target, s, t)

def glMultiTexCoord2f(target, s, t):
    c_glMultiTexCoord2f(target, s, t)

def glMultiTexCoord2i(target, s, t):
    c_glMultiTexCoord2i(target, s, t)

def glMultiTexCoord2s(target, s, t):
    c_glMultiTexCoord2s(target, s, t)

def glMultiTexCoord3d(target, s, t, r):
    c_glMultiTexCoord3d(target, s, t, r)

def glMultiTexCoord3f(target, s, t, r):
    c_glMultiTexCoord3f(target, s, t, r)

def glMultiTexCoord3i(target, s, t, r):
    c_glMultiTexCoord3i(target, s, t, r)

def glMultiTexCoord3s(target, s, t, r):
    c_glMultiTexCoord3s(target, s, t, r)

def glMultiTexCoord4d(target, s, t, r, q):
    c_glMultiTexCoord4d(target, s, t, r, q)

def glMultiTexCoord4f(target, s, t, r, q):
    c_glMultiTexCoord4f(target, s, t, r, q)

def glMultiTexCoord4i(target, s, t, r, q):
    c_glMultiTexCoord4i(target, s, t, r, q)

def glMultiTexCoord4s(target, s, t, r, q):
    c_glMultiTexCoord4s(target, s, t, r, q)

def glSampleCoverage(value, invert):
    c_glSampleCoverage(value, invert)

def glActiveTextureARB(texture):
    c_glActiveTextureARB(texture)

def glClientActiveTextureARB(texture):
    c_glClientActiveTextureARB(texture)

def glMultiTexCoord1dARB(target, s):
    c_glMultiTexCoord1dARB(target, s)

def glMultiTexCoord1fARB(target, s):
    c_glMultiTexCoord1fARB(target, s)

def glMultiTexCoord1iARB(target, s):
    c_glMultiTexCoord1iARB(target, s)

def glMultiTexCoord1sARB(target, s):
    c_glMultiTexCoord1sARB(target, s)

def glMultiTexCoord2dARB(target, s, t):
    c_glMultiTexCoord2dARB(target, s, t)

def glMultiTexCoord2fARB(target, s, t):
    c_glMultiTexCoord2fARB(target, s, t)

def glMultiTexCoord2iARB(target, s, t):
    c_glMultiTexCoord2iARB(target, s, t)

def glMultiTexCoord2sARB(target, s, t):
    c_glMultiTexCoord2sARB(target, s, t)

def glMultiTexCoord3dARB(target, s, t, r):
    c_glMultiTexCoord3dARB(target, s, t, r)

def glMultiTexCoord3fARB(target, s, t, r):
    c_glMultiTexCoord3fARB(target, s, t, r)

def glMultiTexCoord3iARB(target, s, t, r):
    c_glMultiTexCoord3iARB(target, s, t, r)

def glMultiTexCoord3sARB(target, s, t, r):
    c_glMultiTexCoord3sARB(target, s, t, r)

def glMultiTexCoord4dARB(target, s, t, r, q):
    c_glMultiTexCoord4dARB(target, s, t, r, q)

def glMultiTexCoord4fARB(target, s, t, r, q):
    c_glMultiTexCoord4fARB(target, s, t, r, q)

def glMultiTexCoord4iARB(target, s, t, r, q):
    c_glMultiTexCoord4iARB(target, s, t, r, q)

def glMultiTexCoord4sARB(target, s, t, r, q):
    c_glMultiTexCoord4sARB(target, s, t, r, q)

def glFramebufferTextureLayerEXT(target, attachment, texture, level, layer):
    c_glFramebufferTextureLayerEXT(target, attachment, texture, level, layer)


def glLightfv(light, pname, params):
    cdef ndarray a = array(params, dtype="float32")
    c_glLightfv(light, pname, <GLfloat *> (&a.data[0]))

def glMaterialfv(face, pname, params):
    cdef ndarray a = array(params, dtype="float32")
    c_glMaterialfv(face, pname, <GLfloat *> (&a.data[0]))

