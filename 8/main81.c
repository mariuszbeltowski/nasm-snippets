// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 zad52.asm -o zad52.o
// gcc -m32 -o main52.o -c main52.c
// gcc -m32 main52.o zad52.o -o zad52
// nasm -f elf64 zad81.asm -o zad81.o && gcc -m64 -o main81.o -c main81.c && gcc -m64 main81.o zad81.o -o zad81 && ./zad81

#include <stdio.h>

int iloczyn (int n, int * tab);
/* prototyp funkcji */

int main()
{
  int tab[] ={1, 2, 3, 4};
  int wynik = iloczyn(4, tab);

  printf("%d\n", wynik);

  return 0;
}
