all: opengl

opengl:
	#python gengl.py > opengl.pyx
	#python genglu.py >> opengl.pyx
	cython opengl.pyx
	gcc -fPIC -I/usr/include/python2.6 -c -o opengl.o opengl.c
	gcc -fPIC -c -o osdemo.o osdemo.c
	gcc -shared -o opengl.so opengl.o osdemo.o -lOSMesa -lGL -lGLU
