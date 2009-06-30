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
typedef = "typedef" + Optional("unsigned") + ident + ident + ";"

print """cdef extern from "%s":""" % (header)
for fn, s, e in typedef.scanString(testdata):
    print "    ctypedef", " ".join(fn[1:-1])
print
i = 0
for fn, s, e in functionCall.scanString(testdata):
    i += 1
    if i > 3:
        break
    func = "    void %s c_%s(" % (fn.name, fn.name)
    for a in fn.args:
        func += "%s %s, " % (a.type[-1], a.name)
    if len(fn.args) > 0:
        func = func[:-2]
    func += ")"
    print func
