all: zad41 zad42 zad43 zad44

asm64_io.o: asm64_io.asm
	nasm -f elf64 asm64_io.asm -o asm64_io.o

driver64.o: driver64.c asm64_io.inc
	gcc -c driver64.c -o driver64.o

zad41.o: zad41.asm
	nasm -f elf64 zad41.asm  -o zad41.o

zad41: driver64.o asm64_io.o zad41.o
	gcc driver64.o asm64_io.o zad41.o  -o zad41

zad42.o: zad42.asm
	nasm -f elf64 zad42.asm  -o zad42.o

zad42: driver64.o asm64_io.o zad42.o
	gcc driver64.o asm64_io.o zad42.o  -o zad42

zad43.o: zad43.asm
	nasm -f elf64 zad43.asm  -o zad43.o

zad43: driver64.o asm64_io.o zad43.o
	gcc driver64.o asm64_io.o zad43.o  -o zad43

zad44.o: zad44.asm
	nasm -f elf64 zad44.asm  -o zad44.o

zad44: driver64.o asm64_io.o zad44.o
	gcc driver64.o asm64_io.o zad44.o  -o zad44

.PHONY: clean
clean:
	rm *.o
