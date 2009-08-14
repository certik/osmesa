#! /usr/bin/env python

from hparser import HParser

h = HParser("/usr/include/GL/gl.h")

functions_skip = [
        "glCreateDebugObjectMESA",
        "glProgramCallbackMESA",
        "glClearDebugLogMESA",
        "glGetDebugLogMESA",
        "glGetDebugLogLengthMESA",
        "glBlendEquationSeparateATI",
        ]

functions_manual = [
        "glGenLists",
        ]

print """\
cdef extern from "stdlib.h":
    ctypedef unsigned long size_t
    void *malloc (size_t size)
    void free(void *mem)
    void *memcpy(void *dst, void *src, long n)
"""

print h.get_header()
for ctypedef in h.parse_typedefs():
    print ctypedef
print
defines, wrappers = h.parse_defines()
for define in defines:
    print define
print
functions_defines, py_functions = h.parse_functions(
        functions_skip=functions_skip,
        functions_manual=functions_manual
        )
for define in functions_defines:
    print define
print
print
print "# " + "-"*15 +" Wrappers " + "-"*15
print
for define in wrappers:
    print define
print
for pyfunc in py_functions:
    print pyfunc
print
extra_code = """\
def glLightfv(light, pname, params):
    cdef ndarray a = array(params, dtype="float32")
    c_glLightfv(light, pname, <GLfloat *> (&a.data[0]))

def glMaterialfv(face, pname, params):
    cdef ndarray a = array(params, dtype="float32")
    c_glMaterialfv(face, pname, <GLfloat *> (&a.data[0]))

def glNormalPointer(type, stride, ptr):
    # this only works if type == GL_FLOAT
    #cdef ndarray a = array(ptr, dtype="float32")
    #print a
    #print a.strides[0]
    #c_glNormalPointer(type, stride, <GLvoid *> (&a.data[0]))
    c_glNormalPointer(type, stride, <GLvoid *> ((<CDataObject *>ptr).b_ptr))

def glVertexPointer(size, type, stride, ptr):
    #cdef ndarray a = array(ptr, dtype="float32")
    #c_glVertexPointer(size, type, stride, <GLvoid *> (&a.data[0]))
    #from ctypes import c_float
    #ptr = (c_float * len(ptr))(*ptr)
    c_glVertexPointer(size, type, stride, <GLvoid *> ((<CDataObject *>ptr).b_ptr))

def glDrawElements(mode, count, type, indices):
    cdef ndarray a = array(indices, dtype="uint32")
    c_glDrawElements(mode, count, type, <GLvoid *> (&a.data[0]))

def glGenLists(range):
    return c_glGenLists(range)

def convert_float(ptr):
    \"\"\"
    Converts a python sequence of floats to a ctype float array.
    \"\"\"
    from ctypes import c_float
    return (c_float * len(ptr))(*ptr)

cdef ndarray array_int_c2numpy(int *A, int len):
    from numpy import empty
    cdef ndarray vec = empty([len], dtype="uint8")
    cdef int *pvec = <int *>vec.data
    memcpy(pvec, A, len*sizeof(char))
    return vec

cdef extern from "GL/osmesa.h":
    int OSMESA_RGBA
    int GL_UNSIGNED_BYTE
    ctypedef struct OSMesaContext:
        pass
    OSMesaContext OSMesaCreateContextExt(...)
    void OSMesaDestroyContext(...)
    void OSMesaMakeCurrent(...)

cdef class Context:
    cdef OSMesaContext _ctx
    cdef void *_buffer
    cdef int _w
    cdef int _h

    def __init__(self, int w, int h):
        self._w = w
        self._h = h
        self._ctx = OSMesaCreateContextExt(OSMESA_RGBA, 16, 0, 0, NULL);
        self._buffer = malloc(w * h * 4 * sizeof(GLubyte))
        OSMesaMakeCurrent(self._ctx, self._buffer, GL_UNSIGNED_BYTE, w, h)

    def __del__(self):
        free(self._buffer)
        OSMesaDestroyContext(self._ctx)

    def get_buffer(self):
        return array_int_c2numpy(<int *>(self._buffer), self._w * self._h * 4)
"""
print extra_code

