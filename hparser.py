#! /usr/bin/env python

from pyparsing import (Word, Combine, Optional, alphas, alphanums, oneOf,
        delimitedList, Group)

ident = Word(alphas, alphanums + "_")
oct_number = Combine("0x" + Word(alphanums))
vartype = (Optional("const") + Combine(ident + Optional(Word("*")),
        adjacent = False))
arglist = delimitedList( Group(vartype.setResultsName("type") + \
        ident.setResultsName("name")) )
functionCall = "GLAPI" + ident.setResultsName("return_type") + "GLAPIENTRY" + \
        ident.setResultsName("name") + \
        "(" + (arglist.setResultsName("args") | "void") + ")" + ";"
typedef = "typedef" + Optional("unsigned") + Optional("signed") + \
        Optional("struct") + ident + ident + ";"
define = "#define" + ident + oct_number

class HParser(object):
    """
    Parser for the C header files.

    It returns the list of all defines, typedefs and functions, as well as
    their cython wrappers.
    """

    def __init__(self, header_file):
        self._data = open(header_file).read()

        self._known_types = []
        self._defines = []

    def parse_typedef(self):
        for fn, s, e in typedef.scanString(self._data):
            if fn[1] == "struct":
                print "    ctypedef", " ".join(fn[1:3])
            else:
                print "    ctypedef", " ".join(fn[1:-1])
            known_types.append(fn[-2])

    def parse_defines(self):
        for fn, s, e in define.scanString(self._testdata):
            id_define = fn[1]
            id_number = fn[2]
            defines.append("%s = c_%s" % (id_define, id_define))
            print '    int c_%s "%s"' % (id_define, id_define)

    def parse_functions(self):
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
            return py_functions
