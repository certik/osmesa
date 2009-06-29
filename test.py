import pyglet
import pyglet.gl
import osmesa

window = pyglet.window.Window()
label = pyglet.text.Label('Hello, world',
                          font_name='Times New Roman',
                          font_size=36,
                          x=window.width//2, y=window.height//2,
                          anchor_x='center', anchor_y='center')

@window.event
def on_draw():
    window.clear()
    osmesa.render()
    label.draw()
    pyglet.graphics.draw_indexed(4, pyglet.gl.GL_TRIANGLES,
        [0, 1, 2, 0, 2, 3],
        ('v2i', (100, 100,
                 150, 100,
                 150, 150,
                 100, 150))
    )

pyglet.app.run()
