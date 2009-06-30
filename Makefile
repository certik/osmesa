all:
	cython osmesa.pyx
	gcc -fPIC -I/usr/include/python2.6 -c -o osmesa.o osmesa.c
	gcc -fPIC -c -o osdemo.o osdemo.c
	gcc -shared -o osmesa.so osmesa.o osdemo.o -lOSMesa -lGLU -lGL

