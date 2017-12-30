#pragma once

#include <string>
#include <iostream>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>

#include "player.h"


class Game {

private:

  std::string title;

  int width;
  int height;

  int fps;
  int frameDelay;
  unsigned long int frameStart;
  int frameTime;

  bool running;

  SDL_Window   *window;
  SDL_Renderer *renderer;

  // TODO(zmd): Entity <- {Ball, Player} (not via inheritance, but other form
  //     of composition?)
  // TODO(zmd): Ball *ball;
  Player *player;  // TODO(zmd): Paddle *player
  // TODO(zmd): Paddle *ai

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
