import pyglet
import osmesa

def vec(*args):
    return (GLfloat * len(args))(*args)


w = 400
h = 400

label = pyglet.text.Label('Hello, world',
                          font_name='Times New Roman',
                          font_size=36,
                          x=w//2, y=h//2,
                          anchor_x='center', anchor_y='center')

osmesa.init_ctx(w, h)
import pyglet.gl
from pyglet.gl import (glMatrixMode, glFinish, GL_PROJECTION, glLoadIdentity,
        glOrtho, glPushMatrix, GL_MODELVIEW, glRotatef, glTranslatef,
        glMaterialfv, GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, glPopMatrix,
        GLfloat)
osmesa.render()
blue_mat = vec(1, 1, 0, 1.0)
glMatrixMode(GL_PROJECTION)
glLoadIdentity()
glOrtho(-2.5, 2.5, -2.5, 2.5, -10.0, 10.0)
glMatrixMode(GL_MODELVIEW)

glPushMatrix()
angle = 19
glRotatef(angle, 1.0, 0.0, 0.0)
glPushMatrix()
glTranslatef(0.75, 0.0, -1.0)
glMaterialfv( GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, blue_mat )
osmesa.sphere2(1.0, 20, 20)
#label.draw()
#pyglet.graphics.draw_indexed(4, pyglet.gl.GL_TRIANGLES,
#    [0, 1, 2, 0, 2, 3],
#    ('v2i', (100, 100,
#             150, 100,
#             150, 150,
#             100, 150))
#)
glPopMatrix()
glPopMatrix()

glFinish()
osmesa.sphere(21)
osmesa.free_ctx()
