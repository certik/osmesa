from pyglet.gl import (glClear, glLoadIdentity, glBegin, glVertex2f, glEnd,
        GL_COLOR_BUFFER_BIT, GL_TRIANGLES)

import pyglet
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
    # this segfaults:
    #osmesa.render()
    #pyglet.graphics.draw(2, pyglet.gl.GL_POINTS,
    #            ('v2i', (10, 15, 30, 35))
    #            )
    glClear(GL_COLOR_BUFFER_BIT)
    glLoadIdentity()
    glBegin(GL_TRIANGLES)
    glVertex2f(0, 0)
    glVertex2f(window.width, 0)
    glVertex2f(window.width, window.height)
    glEnd()
    label.draw()

pyglet.app.run()
