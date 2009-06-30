#! /usr/bin/env python

from pyparsing import (Word, Combine, Optional, alphas, alphanums, oneOf,
        delimitedList, Group)

testdata = open("/usr/include/GL/gl.h").read()

ident = Word(alphas, alphanums + "_")
vartype = Optional(Word("const")) + Combine(ident + Optional(Word("*")),
        adjacent = False)
arglist = delimitedList( Group(vartype.setResultsName("type") + \
        ident.setResultsName("name")) )
functionCall = ident.setResultsName("name") + \
        "(" + arglist.setResultsName("args") + ")" + ";"

for fn, s, e in functionCall.scanString(testdata):
    print fn.name, fn.return_type
    for a in fn.args:
        print " -", a.type, a.name
