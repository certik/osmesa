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
typedef = "typedef" + Optional("unsigned") + oneOf("int char short float void") + ident + ";"

print """cdef extern from "%s":""" % (header)
for fn, s, e in typedef.scanString(testdata):
    print "    ctypedef", " ".join(fn[1:-1])
#for fn, s, e in functionCall.scanString(testdata):
#    print fn.name, fn.return_type
#    for a in fn.args:
#        print " -", a.type, a.name
