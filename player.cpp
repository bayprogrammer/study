#include "player.h"


Player::Player(SDL_Renderer *renderer) {
  texture = nullptr;
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

void Player::cleanup() {
  if (texture) {
    SDL_DestroyTexture(texture);
    texture = nullptr;
  }
}
