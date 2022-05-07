#include "paddle.h"


Paddle::Paddle(SDL_Renderer *const ren,
	       const int &gameW,
	       const int &gameH,
	       int startX,
	       int startY): renderer(ren),
			    gameWidth(gameW),
			    gameHeight(gameH) {

  // TODO(zmd): need texture loading routine (TextureLoader::loadTexture()?)
  texture = nullptr;
  SDL_Surface *tmpSurface = IMG_Load("paddle.png");
  if (tmpSurface) {
    texture = SDL_CreateTextureFromSurface(renderer, tmpSurface);
    SDL_FreeSurface(tmpSurface);
  }

  srcRect.h = 64;
  srcRect.h = 64;
  srcRect.x = 0;
  srcRect.y = 0;

  destRect.h = 32;
  destRect.w = 128;
  destRect.x = startX;  // TODO(zmd): these will need to be initialized by game?
  destRect.y = startY;

  // TODO(zmd): we need way to set orientation of paddle!!

  speed = 1;

  std::cout << "Constructed Paddle instance.\n";
}

// TODO(zmd): @Cleanup @Duplication with Ball
Paddle::~Paddle() {
  cleanup();
  std::cout << "Destroyed Paddle instance.\n";
}

void Paddle::update() {
  // TODO(zmd): uhhh...
  destRect.x += speed;

  if((destRect.x <= 0) || ((destRect.x + destRect.w) >= gameWidth)) {
    speed *= -1;
  }
}

// TODO(zmd): @Cleanup @Duplication with Ball
void Paddle::render() {
  SDL_RenderCopy(renderer, texture, NULL, &destRect);
}

// TODO(zmd): @Cleanup @Duplication with Ball
void Paddle::cleanup() {
  if (texture) {
    SDL_DestroyTexture(texture);
    texture = nullptr;
  }
}

// TODO(zmd): @Cleanup @Duplication with Ball
// TODO(zmd): std::string Paddle::toString() {};
