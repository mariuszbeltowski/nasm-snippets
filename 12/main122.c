#include <stdio.h>
#include <time.h>


//extern "C"
void minmax(int n, int * tab, int * max, int * min);

int main(){
   const int rozmiar = 19;
   const int liczba_powtorzen = 10000;
   int tab[] = {343, 3, 3, -65, 3, 123, 4, 32, 342, 22, 11, 32, 44, 12, 324, 43, 0, -1000, -100};
   //tab[rozmiar-1] = -1000;
   int min, max;
   clock_t start, stop;
   start = clock();
   int i;
   for( i=0; i<liczba_powtorzen; i++){
      minmax(rozmiar, tab, &max, &min);
   }
   printf("min = %d    max = %d\n", min, max);
   stop = clock();
   printf("\n time = %f  ( %d cykli)", (stop - start)*1.0/CLOCKS_PER_SEC, (stop - start));
   return 0;
}
