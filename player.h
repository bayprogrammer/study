#pragma once

#include <iostream>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>


class Player {

private:

public:

  int gameWidth;
  int gameHeight;

  SDL_Texture *texture;

  //SDL_Rect srcRect;
  SDL_Rect destRect;

  int xVelocity;
  int yVelocity;

  Player(int gWidth, int gHeight, SDL_Renderer *renderer);
  ~Player();

  void update();

  void render(SDL_Renderer *renderer);

  void cleanup();

};
