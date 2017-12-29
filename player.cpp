#include "player.h"


Player::Player(int gWidth, int gHeight, SDL_Renderer *renderer) {
  gameWidth = gWidth;
  gameHeight = gHeight;

  texture = nullptr;

  //srcRect;
  destRect.h = 64;
  destRect.w = 64;
  destRect.x = 0;
  destRect.y = 0;

  xVelocity = 4;
  yVelocity = 4;

  SDL_Surface *tmpSurface = IMG_Load("player.png");

  if (tmpSurface) {
    texture = SDL_CreateTextureFromSurface(renderer, tmpSurface);
    SDL_FreeSurface(tmpSurface);
  }
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

void Player::render(SDL_Renderer *renderer) {
  SDL_RenderCopy(renderer, texture, NULL, &destRect);
}

void Player::cleanup() {
  if (texture) {
    SDL_DestroyTexture(texture);
    texture = nullptr;
  }
}
