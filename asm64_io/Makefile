all: starter example

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
	

.PHONY: clean
clean:
	rm *.o
