#include <stdio.h>
#include <math.h>

char f(char a, char b, char c)
{
	double power = pow((int)a, (int)b);

	int liczba = 1321528399;

	int wynik = power-(((((power*liczba)) / pow(2, 35) * 26)));

	return (int)c + wynik;
}

int main(){
	int a, b;
	char c;
	printf(" Podaj dwie liczby (0-127) i znak : ");
	scanf("%d %d %c", &a, &b, &c);
	printf(" Wynik : %c \n", f(a, b, c));
	return 0;
}
