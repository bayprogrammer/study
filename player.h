#pragma once

#include <iostream>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>


class Player {

private:

public:

  SDL_Texture *texture;

  Player(SDL_Renderer *renderer);
  ~Player();

  void cleanup();

};
