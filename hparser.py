#! /usr/bin/env python

from textwrap import dedent

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
        self._header_file = header_file
        self._data = open(header_file).read()

        self._known_types = []

    def get_header(self):
        return dedent("""\
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

        cdef extern from "%s":""" % (self._header_file))


    def parse_typedefs(self):
        ctypedefs = []
        for fn, s, e in typedef.scanString(self._data):
            if fn[1] == "struct":
                ctypedefs.append("    ctypedef " + " ".join(fn[1:3]))
            else:
                ctypedefs.append("    ctypedef " + " ".join(fn[1:-1]))
            self._known_types.append(fn[-2])
        return ctypedefs

    def parse_defines(self):
        defines = []
        wrappers = []
        for fn, s, e in define.scanString(self._data):
            id_define = fn[1]
            id_number = fn[2]
            defines.append('    int c_%s "%s"' % (id_define, id_define))
            wrappers.append("%s = c_%s" % (id_define, id_define))
        return defines, wrappers

    def parse_functions(self, functions_skip=[], functions_manual=[]):
        defines = []
        py_functions = []
        for fn, s, e in functionCall.scanString(self._data):
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
                if not a_type in self._known_types:
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
            defines.append(func)
            if not skip:
                py_functions.append(pyfunc)
        return defines, py_functions
