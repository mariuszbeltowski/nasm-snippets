// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 zad52.asm -o zad52.o
// gcc -m32 -o main52.o -c main52.c
// gcc -m32 main52.o zad52.o -o zad52
// nasm -felf32 zad53.asm -o zad53.o && gcc -m32 -o main53.o -c main53.c && gcc -m32 main53.o zad53.o -o zad53 && ./zad52

#include <stdio.h>

void sortuj( int * a, int *b, int * c);        /* prototyp funkcji */

int main()
{
  int x=5, y=3, z=4;
  sortuj( &x, &y, &z);
  printf(" %d %d %d \n", x, y, z);
  return 0;
}
