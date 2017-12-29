.POSIX:
.SUFFIXES:
.PHONY: clean

CC	= g++
CFLAGS	= -std=c++0x -Wpedantic -Wall -Wextra -Werror
LDFLAGS	=
LDLIBS	= -lSDL2 -lSDL2_image

all: pong

pong: main.o game.o player.o
	$(CC) $(LDFLAGS) -o pong main.o game.o player.o $(LDLIBS)

main.o: main.cpp
game.o: game.cpp game.h
player.o: player.cpp player.h

clean:
	rm -f pong main.o game.o player.o

.SUFFIXES: .cpp .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<
