#include "player.h"


Player::Player(SDL_Renderer *const ren,
               const int &gameW,
               const int &gameH) :
  renderer(ren),
  gameWidth(gameW),
  gameHeight(gameH) {

  texture = nullptr;
  // TODO(zmd): need texture loading routine (TextureLoader::loadTexture()?)
  SDL_Surface *tmpSurface = IMG_Load("player.png");
  if (tmpSurface) {
    texture = SDL_CreateTextureFromSurface(renderer, tmpSurface);
    SDL_FreeSurface(tmpSurface);
  }

  srcRect.h = 64;
  srcRect.h = 64;
  srcRect.x = 0;
  srcRect.y = 0;

  destRect.h = 64;
  destRect.w = 64;
  destRect.x = 0;
  destRect.y = 0;

  xVelocity = 4;
  yVelocity = 4;

  std::cout << "Constructed Player instance.\n";
}

Player::~Player() {
  cleanup();
  std::cout << "Destroyed Player instance.\n";
}

void Player::update() {
  destRect.x += xVelocity;
  destRect.y += yVelocity;

  if ((destRect.x <= 0) || ((destRect.x + destRect.w) >= gameWidth)) {
    xVelocity *= -1;
  }

  if ((destRect.y <= 0) || ((destRect.y + destRect.h) >= gameHeight)) {
    yVelocity *= -1;
  }
}

void Player::render() {
  SDL_RenderCopy(renderer, texture, NULL, &destRect);
}

void Player::cleanup() {
  if (texture) {
    SDL_DestroyTexture(texture);
    texture = nullptr;
  }
}
