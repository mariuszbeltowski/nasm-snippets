all: starter example zad21 zad22 zad23 zad24

starter: starter.o  asm64_io.o driver64.o
	gcc driver64.o asm64_io.o starter.o -o starter

starter.o: starter.asm
	nasm -f elf64 $< -o $@

asm64_io.o: asm64_io.asm
	nasm -f elf64 asm64_io.asm -o asm64_io.o

driver64.o: driver64.c asm64_io.inc
	gcc -c driver64.c -o driver64.o

example.o: example.asm
	nasm -f elf64 example.asm  -o example.o

example: driver64.o asm64_io.o example.o
	gcc driver64.o asm64_io.o example.o  -o example

zad21.o: zad21.asm
	nasm -f elf64 zad21.asm  -o zad21.o

zad21: driver64.o asm64_io.o zad21.o
	gcc driver64.o asm64_io.o zad21.o  -o zad21

zad22.o: zad22.asm
	nasm -f elf64 zad22.asm  -o zad22.o

zad22: driver64.o asm64_io.o zad22.o
	gcc driver64.o asm64_io.o zad22.o  -o zad22

zad23.o: zad23.asm
	nasm -f elf64 zad23.asm  -o zad23.o

zad23: driver64.o asm64_io.o zad23.o
	gcc driver64.o asm64_io.o zad23.o  -o zad23

zad24.o: zad24.asm
	nasm -f elf64 zad24.asm  -o zad24.o

zad24: driver64.o asm64_io.o zad24.o
	gcc driver64.o asm64_io.o zad24.o  -o zad24

.PHONY: clean
clean:
	rm *.o
