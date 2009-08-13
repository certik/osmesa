#! /usr/bin/env python

from hparser import HParser

h_gl = HParser("/usr/include/GL/gl.h")
h_gl.parse_typedefs()
h = HParser("/usr/include/GL/glu.h")
# use the types from gl.h:
h._known_types = h_gl._known_types

print h.get_header()
for ctypedef in h.parse_typedefs():
    print ctypedef
print
defines, wrappers = h.parse_defines()
for define in defines:
    print define
print
functions_defines, py_functions = h.parse_functions()
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
