// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 zad52.asm -o zad52.o
// gcc -m32 -o main52.o -c main52.c
// gcc -m32 main52.o zad52.o -o zad52
// nasm -felf32 zad52.asm -o zad52.o && gcc -m32 -o main52.o -c main52.c && gcc -m32 main52.o zad52.o -o zad52 && ./zad52

#include <stdio.h>

int suma (int a, int b[]);         /* prototyp funkcji */

int main()
{
      int count = 5;
      int tab[5] = {1, 2, 3, 4, 5};

      printf("%d\n", suma(count, tab));
      return 0;
}
