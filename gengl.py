#! /usr/bin/env python

from pyparsing import (Word, Combine, Optional, alphas, alphanums, oneOf,
        delimitedList, Group)

header = "/usr/include/GL/gl.h"
testdata = open(header).read()

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

ident = Word(alphas, alphanums + "_")
vartype = (Optional("const") + Combine(ident + Optional(Word("*")),
        adjacent = False))
arglist = delimitedList( Group(vartype.setResultsName("type") + \
        ident.setResultsName("name")) )
functionCall = "GLAPI" + ident.setResultsName("return_type") + "GLAPIENTRY" + \
        ident.setResultsName("name") + \
        "(" + (arglist.setResultsName("args") | "void") + ")" + ";"
typedef = "typedef" + Optional("unsigned") + Optional("signed") + \
        ident + ident + ";"

known_types = []
print """\
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

cdef extern from "%s":\
""" % (header)
for fn, s, e in typedef.scanString(testdata):
    print "    ctypedef", " ".join(fn[1:-1])
    known_types.append(fn[-2])
print
py_functions = []
for fn, s, e in functionCall.scanString(testdata):
    interface = True
    skip = False
    if fn.name in functions_skip:
        skip = True
        interface = False
    if fn.name in functions_manual:
        skip = True
    func =   '%s c_%s "%s"(' % (fn.return_type, fn.name, fn.name)
    pyfunc = "def %s(" % fn.name
    pyfunc_args = ""
    for a in fn.args:
        a_type = a.type[-1]
        if a_type[-1] == "*":
            # skip pointers for now
            skip = True
        if a_type[-1] == "*":
            a_type = a_type[:-1]
        if a_type[-1] == "*":
            a_type = a_type[:-1]
        if not a_type in known_types:
            skip = True
        func += "%s %s, " % (a.type[-1], a.name)
        pyfunc_args += "%s, " % (a.name)
    if len(fn.args) > 0:
        func = func[:-2]
        pyfunc_args = pyfunc_args[:-2]
    func += ")"
    pyfunc += pyfunc_args+"):\n"
    pyfunc += "    c_%s(%s)\n" % (fn.name, pyfunc_args)
    if skip and not interface:
        func = "# " + func
    func = "    " + func
    print func
    if not skip:
        py_functions.append(pyfunc)
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
"""
print extra_code

