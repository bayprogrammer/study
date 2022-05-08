#include <iostream>
#include "game.h"

using namespace std;


Game::Game() {
  width  = 600;
  height = 480;

  const char* title = "SDL Tutorial";

  window  = nullptr;
  surface = nullptr;
  image   = nullptr;

  cout << "Game object constructed.\n";
}

Game::~Game() {
  if (window) {
    SDL_DestroyWindow(window);
    window = nullptr;
    surface = nullptr;
  }

  if (image) {
    SDL_FreeSurface(image);
    image = nullptr;
  }

  SDL_Quit();

  cout << "Game object destructed.\n";
}

bool Game::init() {
  if (SDL_Init(SDL_INIT_VIDEO) < 0) {
    cerr << "SDL could not initialize! SDL_Error: " << SDL_GetError() << endl;
    return false;
  }

  window = SDL_CreateWindow(title,
			    SDL_WINDOWPOS_UNDEFINED,
			    SDL_WINDOWPOS_UNDEFINED,
			    width,
			    height,
			    SDL_WINDOW_SHOWN);

  if (!window) {
    cerr << "Window could not be created! SDL_Error: " << SDL_GetError()
	 << endl;
    return false;
  }

  surface = SDL_GetWindowSurface(window);

  return true;
}

bool Game::loadMedia() {
  image = SDL_LoadBMP("hello_world.bmp");
  if (!image) {
    cerr << "Unable to load image hello_world.bmp! SDL Error: "
	 << SDL_GetError() << endl;
    return false;
  }

  return true;
}

void Game::blitMedia() {
  SDL_BlitSurface(image, NULL, surface, NULL);
  SDL_UpdateWindowSurface(window);
}

void Game::delay(int ms_delay) {
  SDL_Delay(ms_delay);
}
