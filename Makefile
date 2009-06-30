PREFIX=$(SAGE_LOCAL)

all:
	cython osmesa.pyx
	gcc -Wfatal-errors -fPIC -I$(PREFIX)/include/python2.5 -c -o osmesa.o osmesa.c
	gcc -Wfatal-errors -fPIC -I$(PREFIX)/include -c -o osdemo.o osdemo.c
	gcc -Wfatal-errors -shared -o osmesa.so osmesa.o osdemo.o -lOSMesa -lGLU -lGL

