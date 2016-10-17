#include <iostream>
using namespace std;
// wynik[i] = (a[i]-x)*(x*x);
extern "C" void oblicz(int n, float *wynik, float x, float * a);
int main(){
 const int rozmiar = 16;
 float a[rozmiar] = {1, -2, 3, -4, 5, -6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
 float wynik[rozmiar];
 oblicz(rozmiar, wynik, 3.0, a);

 for(int i =0; i< rozmiar; i++){
 cout << wynik[i] << " ";
 }
 cout << endl;
 return 0;
}
/* Spodziewane wyjście
 * -18 -45 0 -63 18 -81 36 45 54 63 72 81 90 99 108 117
 */
