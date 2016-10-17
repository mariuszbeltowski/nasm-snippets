#include <iostream>

using namespace std;
// g++ -m64 -o main111.o -c main111.cpp && g++ -m64 main111.o -o zad111 && ./zad111

/*;void kopiuj(int * cel, int * zrodlo, unsigned int n);
_Z6kopiujPiS_j:
 ;RDI, RSI, RDX, RCX, R8, R9
mov rcx, rdx
push rsi
push rdi
pop rsi
pop rdi

  ;petla:
    rep movsd
    ;loop petla
  ret*/

// kopiuje n liczb typu int z zrodla do celu
void kopiuj(int * cel, int * zrodlo, unsigned int n){
  asm("rep movsd"
      :
      :"c"(n),"S"(zrodlo),"D"(cel)
    );
}


int main(){

  int tab1[] = {1,2,3,4,5};
  int tab2[5] = {0};

  kopiuj(tab2, tab1, 5);

  for(int i = 0; i<5; ++i)
    cout << tab2[i] << endl;

  return 0;
}
//33
