#include "game.h"


Game::Game() {
  title = std::string("Pong");

  width  = 800;
  height = 640;

  fps        = 60;
  frameDelay = 1000 / fps;
  frameStart = 0;
  frameTime  = 0;

  running = false;

  window   = nullptr;
  renderer = nullptr;

  player = nullptr;
  ai     = nullptr;
  ball   = nullptr;

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

  // TODO(zmd): struct for room dimensions? (rather than passing in width and
  //     height refs?)
  // TODO(zmd): @Cleanup: how we're calculating starting positions sucks. Move
  //     the Paddle dependent part of the calculation inside the Paddle class.
  player = new Paddle(renderer, width, height,           10, height-32-20);
  ai     = new Paddle(renderer, width, height, width-128-10, 20);
  ball   = new Ball(renderer, width, height);  // TODO(zmd): start pos like with Paddle?
  if (!player || !ai || !ball) {
    cleanup();
    return false;
  }

  running = true;
  return true;
}

void Game::run() {
  printTitle();

  while (running) {
    frameStart = SDL_GetTicks();

    input();
    update();
    render();

    frameTime = SDL_GetTicks() - frameStart;

    if (frameDelay > frameTime) {
      SDL_Delay(frameDelay - frameTime);
    }
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
  player->update();
  ai->update();
  ball->update();
  ++counter;
}

void Game::render() {
  SDL_RenderClear(renderer);

  player->render();
  ai->render();
  ball->render();

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

  if (ai) {
    delete ai;
    ai = nullptr;
  }

  if (ball) {
    delete ball;
    ball = nullptr;
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
