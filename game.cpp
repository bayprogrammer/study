#include <iostream>
#include <cassert>
#include "game.h"

Game::Game() {
  title = std::string("Pong");

  width = 800;
  height = 640;

  window = nullptr;
  renderer = nullptr;
}

Game::~Game() {
  if (renderer) SDL_DestroyRenderer(renderer);
  if (window) SDL_DestroyWindow(window);
}

bool Game::init() {
  window = SDL_CreateWindow(title.data(),
			    SDL_WINDOWPOS_UNDEFINED,
			    SDL_WINDOWPOS_UNDEFINED,
			    width,
			    height,
			    SDL_WINDOW_SHOWN);

  if (!window) {
    return false;
  }

  renderer = SDL_CreateRenderer(window, -1, 0);

  if (!renderer) {
    SDL_DestroyWindow(window);
    window = nullptr;
    return false;
  }

  SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);
  SDL_RenderClear(renderer);

  return true;
}

void Game::run() {
  assert(window);
  assert(renderer);

  printTitle();

  SDL_RenderPresent(renderer);
  SDL_Delay(3000);
}

void Game::printTitle() {
  std::cout << title << std::endl;
}
