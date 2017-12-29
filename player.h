#pragma once

#include <iostream>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>


class Player {

private:

public:

  SDL_Texture *texture;

  SDL_Rect srcRect;
  SDL_Rect destRect;

  Player(SDL_Renderer *renderer);
  ~Player();

  void update();

  void render(SDL_Renderer *renderer);

  void cleanup();

};
