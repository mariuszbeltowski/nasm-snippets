all: zad31 zad32 zad33 zad34

asm64_io.o: asm64_io.asm
	nasm -f elf64 asm64_io.asm -o asm64_io.o

driver64.o: driver64.c asm64_io.inc
	gcc -c driver64.c -o driver64.o

zad31.o: zad31.asm
	nasm -f elf64 zad31.asm  -o zad31.o

zad31: driver64.o asm64_io.o zad31.o
	gcc driver64.o asm64_io.o zad31.o  -o zad31

zad32.o: zad32.asm
	nasm -f elf64 zad32.asm  -o zad32.o

zad32: driver64.o asm64_io.o zad32.o
	gcc driver64.o asm64_io.o zad32.o  -o zad32

zad33.o: zad33.asm
	nasm -f elf64 zad33.asm  -o zad33.o

zad33: driver64.o asm64_io.o zad33.o
	gcc driver64.o asm64_io.o zad33.o  -o zad33

zad34.o: zad34.asm
	nasm -f elf64 zad34.asm  -o zad34.o

zad34: driver64.o asm64_io.o zad34.o
	gcc driver64.o asm64_io.o zad34.o  -o zad34

.PHONY: clean
clean:
	rm *.o
