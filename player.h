#pragma once

#include <iostream>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>


// TODO(zmd): rename to Ball, b/c, that's what this is ending up as
class Player {

private:

  SDL_Renderer *const renderer;

  const int& gameWidth;
  const int& gameHeight;

  SDL_Texture *texture;

  SDL_Rect srcRect;
  SDL_Rect destRect;

  int xVelocity;
  int yVelocity;

  // TODO(zmd): bool loadTexture(const **textureName);

public:

  Player(SDL_Renderer *const ren,
         const int &gameW,
         const int &gameH);

  ~Player();

  void update();

  void render();

  void cleanup();

};
