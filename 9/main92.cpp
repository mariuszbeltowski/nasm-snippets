#include <iostream>

using namespace std;
// nasm -f elf64 zad92.asm -o zad92.o && g++ -m64 -o main92.o -c main92.cpp && g++ -m64 main92.o zad92.o -o zad92 && ./zad92


// kopiuje n liczb typu int z zrodla do celu
void kopiuj(int * cel, int * zrodlo, unsigned int n);

// zeruje tablice liczb typu int o rozmiarze n
void zeruj(int * tablica, unsigned int n);

int main(){

  int tab1[] = {1,2,3,4,5};
  int tab2[5] = {0};

  kopiuj(tab1, tab2, 5);

  for(int i = 0; i<5; ++i)
    cout << tab1[i] << endl;

  zeruj(tab2, 5);

  for(int i = 0; i<5; ++i)
    cout << tab2[i] << endl;

  return 0;
}
//33
