#include <iostream>

using namespace std;

// nasm -f elf64 zad91.asm -o zad91.o && gcc -m64 -o main91.o -c main91.cpp && gcc -m64 main91.o zad91.o -o zad91 && ./zad91


unsigned int rotate(unsigned int x, int n = 1);
unsigned char rotate(unsigned char x, int n = 1);

int main(){

  unsigned int ui = 20;
  unsigned char uc = 'b';

  unsigned int ui_result = rotate(ui);
  unsigned char uc_result = rotate(uc);

  std::cout << ui_result << endl;
  std::cout << (unsigned int)uc_result << endl;

  return 0;
}
//33
