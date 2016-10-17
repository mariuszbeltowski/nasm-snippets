#include <iostream>
using namespace std;
extern "C" float sumuj(int n, float * a, float x);
int main(){

 float tab[] = {1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 5};
 int rozmiar = sizeof(tab)/sizeof(float);
 for(int i =4; i<= rozmiar; i+=4){
   cout << i << " => " << sumuj(i, tab, tab[rozmiar-i/4]) << endl;
 }

 return 0;
}
/* Spodziewane wyjście
4 => 6
8 => 25
12 => 70
*/
