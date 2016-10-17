#include <iostream>
#include <iomanip>

using namespace std;
// nasm -f elf64 zad93.asm -o zad93.o && g++ -m64 -o main93.o -c main93.cpp && g++ -m64 main93.o zad93.o -o zad93 && ./zad93


// Funkcje z zadania 2
// kopiuje n liczb typu int z zrodla do celu
void kopiuj(int * cel, int * zrodlo, unsigned int n);
// zeruje tablice liczb typu int o rozmiarze n
void zeruj(int * cel, unsigned int n);

class BigInt{
  unsigned int rozmiar;
   int *dane;
public:
  explicit BigInt(unsigned int rozmiar)
    : rozmiar(rozmiar),
      dane( new int[rozmiar] ){
    zeruj(dane, rozmiar);
  }
  BigInt(const BigInt & x)
    :  rozmiar(x.rozmiar),
       dane(new int[x.rozmiar]){
    kopiuj(dane, x.dane, x.rozmiar);
  }
  BigInt & operator=(const BigInt & x) {
    if(rozmiar != x.rozmiar){
      int * tmp = new int[x.rozmiar];
      delete[] dane;
      rozmiar = x.rozmiar;
      dane = tmp;
    }
    kopiuj(dane, x.dane, x.rozmiar);
    return *this;
  }
  ~BigInt(){
    delete[] dane;
  }

// do zaimplementowania w zadaniu 3
  int dodaj(int n);
  int pomnoz(int n);
  int podzielZReszta(int n);

  BigInt & operator=(const char * liczba);
  friend std::ostream & operator << (std::ostream & str, const BigInt & x);

// do zaimplementowania w zadaniu 4
  friend BigInt operator+ (const BigInt & a, const BigInt & b);
  friend BigInt operator- (const BigInt & a, const BigInt & b);

};

std::ostream & operator << (std::ostream & str, const BigInt & x) {
  for(int n = x.rozmiar-1; n>=0; --n) {
    str << setfill('0') << setw(10) << (unsigned int)x.dane[n];
  }
  //str << x.rozmiar;
  return str;
}

int main(){

  BigInt tmp1(2);
  cout << tmp1.dodaj(2147483647) << endl;
  cout << tmp1.dodaj(2147483647) << endl;
  //cout << tmp1.dodaj(2147483647) << endl;
  //cout << tmp1.dodaj(2147483647) << endl;
  cout << tmp1.dodaj(6) << endl;
  cout << tmp1.pomnoz(2) << endl;
  cout << tmp1.podzielZReszta(2) << endl;

  cout << tmp1 << endl;

  BigInt tmp2(2);
  cout << tmp2.dodaj(30) << endl;

  cout << tmp2 << endl;

  BigInt tmp3 = tmp1+tmp2;
  BigInt *test  = new BigInt(1);
  BigInt *test2  = new BigInt(1);
  //BigInt tmp4 = tmp3-tmp2;

  //cout << tmp3 << endl;
  //cout << tmp4 << endl;

  return 0;
}
//33
