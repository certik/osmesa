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

ident = Word(alphas, alphanums + "_")
vartype = (Optional("const") + Combine(ident + Optional(Word("*")),
        adjacent = False))
arglist = delimitedList( Group(vartype.setResultsName("type") + \
        ident.setResultsName("name")) )
functionCall = ident.setResultsName("name") + \
        "(" + (arglist.setResultsName("args") | "void") + ")" + ";"
typedef = "typedef" + Optional("unsigned") + Optional("signed") + \
        ident + ident + ";"

known_types = []
print """\
from numpy import array
from numpy cimport ndarray
"""
print """cdef extern from "%s":""" % (header)
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
    func =   'void c_%s "%s"(' % (fn.name, fn.name)
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
"""
print extra_code

