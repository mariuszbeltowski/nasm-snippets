all: zad51 zad52 zad53 zad54

asm64_io.o: asm64_io.asm
	nasm -f elf64 asm64_io.asm -o asm64_io.o

driver64.o: driver64.c asm64_io.inc
	gcc -c driver64.c -o driver64.o

zad51.o: zad51.asm
	nasm -o zad51.obj -felf32 zad51.asm

zad51: zad51.o
	gcc -m32 zad51.obj -o zad51

zad52.o: zad52.asm
	nasm -f elf64 zad52.asm  -o zad52.o

zad52: driver64.o asm64_io.o zad52.o
	gcc driver64.o asm64_io.o zad52.o  -o zad52

zad53.o: zad53.asm
	nasm -f elf64 zad53.asm  -o zad53.o

zad53: driver64.o asm64_io.o zad53.o
	gcc driver64.o asm64_io.o zad53.o  -o zad53

zad54.o: zad54.asm
	nasm -f elf64 zad54.asm  -o zad54.o

zad54: driver64.o asm64_io.o zad54.o
	gcc driver64.o asm64_io.o zad54.o  -o zad54

.PHONY: clean
clean:
	rm *.o
