#pragma once

#include <iostream>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>


class Ball {

private:

  // TODO(zmd): @Cleanup @Duplication with Paddle

  SDL_Renderer *const renderer;

  const int& gameWidth;
  const int& gameHeight;

  SDL_Texture *texture;

  SDL_Rect srcRect;
  SDL_Rect destRect;

  int xVelocity;
  int yVelocity;

  // TODO(zmd): bool loadTexture(const char **textureName);

public:

  Ball(SDL_Renderer *const ren,
         const int &gameW,
         const int &gameH);

  ~Ball();

  // TODO(zmd): @Cleanup @Duplication with Paddle

  void update();

  void render();

  void cleanup();

  // TODO(zmd): std::string Ball::toString();

};
