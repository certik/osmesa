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

cdef extern void * get_buffer()
cdef extern int get_width()
cdef extern int get_height()

cdef ndarray array_int_c2numpy(int *A, int len):
    from numpy import empty
    cdef ndarray vec = empty([len], dtype="uint8")
    cdef int *pvec = <int *>vec.data
    memcpy(pvec, A, len*sizeof(char))
    return vec

def py_get_buffer():
    w = get_width()
    h = get_height()
    return array_int_c2numpy(<int *>(get_buffer()), w*h*4)

cdef extern int init_context(int w, int h)
cdef extern void free_context()

def init_ctx(int width, int height):
    r = init_context(width, height)
    if r == -1:
        raise Exception("init_context failed")

def free_ctx():
    free_context()
"""
print extra_code

