// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 zad52.asm -o zad52.o
// gcc -m32 -o main52.o -c main52.c
// gcc -m32 main52.o zad52.o -o zad52
// nasm -felf32 zad62.asm -o zad62.o && gcc -m32 -o main62.o -c main62.c && gcc -m32 main62.o zad62.o -o zad62 && ./zad62

#include <stdio.h>

void prostopadloscian( float a, float b, float c, float * objetosc, float * pole); /* prototyp funkcji */

int main()
{
    float objetosc = 0;
    float pole = 0;

    prostopadloscian( 2, 3, 4, &objetosc, &pole);

    printf("Objetosc: %f  Pole: %f\n", objetosc, pole);
    return 0;
}
