import osmesa
import gl

w = 400
h = 400

osmesa.init_ctx(w, h)
osmesa.render()
#gl.glLightfv(gl.GL_LIGHT0, gl.GL_AMBIENT, [0, 0, 0, 1]);
#gl.glLightfv(gl.GL_LIGHT0, gl.GL_POSITION, [1, 1, 1, 0]);

#gl.glEnable(gl.GL_LIGHTING);
#gl.glEnable(gl.GL_LIGHT0);
#gl.glEnable(gl.GL_DEPTH_TEST);

#gl.glMatrixMode(gl.GL_PROJECTION);
#gl.glLoadIdentity();
#gl.glOrtho(-2.5, 2.5, -2.5, 2.5, -10.0, 10.0);
#gl.glMatrixMode(gl.GL_MODELVIEW);

#gl.glClearColor(1, 1, 0.8, 1);
#gl.glClear( gl.GL_COLOR_BUFFER_BIT | gl.GL_DEPTH_BUFFER_BIT );


#gl.glPushMatrix();
#gl.glTranslatef(-1.5,0.0,-5.);
#gl.glMaterialfv( gl.GL_FRONT_AND_BACK, gl.GL_AMBIENT_AND_DIFFUSE,
#[1.0, 0.2, 0.2, 1.0] );
#gl.glBegin(gl.GL_TRIANGLES);
#gl.glColor3f(1., 0., .0);
#gl.glVertex3f( 0.0, 1.0, 0.0);
#gl.glColor3f(.0, 1., .0);
#gl.glVertex3f(-1.0,-1.0, 0.0);
#gl.glVertex3f( 1.0,-1.0, 0.0);
#gl.glEnd();
#gl.glPushMatrix()
#gl.glTranslatef(0.0,1.0,0.0);
#gl.glBegin(gl.GL_QUADS);
#gl.glVertex3f(-1.0, 1.0, 0.0);
#gl.glVertex3f( 1.0, 1.0, 0.0);
#gl.glVertex3f( 1.0,-1.0, 0.0);
#gl.glVertex3f(-1.0,-1.0, 0.0);
#gl.glEnd();
#gl.glPopMatrix();


#gl.glFinish();
osmesa.render2()

osmesa.free_ctx()
