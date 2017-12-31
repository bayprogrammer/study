#include "ball.h"


Ball::Ball(SDL_Renderer *const ren,
           const int &gameW,
           const int &gameH): renderer(ren),
			      gameWidth(gameW),
			      gameHeight(gameH) {

  // TODO(zmd): @Cleanup @Duplication with Paddle

  // TODO(zmd): need texture loading routine (TextureLoader::loadTexture()?)
  texture = nullptr;
  SDL_Surface *tmpSurface = IMG_Load("ball.png");
  if (tmpSurface) {
    texture = SDL_CreateTextureFromSurface(renderer, tmpSurface);
    SDL_FreeSurface(tmpSurface);
  }

  srcRect.h = 64;
  srcRect.h = 64;
  srcRect.x = 0;
  srcRect.y = 0;

  destRect.h = 48;
  destRect.w = 48;
  destRect.x = 0;
  destRect.y = 0;

  xVelocity = 4;
  yVelocity = 4;

  std::cout << "Constructed Ball instance.\n";
}

// TODO(zmd): @Cleanup @Duplication with Paddle
Ball::~Ball() {
  cleanup();
  std::cout << "Destroyed Ball instance.\n";
}

// TODO(zmd): @Cleanup @Duplication with Paddle
void Ball::update() {
  destRect.x += xVelocity;
  destRect.y += yVelocity;

  if ((destRect.x <= 0) || ((destRect.x + destRect.w) >= gameWidth)) {
    xVelocity *= -1;
  }

  if ((destRect.y <= 0) || ((destRect.y + destRect.h) >= gameHeight)) {
    yVelocity *= -1;
  }
}

// TODO(zmd): @Cleanup @Duplication with Paddle
void Ball::render() {
  SDL_RenderCopy(renderer, texture, NULL, &destRect);
}

// TODO(zmd): @Cleanup @Duplication with Paddle
void Ball::cleanup() {
  if (texture) {
    SDL_DestroyTexture(texture);
    texture = nullptr;
  }
}

// TODO(zmd): @Cleanup @Duplication with Paddle
// TODO(zmd): std::string Ball::toString() {};
