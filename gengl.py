#! /usr/bin/env python

from pyparsing import (Word, Combine, Optional, alphas, alphanums, oneOf,
        delimitedList, Group)

header = "/usr/include/GL/gl.h"
testdata = open(header).read()

ident = Word(alphas, alphanums + "_")
vartype = (Optional("const") + Combine(ident + Optional(Word("*")),
        adjacent = False))
arglist = delimitedList( Group(vartype.setResultsName("type") + \
        ident.setResultsName("name")) )
functionCall = ident.setResultsName("name") + \
        "(" + (arglist.setResultsName("args") | "void") + ")" + ";"
typedef = "typedef" + Optional("unsigned") + Optional("signed") + \
        ident + ident + ";"

print """cdef extern from "%s":""" % (header)
for fn, s, e in typedef.scanString(testdata):
    print "    ctypedef", " ".join(fn[1:-1])
print
py_functions = []
for fn, s, e in functionCall.scanString(testdata):
    func =   '    void c_%s "%s"(' % (fn.name, fn.name)
    pyfunc = "def %s(" % fn.name
    pyfunc_args = ""
    for a in fn.args:
        func += "%s %s, " % (a.type[-1], a.name)
        pyfunc_args += "%s, " % (a.name)
    if len(fn.args) > 0:
        func = func[:-2]
        pyfunc_args = pyfunc_args[:-2]
    func += ")"
    pyfunc += pyfunc_args+"):\n"
    pyfunc += "    c_%s(%s)\n" % (fn.name, pyfunc_args)
    print func
    py_functions.append(pyfunc)
print
for pyfunc in py_functions:
    print pyfunc
