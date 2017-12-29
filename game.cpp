#include "game.h"


Game::Game() {
  title = std::string("Pong");

  width = 800;
  height = 640;

  running = false;

  window   = nullptr;
  renderer = nullptr;

  player = nullptr;

  counter = 0;

  std::cout << "Constructed Game instance.\n";
}

Game::~Game() {
  cleanup();

  std::cout << "Destroyed Game instance.\n";
}

bool Game::init() {
  if (SDL_Init(SDL_INIT_VIDEO) < 0) {
    return false;
  }

  window = SDL_CreateWindow(title.data(),
                            SDL_WINDOWPOS_UNDEFINED,
                            SDL_WINDOWPOS_UNDEFINED,
                            width,
                            height,
                            SDL_WINDOW_SHOWN);
  if (!window) {
    cleanup();
    return false;
  }

  renderer = SDL_CreateRenderer(window, -1, 0);
  if (!renderer) {
    cleanup();
    return false;
  }

  SDL_SetRenderDrawColor(renderer, 0, 255, 0, 255);

  player = new Player(renderer);
  if (!player) {
    cleanup();
    return false;
  }

  running = true;
  return true;
}

void Game::run() {
  printTitle();

  while (running) {
    std::cout << counter << std::endl;

    input();
    update();
    render();

    ++counter;
    SDL_Delay(1000 / 60);
  }

  std::cout << "Game loop exiting.\n";
}

void Game::input() {
  SDL_Event event;
  SDL_PollEvent(&event);

  switch(event.type) {
  case SDL_QUIT:
    stop();
    break;

  default:
    break;
  }
}

void Game::update() {
  // TODO(zmd): update game objects' state!
}

void Game::render() {
  SDL_RenderClear(renderer);

  SDL_RenderCopy(renderer, player->texture, NULL, NULL);

  SDL_RenderPresent(renderer);
}

void Game::stop() {
  running = false;
}

void Game::cleanup() {
  if (player) {
    delete player;
    player = nullptr;
  }

  if (renderer) {
    SDL_DestroyRenderer(renderer);
    renderer = nullptr;
  }

  if (window) {
    SDL_DestroyWindow(window);
    window = nullptr;
  }

  SDL_Quit();
}

void Game::printTitle() {
  std::cout << title << std::endl;
}
