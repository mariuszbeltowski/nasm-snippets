#include <stdio.h>

#define N 100

// na wyjściu out[i] = wiersz1[i] - wiersz2[i]
extern "C" void diff(char *out,char *wiersz1,char *wiersz2,int n);

int main(void)
{
    char Tablica[N+1],DIFF[N];
    int i;

    Tablica[0]=1;
    for(i=1;i<=N;i++) Tablica[i]=Tablica[i-1]+i;

    diff(DIFF, Tablica+1, Tablica, N);

    for(i=0;i<N;i++) printf("%d ",DIFF[i]);
    printf("\n");

}
// OUT: 1 2 3 4 5 6 7 8 ....
