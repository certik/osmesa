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
osmesa.render()

osmesa.free_ctx()
