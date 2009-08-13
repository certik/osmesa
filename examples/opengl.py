#!/usr/bin/env python

'''Displays a rotating torus using OpenGL.

This example demonstrates:

 * Using a 3D projection on a window by overriding the default on_resize
   handler
 * Enabling multisampling if available
 * Drawing a simple 3D primitive using vertex and index arrays
 * Using a display list
 * Fixed-pipeline lighting

'''

from math import pi, sin, cos

from pyglet.gl import GLfloat, GLuint, gluPerspective
import pyglet

from gl import (GL_DEPTH_TEST, GL_CULL_FACE, GL_LIGHTING, GL_LIGHT0, GL_LIGHT1,
        GL_POSITION, GL_SPECULAR, GL_DIFFUSE, GL_FRONT_AND_BACK,
        GL_AMBIENT_AND_DIFFUSE, GL_SHININESS, GL_COMPILE,
        GL_CLIENT_VERTEX_ARRAY_BIT, GL_VERTEX_ARRAY, GL_NORMAL_ARRAY, GL_FLOAT,
        GL_TRIANGLES, GL_UNSIGNED_INT, GL_PROJECTION, GL_MODELVIEW,
        GL_COLOR_BUFFER_BIT, GL_DEPTH_BUFFER_BIT, GL_LINE)
import gl

try:
    # Try and create a window with multisampling (antialiasing)
    config = pyglet.gl.Config(sample_buffers=1, samples=4,
                    depth_size=16, double_buffer=True,)
    window = pyglet.window.Window(resizable=True, config=config)
except pyglet.window.NoSuchConfigException:
    # Fall back to no multisampling for old hardware
    window = pyglet.window.Window(resizable=True)

@window.event
def on_resize(width, height):
    # Override the default on_resize handler to create a 3D projection
    gl.glViewport(0, 0, width, height)
    gl.glMatrixMode(GL_PROJECTION)
    gl.glLoadIdentity()
    gluPerspective(60., width / float(height), .1, 1000.)
    gl.glMatrixMode(GL_MODELVIEW)
    return pyglet.event.EVENT_HANDLED

def update(dt):
    global rx, ry, rz
    rx += dt * 1
    ry += dt * 80
    rz += dt * 30
    rx %= 360
    ry %= 360
    rz %= 360
pyglet.clock.schedule(update)

@window.event
def on_draw():
    gl.glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    gl.glLoadIdentity()
    gl.glTranslatef(0, 0, -4)
    gl.glRotatef(rz, 0, 0, 1)
    gl.glRotatef(ry, 0, 1, 0)
    gl.glRotatef(rx, 1, 0, 0)
    torus.draw()

def setup():
    # One-time GL setup
    gl.glClearColor(1, 1, 1, 1)
    gl.glColor3f(1, 0, 0)
    gl.glEnable(GL_DEPTH_TEST)
    gl.glEnable(GL_CULL_FACE)

    # Simple light setup.  On Windows GL_LIGHT0 is enabled by default,
    # but this is not the case on Linux or Mac, so remember to always 
    # include it.
    gl.glEnable(GL_LIGHTING)
    gl.glEnable(GL_LIGHT0)
    gl.glEnable(GL_LIGHT1)

    gl.glLightfv(GL_LIGHT0, GL_POSITION, (.5, .5, 1, 0))
    gl.glLightfv(GL_LIGHT0, GL_SPECULAR, (.5, .5, 1, 1))
    gl.glLightfv(GL_LIGHT0, GL_DIFFUSE, (1, 1, 1, 1))
    gl.glLightfv(GL_LIGHT1, GL_POSITION, (1, 0, .5, 0))
    gl.glLightfv(GL_LIGHT1, GL_DIFFUSE, (.5, .5, .5, 1))
    gl.glLightfv(GL_LIGHT1, GL_SPECULAR, (1, 1, 1, 1))

    gl.glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, (0.5, 0, 0.3, 1))
    gl.glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, (1, 1, 1, 1))
    gl.glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, 50)

class Torus(object):
    def __init__(self, radius, inner_radius, slices, inner_slices):
        # Create the vertex and normal arrays.
        vertices = []
        normals = []

        u_step = 2 * pi / (slices - 1)
        v_step = 2 * pi / (inner_slices - 1)
        u = 0.
        for i in range(slices):
            cos_u = cos(u)
            sin_u = sin(u)
            v = 0.
            for j in range(inner_slices):
                cos_v = cos(v)
                sin_v = sin(v)

                d = (radius + inner_radius * cos_v)
                x = d * cos_u
                y = d * sin_u
                z = inner_radius * sin_v

                nx = cos_u * cos_v
                ny = sin_u * cos_v
                nz = sin_v

                vertices.extend([x, y, z])
                normals.extend([nx, ny, nz])
                v += v_step
            u += u_step

        # use numpy arrays and "ndarray" attribute in cython.
        vertices = gl.convert_float(vertices)
        normals = gl.convert_float(normals)

        # Create a list of triangle indices.
        indices = []
        for i in range(slices - 1):
            for j in range(inner_slices - 1):
                p = i * inner_slices + j
                indices.extend([p, p + inner_slices, p + inner_slices + 1])
                indices.extend([p,  p + inner_slices + 1, p + 1])

        # Compile a display list
        self.list = gl.glGenLists(1)
        gl.glNewList(self.list, GL_COMPILE)

        gl.glPushClientAttrib(GL_CLIENT_VERTEX_ARRAY_BIT)
        gl.glEnableClientState(GL_VERTEX_ARRAY)
        gl.glEnableClientState(GL_NORMAL_ARRAY)
        gl.glVertexPointer(3, GL_FLOAT, 0, vertices)
        gl.glNormalPointer(GL_FLOAT, 0, normals)
        gl.glDrawElements(GL_TRIANGLES, len(indices), GL_UNSIGNED_INT, indices)
        gl.glPopClientAttrib()

        gl.glEndList()

    def draw(self):
        gl.glCallList(self.list)

setup()
torus = Torus(1, 0.3, 50, 30)
rx = ry = rz = 0

pyglet.app.run()
