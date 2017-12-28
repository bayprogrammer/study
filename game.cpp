#include "game.h"

Game::Game() {
  title = std::string("Pong");
}

Game::~Game() {
}

std::string Game::getTitle() {
  return title;
}
