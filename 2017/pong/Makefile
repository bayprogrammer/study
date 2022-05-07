.POSIX:
.SUFFIXES:
.PHONY: clean

CC	= g++
CFLAGS	= -std=c++0x -Wpedantic -Wall -Wextra -Werror
LDFLAGS	=
LDLIBS	= -lSDL2 -lSDL2_image

all: pong

pong: main.o game.o paddle.o ball.o
	$(CC) $(LDFLAGS) -o pong main.o game.o paddle.o ball.o $(LDLIBS)

main.o: main.cpp
game.o: game.cpp game.h
paddle.o: paddle.cpp paddle.h
ball.o: ball.cpp ball.h

clean:
	rm -f pong main.o game.o paddle.o ball.o

.SUFFIXES: .cpp .o
.cpp.o:
	$(CC) $(CFLAGS) -c $<
