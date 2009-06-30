import pyglet
import osmesa

def vec(*args):
    return (GLfloat * len(args))(*args)

def sphere(radius, slices, stacks):
    q = gluNewQuadric();
    gluQuadricNormals(q, GLU_SMOOTH);
    gluSphere(q, radius, slices, stacks);
    gluDeleteQuadric(q);



w = 400
h = 400

label = pyglet.text.Label('Hello, world',
                          font_name='Times New Roman',
                          font_size=36,
                          x=w//2, y=h//2,
                          anchor_x='center', anchor_y='center')

osmesa.init_ctx(w, h)
#import pyglet.gl
from pyglet.gl import (glMatrixMode, glFinish, GL_PROJECTION, glLoadIdentity,
        glOrtho, glPushMatrix, GL_MODELVIEW, glRotatef, glTranslatef,
        glMaterialfv, GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, glPopMatrix,
        GLfloat, glFlush, gluNewQuadric, gluQuadricNormals, gluSphere,
        gluDeleteQuadric, GLU_SMOOTH)
osmesa.render()
blue_mat = vec(1, 1, 0.5, 1)

glPushMatrix()
glTranslatef(0.75, 0.0, 0)
glTranslatef(0.75, 0.0, 1.0)
glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, blue_mat)
sphere(1.0, 20, 4)
glPopMatrix()
#glFinish()

osmesa.sphere(180)
#osmesa.sphere2(0.5, 5, 5)
osmesa.free_ctx()
