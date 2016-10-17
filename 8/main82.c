// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 zad52.asm -o zad52.o
// gcc -m32 -o main52.o -c main52.c
// gcc -m32 main52.o zad52.o -o zad52
// nasm -f elf64 zad82.asm -o zad82.o && gcc -m64 -o main82.o -c main82.c && gcc -m64 main82.o zad82.o -o zad82 && ./zad82

#include <stdio.h>

double wartosc(double a, double b, double x);
/* prototyp funkcji */

int main()
{
  double wynik = wartosc(4, 3, 2);

  printf("%lf\n", wynik);

  return 0;
}
