#include <iostream>

using namespace std;
// g++ -m64 -o main113.o -c main113.cpp && g++ -m64 main113.o -o zad113 && ./zad113

#include <iostream>

class Przedzial {
public:
	double low;
	double high;

	Przedzial(double l, double h) {
		this->low = l;
		this->high = h;
	}

	friend const Przedzial operator+(const Przedzial& l, const Przedzial& r);
	friend const Przedzial operator-(const Przedzial& l, const Przedzial& r);
};

const Przedzial operator +(const Przedzial& l, const Przedzial& r) {
	Przedzial tmp(l.low, l.high);

	int c = 0;

	asm("myfunc:;"
		"fldl (%1);"
		"fldl (%2);"
		"faddp;"
		"fstcw %3;"
		"movw %3, %%ax;"
		"andw $0xf3ff, %%ax;"
		"orw $0x0400, %%ax;"
		"push %%rax;"
		"fldcw (%%rsp);"
		"fstpl (%0);"
		"fldcw %3;"
		"pop %%rax;"
		"addq $8, %1;"
		"addq $8, %2;"
		"addq $8, %0;"
		"fldl (%1);"
		"fldl (%2);"
		"faddp;"
		"fstcw %3;"
		"movw %3, %%ax;"
		"andw $0xf3ff, %%ax;"
		"orw $0x800, %%ax;"
		"push %%rax;"
		"fldcw (%%rsp);"
		"fstpl (%0);"
		"fldcw %3;"
		"pop %%rax;"
		:
		:"r"(&tmp), "r"(&l), "r"(&r), "m"(c)
		:"rax"
	);
	return tmp;
}

const Przedzial operator -(const Przedzial& l, const Przedzial& r) {
	Przedzial tmp(l.low, l.high);

	int c = 0;

	asm("myfunc1:;"
		"fldl (%2);"
		"fldl (%1);"
		"fsubp;"
		"fstcw %3;"
		"movw %3, %%ax;"
		"andw $0xf3ff, %%ax;"
		"orw $0x0400, %%ax;"
		"push %%rax;"
		"fldcw (%%rsp);"
		"fstpl (%0);"
		"fldcw %3;"
		"pop %%rax;"
		"addq $8, %1;"
		"addq $8, %2;"
		"addq $8, %0;"
		"fldl (%2);"
		"fldl (%1);"
		"fsubp;"
		"fstcw %3;"
		"movw %3, %%ax;"
		"andw $0xf3ff, %%ax;"
		"orw $0x800, %%ax;"
		"push %%rax;"
		"fldcw (%%rsp);"
		"fstpl (%0);"
		"fldcw %3;"
		"pop %%rax;"
		:
		:"r"(&tmp), "r"(&l), "r"(&r), "m"(c)
		:"rax"
	);
	return tmp;
}

int main() {
	Przedzial p1(20, 30);
	Przedzial p2(-0.0001, 0.0001);

	Przedzial sum = p1+p2;
	cout << p1.low << ", " << p1.high << " + "
			<< p2.low << ", " << p2.high << " = "
			<< sum.low << ", " << sum.high << endl;

	Przedzial diff = p2-p1;
	cout << p2.low << ", " << p2.high << " - "
		<< p1.low << ", " << p1.high << " = "
		<< diff.low << ", " << diff.high << endl;

	return 0;
}
