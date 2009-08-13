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

print h.get_header()
for ctypedef in h.parse_typedefs():
    print ctypedef
print
defines, wrappers = h.parse_defines()
for define in defines:
    print define
print
py_functions = h.parse_functions(functions_skip=functions_skip,
        functions_manual=functions_manual)
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
"""
print extra_code

