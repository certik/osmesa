cdef extern void render_image()
cdef extern void render_image2()
cdef extern void render_image3()
cdef extern int init_context(int w, int h)
cdef extern void free_context()

cdef extern void sph(double angle)
cdef extern void Sphere(float radius, int slices, int stacks)

def render():
    render_image()

def render2():
    render_image2()

def render3():
    render_image3()

def init_ctx(int width, int height):
    r = init_context(width, height)
    if r == -1:
        raise Exception("init_context failed")

def free_ctx():
    free_context()

def sphere(angle):
    sph(angle)

def sphere2(float radius, int slices, int stacks):
    Sphere(radius, slices, stacks)
