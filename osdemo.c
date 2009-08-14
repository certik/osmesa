/*
 * Demo of off-screen Mesa rendering
 *
 * See Mesa/include/GL/osmesa.h for documentation of the OSMesa functions.
 *
 * If you want to render BIG images you'll probably have to increase
 * MAX_WIDTH and MAX_Height in src/config.h.
 *
 * This program is in the public domain.
 *
 * Brian Paul
 *
 * PPM output provided by Joerg Schmalzl.
 * ASCII PPM output added by Brian Paul.
 *
 * Usage: osdemo [filename]
 */


#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "GL/osmesa.h"
#include "GL/glu.h"

void Sphere(float radius, int slices, int stacks)
{
   GLUquadric *q = gluNewQuadric();
   gluQuadricNormals(q, GLU_SMOOTH);
   gluSphere(q, radius, slices, stacks);
   gluDeleteQuadric(q);
}


static void
Cone(float base, float height, int slices, int stacks)
{
   GLUquadric *q = gluNewQuadric();
   gluQuadricDrawStyle(q, GLU_FILL);
   gluQuadricNormals(q, GLU_SMOOTH);
   gluCylinder(q, base, 0.0, height, slices, stacks);
   gluDeleteQuadric(q);
}


static void
Torus(float innerRadius, float outerRadius, int sides, int rings)
{
   /* from GLUT... */
   int i, j;
   GLfloat theta, phi, theta1;
   GLfloat cosTheta, sinTheta;
   GLfloat cosTheta1, sinTheta1;
   const GLfloat ringDelta = 2.0 * M_PI / rings;
   const GLfloat sideDelta = 2.0 * M_PI / sides;

   theta = 0.0;
   cosTheta = 1.0;
   sinTheta = 0.0;
   for (i = rings - 1; i >= 0; i--) {
      theta1 = theta + ringDelta;
      cosTheta1 = cos(theta1);
      sinTheta1 = sin(theta1);
      glBegin(GL_QUAD_STRIP);
      phi = 0.0;
      for (j = sides; j >= 0; j--) {
         GLfloat cosPhi, sinPhi, dist;

         phi += sideDelta;
         cosPhi = cos(phi);
         sinPhi = sin(phi);
         dist = outerRadius + innerRadius * cosPhi;

         glNormal3f(cosTheta1 * cosPhi, -sinTheta1 * cosPhi, sinPhi);
         glVertex3f(cosTheta1 * dist, -sinTheta1 * dist, innerRadius * sinPhi);
         glNormal3f(cosTheta * cosPhi, -sinTheta * cosPhi, sinPhi);
         glVertex3f(cosTheta * dist, -sinTheta * dist,  innerRadius * sinPhi);
      }
      glEnd();
      theta = theta1;
      cosTheta = cosTheta1;
      sinTheta = sinTheta1;
   }
}


void render_image(void)
{
   GLfloat light_ambient[] = { 0.0, 0.0, 0.0, 1.0 };
   GLfloat light_diffuse[] = { 1.0, 1.0, 1.0, 1.0 };
   GLfloat light_specular[] = { 1.0, 1.0, 1.0, 1.0 };
   GLfloat light_position[] = { 1.0, 1.0, 1.0, 0.0 };
   GLfloat red_mat[]   = { 1.0, 0.2, 0.2, 1.0 };
   GLfloat green_mat[] = { 0.2, 1.0, 0.2, 1.0 };
   GLfloat blue_mat[]  = { 0.2, 0.2, 1.0, 1.0 };


   glLightfv(GL_LIGHT0, GL_AMBIENT, light_ambient);
   glLightfv(GL_LIGHT0, GL_POSITION, light_position);

   glEnable(GL_LIGHTING);
   glEnable(GL_LIGHT0);
   glEnable(GL_DEPTH_TEST);

   glMatrixMode(GL_PROJECTION);
   glLoadIdentity();
   glOrtho(-2.5, 2.5, -2.5, 2.5, -10.0, 10.0);
   glMatrixMode(GL_MODELVIEW);

   glClearColor(1, 1, 0.8, 1);
   glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );

   glPushMatrix();
  glTranslatef(-1.5f,0.0f,-5.f);
  glMaterialfv( GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, red_mat );
  glBegin(GL_TRIANGLES);
    glColor3f(1.f, 0.f, .0f);
    glVertex3f( 0.0f, 1.0f, 0.0f);
    glColor3f(.0f, 1.f, .0f);
    glVertex3f(-1.0f,-1.0f, 0.0f);
    glVertex3f( 1.0f,-1.0f, 0.0f);
  glEnd();
  glTranslatef(3.0f,0.0f,0.0f);
  glBegin(GL_QUADS);
    glVertex3f(-1.0f, 1.0f, 0.0f);
    glVertex3f( 1.0f, 1.0f, 0.0f);
    glVertex3f( 1.0f,-1.0f, 0.0f);
    glVertex3f(-1.0f,-1.0f, 0.0f);
  glEnd();
   glPopMatrix();
  glFinish();

   glPushMatrix();
  glTranslatef(0.0f,1.0f,0.0f);
  glBegin(GL_QUADS);
    glVertex3f(-1.0f, 1.0f, 0.0f);
    glVertex3f( 1.0f, 1.0f, 0.0f);
}

