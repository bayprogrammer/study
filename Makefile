.POSIX:
.SUFFIXES:
.PHONY: clean

CC	= g++
CFLAGS	= -std=c++0x -Wpedantic -Wall -Wextra -Werror
LDFLAGS	=
LDLIBS	= -lSDL2

all: pong

pong: main.o game.o
	$(CC) $(LDFLAGS) -o pong main.o game.o $(LDLIBS)

main.o: main.cpp
game.o: game.cpp game.h

clean:
	rm -f pong main.o game.o

.SUFFIXES: .cpp .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<
