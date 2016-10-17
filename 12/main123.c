#include <stdio.h>
#include <time.h>


//extern "C"
void sortuj(int n, float * tab)

int main(){
   const int rozmiar = 19;
   const int liczba_powtorzen = 10000;
   int tab[] = {343, 3, 3, -65, 3, 123, 4, 32, 342, 22, 11, 32, 44, 12, 324, 43, 0, -1000, -100};

   sortuj(rozmiar, &tab);

   int i;
   for( i=0; i<rozmiar; i++){
      printf("%d ", tab[i]);
   }
   printf("\n");

   return 0;
}
