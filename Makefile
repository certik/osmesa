all: gl glu

gl:
	python gengl.py > gl.pyx
	cython gl.pyx
	gcc -fPIC -I/usr/include/python2.6 -c -o gl.o gl.c
	gcc -fPIC -c -o osdemo.o osdemo.c
	gcc -shared -o gl.so gl.o osdemo.o -lOSMesa -lGL

glu:
	python genglu.py > glu.pyx
	cython glu.pyx
	gcc -fPIC -I/usr/include/python2.6 -c -o glu.o glu.c
	gcc -shared -o glu.so glu.o -lGL -lGLU
