import pyglet
import osmesa

w = 400
h = 400

#label = pyglet.text.Label('Hello, world',
#                          font_name='Times New Roman',
#                          font_size=36,
#                          x=w//2, y=h//2,
#                          anchor_x='center', anchor_y='center')

osmesa.init_ctx(w, h)
import pyglet.gl
osmesa.render()
osmesa.sphere(19)
#label.draw()
pyglet.graphics.draw_indexed(4, pyglet.gl.GL_TRIANGLES,
    [0, 1, 2, 0, 2, 3],
    ('v2i', (100, 100,
             150, 100,
             150, 150,
             100, 150))
)
osmesa.free_ctx()
