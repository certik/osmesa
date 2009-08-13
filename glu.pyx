from numpy import array
from numpy cimport ndarray

cdef extern from "Python.h":
    ctypedef void PyTypeObject

cdef struct CDataObject:
    # The first 2 members very much depends on the current content of the
    # "PyObject_HEAD" macro in Python. Once it changes, the code below will
    # segfault.
    Py_ssize_t ob_refcnt
    PyTypeObject *ob_type
    char *b_ptr

cdef extern from "/usr/include/GL/glu.h":
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
    ctypedef struct GLUnurbs
    ctypedef struct GLUquadric
    ctypedef struct GLUtesselator
    ctypedef GLUnurbs GLUnurbsObj
    ctypedef GLUquadric GLUquadricObj
    ctypedef GLUtesselator GLUtesselatorObj
    ctypedef GLUtesselator GLUtriangulatorObj


    void c_gluBeginCurve "gluBeginCurve"(GLUnurbs* nurb)
    void c_gluBeginPolygon "gluBeginPolygon"(GLUtesselator* tess)
    void c_gluBeginSurface "gluBeginSurface"(GLUnurbs* nurb)
    void c_gluBeginTrim "gluBeginTrim"(GLUnurbs* nurb)
    GLint c_gluBuild1DMipmapLevels "gluBuild1DMipmapLevels"(GLenum target, GLint internalFormat, GLsizei width, GLenum format, GLenum type, GLint level, GLint base, GLint max, void* data)
    GLint c_gluBuild1DMipmaps "gluBuild1DMipmaps"(GLenum target, GLint internalFormat, GLsizei width, GLenum format, GLenum type, void* data)
    GLint c_gluBuild2DMipmapLevels "gluBuild2DMipmapLevels"(GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLenum format, GLenum type, GLint level, GLint base, GLint max, void* data)
    GLint c_gluBuild2DMipmaps "gluBuild2DMipmaps"(GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLenum format, GLenum type, void* data)
    GLint c_gluBuild3DMipmapLevels "gluBuild3DMipmapLevels"(GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLint level, GLint base, GLint max, void* data)
    GLint c_gluBuild3DMipmaps "gluBuild3DMipmaps"(GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, void* data)
    GLboolean c_gluCheckExtension "gluCheckExtension"(GLubyte* extName, GLubyte* extString)
    void c_gluCylinder "gluCylinder"(GLUquadric* quad, GLdouble base, GLdouble top, GLdouble height, GLint slices, GLint stacks)
    void c_gluDeleteNurbsRenderer "gluDeleteNurbsRenderer"(GLUnurbs* nurb)
    void c_gluDeleteQuadric "gluDeleteQuadric"(GLUquadric* quad)
    void c_gluDeleteTess "gluDeleteTess"(GLUtesselator* tess)
    void c_gluDisk "gluDisk"(GLUquadric* quad, GLdouble inner, GLdouble outer, GLint slices, GLint loops)
    void c_gluEndCurve "gluEndCurve"(GLUnurbs* nurb)
    void c_gluEndPolygon "gluEndPolygon"(GLUtesselator* tess)
    void c_gluEndSurface "gluEndSurface"(GLUnurbs* nurb)
    void c_gluEndTrim "gluEndTrim"(GLUnurbs* nurb)
    void c_gluGetNurbsProperty "gluGetNurbsProperty"(GLUnurbs* nurb, GLenum property, GLfloat* data)
    void c_gluGetTessProperty "gluGetTessProperty"(GLUtesselator* tess, GLenum which, GLdouble* data)
    void c_gluLoadSamplingMatrices "gluLoadSamplingMatrices"(GLUnurbs* nurb, GLfloat* model, GLfloat* perspective, GLint* view)
    void c_gluLookAt "gluLookAt"(GLdouble eyeX, GLdouble eyeY, GLdouble eyeZ, GLdouble centerX, GLdouble centerY, GLdouble centerZ, GLdouble upX, GLdouble upY, GLdouble upZ)
    void c_gluNextContour "gluNextContour"(GLUtesselator* tess, GLenum type)
    void c_gluNurbsCallbackData "gluNurbsCallbackData"(GLUnurbs* nurb, GLvoid* userData)
    void c_gluNurbsCallbackDataEXT "gluNurbsCallbackDataEXT"(GLUnurbs* nurb, GLvoid* userData)
    void c_gluNurbsCurve "gluNurbsCurve"(GLUnurbs* nurb, GLint knotCount, GLfloat* knots, GLint stride, GLfloat* control, GLint order, GLenum type)
    void c_gluNurbsProperty "gluNurbsProperty"(GLUnurbs* nurb, GLenum property, GLfloat value)
    void c_gluNurbsSurface "gluNurbsSurface"(GLUnurbs* nurb, GLint sKnotCount, GLfloat* sKnots, GLint tKnotCount, GLfloat* tKnots, GLint sStride, GLint tStride, GLfloat* control, GLint sOrder, GLint tOrder, GLenum type)
    void c_gluOrtho2D "gluOrtho2D"(GLdouble left, GLdouble right, GLdouble bottom, GLdouble top)
    void c_gluPartialDisk "gluPartialDisk"(GLUquadric* quad, GLdouble inner, GLdouble outer, GLint slices, GLint loops, GLdouble start, GLdouble sweep)
    void c_gluPerspective "gluPerspective"(GLdouble fovy, GLdouble aspect, GLdouble zNear, GLdouble zFar)
    void c_gluPickMatrix "gluPickMatrix"(GLdouble x, GLdouble y, GLdouble delX, GLdouble delY, GLint* viewport)
    GLint c_gluProject "gluProject"(GLdouble objX, GLdouble objY, GLdouble objZ, GLdouble* model, GLdouble* proj, GLint* view, GLdouble* winX, GLdouble* winY, GLdouble* winZ)
    void c_gluPwlCurve "gluPwlCurve"(GLUnurbs* nurb, GLint count, GLfloat* data, GLint stride, GLenum type)
    void c_gluQuadricDrawStyle "gluQuadricDrawStyle"(GLUquadric* quad, GLenum draw)
    void c_gluQuadricNormals "gluQuadricNormals"(GLUquadric* quad, GLenum normal)
    void c_gluQuadricOrientation "gluQuadricOrientation"(GLUquadric* quad, GLenum orientation)
    void c_gluQuadricTexture "gluQuadricTexture"(GLUquadric* quad, GLboolean texture)
    GLint c_gluScaleImage "gluScaleImage"(GLenum format, GLsizei wIn, GLsizei hIn, GLenum typeIn, void* dataIn, GLsizei wOut, GLsizei hOut, GLenum typeOut, GLvoid* dataOut)
    void c_gluSphere "gluSphere"(GLUquadric* quad, GLdouble radius, GLint slices, GLint stacks)
    void c_gluTessBeginContour "gluTessBeginContour"(GLUtesselator* tess)
    void c_gluTessBeginPolygon "gluTessBeginPolygon"(GLUtesselator* tess, GLvoid* data)
    void c_gluTessEndContour "gluTessEndContour"(GLUtesselator* tess)
    void c_gluTessEndPolygon "gluTessEndPolygon"(GLUtesselator* tess)
    void c_gluTessNormal "gluTessNormal"(GLUtesselator* tess, GLdouble valueX, GLdouble valueY, GLdouble valueZ)
    void c_gluTessProperty "gluTessProperty"(GLUtesselator* tess, GLenum which, GLdouble data)
    void c_gluTessVertex "gluTessVertex"(GLUtesselator* tess, GLdouble* location, GLvoid* data)
    GLint c_gluUnProject "gluUnProject"(GLdouble winX, GLdouble winY, GLdouble winZ, GLdouble* model, GLdouble* proj, GLint* view, GLdouble* objX, GLdouble* objY, GLdouble* objZ)
    GLint c_gluUnProject4 "gluUnProject4"(GLdouble winX, GLdouble winY, GLdouble winZ, GLdouble clipW, GLdouble* model, GLdouble* proj, GLint* view, GLdouble nearVal, GLdouble farVal, GLdouble* objX, GLdouble* objY, GLdouble* objZ, GLdouble* objW)


# --------------- Wrappers ---------------


def gluLookAt(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ):
    c_gluLookAt(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)

def gluOrtho2D(left, right, bottom, top):
    c_gluOrtho2D(left, right, bottom, top)

def gluPerspective(fovy, aspect, zNear, zFar):
    c_gluPerspective(fovy, aspect, zNear, zFar)

