.PHONY: all
all: st_przelicz st_max st_mnoz

mnoz: mnoz.asm mnoz.cpp
	nasm -felf64 -g  mnoz.asm -o mnoz_a.o
	g++ -g -Wall -m64  -c mnoz.cpp -o mnoz_c.o
	g++ -g -Wall -m64  mnoz_a.o mnoz_c.o -o mnoz

max: max.asm max.c
	nasm -felf32 max.asm -o maxa.o
	gcc -g -m32 -c max.c -o maxc.o
	gcc -g -m32  maxc.o maxa.o -o max

przelicz: przelicz.asm przelicz.cpp
	nasm -felf64 przelicz.asm -o przelicza.o
	g++ -g -m64 -c przelicz.cpp -o przeliczc.o
	g++ -g -m64 przelicza.o przeliczc.o -o przelicz
	
st_przelicz: st_przelicz.asm st_przelicz.cpp
	nasm -felf64 st_przelicz.asm -o st_przelicza.o
	g++ -g -m64 -c st_przelicz.cpp -o st_przeliczc.o
	g++ -g -m64 st_przelicza.o st_przeliczc.o -o st_przelicz

st_max: st_max.asm st_max.c
	nasm -felf32 st_max.asm -o st_maxa.o
	gcc -g -m32 -c st_max.c -o st_maxc.o
	gcc -g -m32 st_maxa.o st_maxc.o -o st_max

st_mnoz: st_mnoz.asm st_mnoz.cpp
	nasm -felf64 -g  st_mnoz.asm -o st_mnoz_a.o
	g++ -g -Wall -m64  -c st_mnoz.cpp -o st_mnoz_c.o
	g++ -g -Wall -m64  st_mnoz_a.o st_mnoz_c.o -o st_mnoz

.PHONY: clean
clean: 
	rm -f *.o  st_przelicz st_max st_mnoz
