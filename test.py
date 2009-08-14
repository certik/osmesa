import osmesa
import gl

def vec(*args):
    return (GLfloat * len(args))(*args)

def sphere(radius, slices, stacks):
    q = gluNewQuadric();
    gluQuadricNormals(q, GLU_SMOOTH);
    gluSphere(q, radius, slices, stacks);
    gluDeleteQuadric(q);



w = 400
h = 400

osmesa.init_ctx(w, h)
light_ambient = [ 0.0, 0.0, 0.0, 1.0 ]
light_diffuse = [ 1.0, 1.0, 1.0, 1.0 ]
light_specular = [ 1.0, 1.0, 1.0, 1.0 ]
light_position = [ 1.0, 1.0, 1.0, 0.0 ]

gl.glLightfv(gl.GL_LIGHT0, gl.GL_AMBIENT, light_ambient);
gl.glLightfv(gl.GL_LIGHT0, gl.GL_DIFFUSE, light_diffuse);
gl.glLightfv(gl.GL_LIGHT0, gl.GL_SPECULAR, light_specular);
gl.glLightfv(gl.GL_LIGHT0, gl.GL_POSITION, light_position);

gl.glEnable(gl.GL_LIGHTING);
gl.glEnable(gl.GL_LIGHT0);
gl.glEnable(gl.GL_DEPTH_TEST);
gl.glFinish()

gl.glClearColor (0.0, 0.0, 0.0, 0.0);
gl.glClear(gl.GL_COLOR_BUFFER_BIT)
gl.glColor3f (1.0, 1.0, 1.0)
gl.glOrtho(0.0, 1.0, 0.0, 1.0, -1.0, 1.0)
gl.glBegin(gl.GL_POLYGON)
gl.glVertex3f(0.25, 0.25, 0.0)
gl.glVertex3f(0.75, 0.25, 0.0)
gl.glVertex3f(0.75, 0.75, 0.0)
gl.glVertex3f(0.25, 0.75, 0.0)
gl.glEnd()
gl.glFlush()
gl.glFinish()

osmesa.free_ctx()
