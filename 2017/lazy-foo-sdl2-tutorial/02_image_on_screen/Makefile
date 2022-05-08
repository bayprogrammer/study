hello_image: hello_image.cpp game.o
	g++ -ansi -std=c++0x \
	    -Wall -Wextra -Wpedantic -Werror \
	    hello_image.cpp -lSDL2 -g -o hello_image game.o

game.o: game.h game.cpp
	g++ -c game.cpp

clean:
	rm hello_image
	rm game.o
