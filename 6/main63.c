// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 zad52.asm -o zad52.o
// gcc -m32 -o main52.o -c main52.c
// gcc -m32 main52.o zad52.o -o zad52
// nasm -felf32 zad63.asm -o zad63.o && gcc -m32 -o main63.o -c main63.c && gcc -m32 main63.o zad63.o -o zad63 && ./zad63

#include <stdio.h>

long double iloczyn_skalarny(int n, long double * x, long double * y); /* prototyp funkcji */

int main()
{
  long double x[] = {10, 12, 13, 14, 15, 16, 7, 18, 9, 10};
  long double x2[] = {-1, 2, -3, 14, -5, 6, -7, 18, -9, -10};
  long double y[] = {13, 14, 13,41, 31, 13, 13, 31, 31, 13};

  printf("%Lf \n", iloczyn_skalarny(10, x, y));
  printf("%Lf \n", iloczyn_skalarny(1, x, y));
  printf("%Lf \n", iloczyn_skalarny(6, x, y));
  printf("%Lf \n", iloczyn_skalarny(10, x2, x));

  printf("%Lf \n", iloczyn_skalarny(10, x, y));
  printf("%Lf \n", iloczyn_skalarny(1, x, y));
  printf("%Lf \n", iloczyn_skalarny(6, x, y));
  printf("%Lf \n", iloczyn_skalarny(10, x2, x));
  return 0;
}

/* Wyjście:
2772
130
1714
286
 */
