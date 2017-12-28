#include <iostream>
#include "game.h"

int main() {
  auto g = Game();
  std::cout << g.getTitle() << std::endl;

  return 0;
}
