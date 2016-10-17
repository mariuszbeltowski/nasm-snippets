// KOMPILACJA - kod źródłowy C w main.c, kod źródłowy ASM w suma.asm
// LINUX :
// nasm -felf32 zad52.asm -o zad52.o
// gcc -m32 -o main52.o -c main52.c
// gcc -m32 main52.o zad52.o -o zad52
// nasm -felf32 zad64.asm -o zad64.o && gcc -ffixed-reg -m32 -o main64.o -c main64.c && gcc -m32 main64.o zad64.o -o zad64 && ./zad64

#include <stdio.h>

void tablicuj(double a, double b, double P, double Q, double xmin, double xmax, int k, double * wartosci);
/* prototyp funkcji */

int main()
{
  const int rozmiar = 30;
  double wynik[30] = {0};
  tablicuj(-1, 1, 1, 2, 0, 1, rozmiar, &wynik);
  int i;
  for(i=0; i<rozmiar; ++i){
    printf("%.15lf\n", wynik[i]);
  }

  return 0;
}

/* Wyjście:
0.000000000000000
0.130094567444565
0.404584140667296
0.562192757348405
0.392935587315019
-0.095524455011234
-0.662632808433690
-0.985379256432223
-0.871873118444223
-0.390067200254273
0.177928668291609
0.524138432869889
0.514797753031086
0.264282363588211
0.034522568019564
0.034522568019565
0.264282363588212
0.514797753031086
0.524138432869888
0.177928668291609
-0.390067200254271
-0.871873118444222
-0.985379256432224
-0.662632808433693
-0.095524455011238
0.392935587315015
0.562192757348405
0.404584140667299
0.130094567444568
0.000000000000000
 */
