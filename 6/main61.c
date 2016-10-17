// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 zad52.asm -o zad52.o
// gcc -m32 -o main52.o -c main52.c
// gcc -m32 main52.o zad52.o -o zad52
// nasm -felf32 zad61.asm -o zad61.o && gcc -m32 -o main61.o -c main61.c && gcc -m32 main61.o zad61.o -o zad61 && ./zad61

#include <stdio.h>

//extern "C"
double wartosc(double a, double b, double  c, double d, double x);         /* prototyp funkcji */

// ax3+bx2+cx+d

int main()
{
      double war = wartosc(5,4,3,2,1);
      printf("%lf\n", war);
      return 0;
}
