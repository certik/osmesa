#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "GL/osmesa.h"
#include "GL/glu.h"

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

void *get_buffer()
{
    return buffer;
}

int get_width() { return Width; }
int get_height() { return Height; }

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
