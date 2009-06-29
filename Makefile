all:
	gcc -c -o osdemo.o osdemo.c
	gcc -o osdemo osdemo.o -lOSMesa -lGLU
