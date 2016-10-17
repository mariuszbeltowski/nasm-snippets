#include <iostream>

using namespace std;
// g++ -m64 -o main112.o -c main112.cpp && g++ -m64 main112.o -o zad112 && ./zad112

char* dodaj(char *tab1, char *tab2, int n) {
	char* result = new char[n];

	asm(
    "movq %%rcx, %%rdi;"
		"xor %%rcx, %%rcx;"
		"cmpq $16, %%rdi;"
		"jl end;"
		"proces:;"
		"movups (%%rax, %%rcx, 4), %%xmm0;"
		"movups (%%rbx, %%rcx, 4), %%xmm1;"
		"paddsb %%xmm1, %%xmm0;"
		"movups %%xmm0, (%%rdx, %%rcx, 4);"
		"addq $4, %%rcx;"
		"subq $16, %%rdi;"
		"cmpq $16, %%rdi;"
		"jge proces;"
		"end:;"
		"cmpq $0, %%rdi;"
		"je exit;"
		"movss (%%rax, %%rcx, 4), %%xmm0;"
		"movss (%%rbx, %%rcx, 4), %%xmm1;"
		"paddsb %%xmm1, %%xmm0;"
		"movss %%xmm0, (%%rdx, %%rcx, 4);"
		"subq $4, %%rdi;"
		"addq $1, %%rcx;"
		"jmp end;"
		"exit:;"
		:
		: "a"(tab1), "b"(tab2), "c"(n), "d"(result)
	);

	return result;
}

int main() {
	int n = 4;
	char tab1[] = {1,2,0,5};
	char tab2[] = {1,2,3,5};

	char* res = dodaj(tab1, tab2, n);
	for (int i=0; i<n; ++i)
		cout << (unsigned int)res[i] << ' ';

  cout << endl;
	delete[] res;
	return 0;
}
