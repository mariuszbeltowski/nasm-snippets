// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 zad52.asm -o zad52.o
// gcc -m32 -o main52.o -c main52.c
// gcc -m32 main52.o zad52.o -o zad52
// nasm -felf32 zad54.asm -o zad54.o && gcc -ffixed-reg -m32 -o main54.o -c main54.c && gcc -m32 main54.o zad54.o -o zad54 && ./zad54

#include <stdio.h>

typedef struct{
    int min;
    int max;
} MM;

MM minmax(int N, ...);         /* prototyp funkcji */

int main()
{
  MM wynik = minmax(7, 8, -2, 4 , 90, 4, 100, -50);
  printf("min = %d, max = %d \n", wynik.min, wynik.max);
  return 0;
}
