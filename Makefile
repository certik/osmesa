all: opengl

opengl:
	#python gengl.py > opengl.pyx
	#python genglu.py >> opengl.pyx
	cython opengl.pyx
	gcc -fPIC -I/usr/include/python2.6 -c -o opengl.o opengl.c
	gcc -shared -o opengl.so opengl.o -lOSMesa -lGL -lGLU