void render_image2(void)
{
    glVertex3f( 1.0f,-1.0f, 0.0f);
}

void render_image3(void)
{
    glVertex3f(-1.0f,-1.0f, 0.0f);
  glEnd();
  glPopMatrix();
  glFinish();
}

void sph(double angle)
{
   GLfloat blue_mat[]  = { 1, 1, 0, 1 };

   glPushMatrix();
       glTranslatef(0.75, 0.0, 0);
       glMaterialfv( GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE, blue_mat );
       Sphere(1.0, 20, 20);
   glPopMatrix();

   glFinish();
}

static void
write_ppm(const char *filename, const GLubyte *buffer, int width, int height)
{
   const int binary = 0;
   FILE *f = fopen( filename, "w" );
   if (f) {
      int i, x, y;
      const GLubyte *ptr = buffer;
      if (binary) {
         fprintf(f,"P6\n");
         fprintf(f,"# ppm-file created by osdemo.c\n");
         fprintf(f,"%i %i\n", width,height);
         fprintf(f,"255\n");
         fclose(f);
         f = fopen( filename, "ab" );  /* reopen in binary append mode */
         for (y=height-1; y>=0; y--) {
            for (x=0; x<width; x++) {
               i = (y*width + x) * 4;
               fputc(ptr[i], f);   /* write red */
               fputc(ptr[i+1], f); /* write green */
               fputc(ptr[i+2], f); /* write blue */
            }
         }
      }
      else {
         /*ASCII*/
         int counter = 0;
         fprintf(f,"P3\n");
         fprintf(f,"# ascii ppm file created by osdemo.c\n");
         fprintf(f,"%i %i\n", width, height);
         fprintf(f,"255\n");
         for (y=height-1; y>=0; y--) {
            for (x=0; x<width; x++) {
               i = (y*width + x) * 4;
               fprintf(f, " %3d %3d %3d", ptr[i], ptr[i+1], ptr[i+2]);
               counter++;
               if (counter % 5 == 0)
                  fprintf(f, "\n");
            }
         }
      }
      fclose(f);
   }
}

OSMesaContext ctx;
void *buffer;
static int Width = 400;
static int Height = 400;



int init_context(int w, int h)
{
    Width = w;
    Height = h;

   ctx = OSMesaCreateContextExt( OSMESA_RGBA, 16, 0, 0, NULL );
   if (!ctx) {
      printf("OSMesaCreateContext failed!\n");
      return -1;
   }

   buffer = malloc( Width * Height * 4 * sizeof(GLubyte) );
   if (!buffer) {
      printf("Alloc image buffer failed!\n");
      return -1;
   }

   if (!OSMesaMakeCurrent( ctx, buffer, GL_UNSIGNED_BYTE, Width, Height )) {
      printf("OSMesaMakeCurrent failed!\n");
      return -1;
   }


   {
      int z, s, a;
      glGetIntegerv(GL_DEPTH_BITS, &z);
      glGetIntegerv(GL_STENCIL_BITS, &s);
      glGetIntegerv(GL_ACCUM_RED_BITS, &a);
      printf("Depth=%d Stencil=%d Accum=%d\n", z, s, a);
   }
   return 0;
}

void free_context()
{
   write_ppm("a.ppm", buffer, Width, Height);

   printf("all done\n");

   free( buffer );

   OSMesaDestroyContext( ctx );
}

/*
int
main(int argc, char *argv[])
{
   OSMesaContext ctx;
   void *buffer;
   char *filename = NULL;

   if (argc < 2) {
      fprintf(stderr, "Usage:\n");
      fprintf(stderr, "  osdemo filename [width height]\n");
      return 0;
   }

   filename = argv[1];
   if (argc == 4) {
      Width = atoi(argv[2]);
      Height = atoi(argv[3]);
   }

   ctx = OSMesaCreateContextExt( OSMESA_RGBA, 16, 0, 0, NULL );
   if (!ctx) {
      printf("OSMesaCreateContext failed!\n");
      return 0;
   }

   buffer = malloc( Width * Height * 4 * sizeof(GLubyte) );
   if (!buffer) {
      printf("Alloc image buffer failed!\n");
      return 0;
   }

   if (!OSMesaMakeCurrent( ctx, buffer, GL_UNSIGNED_BYTE, Width, Height )) {
      printf("OSMesaMakeCurrent failed!\n");
      return 0;
   }


   {
      int z, s, a;
      glGetIntegerv(GL_DEPTH_BITS, &z);
      glGetIntegerv(GL_STENCIL_BITS, &s);
      glGetIntegerv(GL_ACCUM_RED_BITS, &a);
      printf("Depth=%d Stencil=%d Accum=%d\n", z, s, a);
   }

   render_image();

   if (filename != NULL) {
      write_ppm(filename, buffer, Width, Height);
   }
   else {
      printf("Specify a filename if you want to make an image file\n");
   }

   printf("all done\n");

   free( buffer );

   OSMesaDestroyContext( ctx );

   return 0;
}
*/
