// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 zad52.asm -o zad52.o
// gcc -m32 -o main52.o -c main52.c
// gcc -m32 main52.o zad52.o -o zad52
// nasm -f elf64 zad83.asm -o zad83.o && gcc -m64 -o main83.o -c main83.c && gcc -m64 main83.o zad83.o -o zad83 && ./zad83

#include <stdio.h>

int iloczyn (int n, ...);
/* prototyp funkcji */

int main()
{
  int wynik = iloczyn (9, 1, 2, 3, 4, 5, 6, 7, 8, 8);

  printf("%d\n", wynik);

  return 0;
}
