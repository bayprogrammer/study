#pragma once

#include <iostream>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>


class Paddle {

private:

  // TODO(zmd): @Cleanup @Duplication with Ball

  SDL_Renderer *const renderer;

  const int& gameWidth;
  const int& gameHeight;

  SDL_Texture *texture;

  SDL_Rect srcRect;
  SDL_Rect destRect;

  // TODO(zmd): we need way to set orientation of paddle!!

  int speed;

  // TODO(zmd): bool loadTexture(const char **textureName);

public:

  Paddle(SDL_Renderer *const ren,
         const int &gameW,
         const int &gameH,
	 int startX,
	 int startY);

  ~Paddle();

  // TODO(zmd): @Cleanup @Duplication with Ball

  void update();

  void render();

  void cleanup();

  // TODO(zmd): std::string Paddle::toString();

};
