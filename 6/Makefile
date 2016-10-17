all: zad61 zad62 zad63 zad64

asm64_io.o: asm64_io.asm
	nasm -f elf64 asm64_io.asm -o asm64_io.o

driver64.o: driver64.c asm64_io.inc
	gcc -c driver64.c -o driver64.o

zad61.o: zad61.asm
	nasm -o zad61.obj -felf32 zad61.asm

zad61: zad61.o
	gcc -m32 zad61.obj -o zad61

zad62.o: zad62.asm
	nasm -f elf64 zad62.asm  -o zad62.o

zad62: driver64.o asm64_io.o zad62.o
	gcc driver64.o asm64_io.o zad62.o  -o zad62

zad63.o: zad63.asm
	nasm -f elf64 zad63.asm  -o zad63.o

zad63: driver64.o asm64_io.o zad63.o
	gcc driver64.o asm64_io.o zad63.o  -o zad63

zad64.o: zad64.asm
	nasm -f elf64 zad64.asm  -o zad64.o

zad64: driver64.o asm64_io.o zad64.o
	gcc driver64.o asm64_io.o zad64.o  -o zad64

.PHONY: clean
clean:
	rm *.o
