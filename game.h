#pragma once

#include <string>
#include <iostream>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>

#include "player.h"


class Game {

private:

  std::string title;

  // TODO(zmd): look up how to set as class constants? (or at least read-only
  //     after initial set?)
  int width;
  int height;

  bool running;

  SDL_Window   *window;
  SDL_Renderer *renderer;

  Player *player;

  int counter;

public:

  Game();
  ~Game();

  /// Initialize game
  bool init();

  /// Run the game until stopped
  void run();

  /// Handle user input
  void input();

  /// Update game state
  void update();

  /// Render game state to display
  void render();

  /// Stop the game
  void stop();

  /// Cleanup all game resources
  void cleanup();

  /// Output game title to console
  void printTitle();

};
