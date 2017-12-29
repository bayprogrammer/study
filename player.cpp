#include "player.h"


Player::Player(SDL_Renderer *renderer) {
  texture = nullptr;

  //srcRect;
  destRect.h = 64;
  destRect.w = 64;
  destRect.x = 0;
  destRect.y = 0;

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
  destRect.x += 1;
  destRect.y += 2;
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
