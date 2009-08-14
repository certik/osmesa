#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "GL/osmesa.h"
#include "GL/glu.h"

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

OSMesaContext init_context(int w, int h)
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

   return ctx;
}

void free_context()
{
   free( buffer );

   OSMesaDestroyContext( ctx );
}
