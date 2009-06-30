cdef extern void render_image()
cdef extern int init_context(int w, int h)
cdef extern void free_context()

cdef extern void sph(double angle)

def render():
    render_image()

def init_ctx(int width, int height):
    r = init_context(width, height)
    if r == -1:
        raise Exception("init_context failed")

def free_ctx():
    free_context()

def sphere(angle):
    sph(angle)
