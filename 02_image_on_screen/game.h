#pragma once

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

};
