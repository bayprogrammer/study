#pragma once
#include <SDL2/SDL.h>


class Game {

private:

  int width;
  int height;

  char* title;

  SDL_Window*  window;
  SDL_Surface* surface;
  SDL_Surface* image;

public:

  Game();
  ~Game();

  bool init();

  bool loadMedia();

  void blitMedia();

  void delay(int ms_delay);

};
