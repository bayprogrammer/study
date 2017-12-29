// TODO(zmd) @Temporary: allow main to accept default args without using them
#pragma GCC diagnostic ignored "-Wunused-parameter"

#include <iostream>

#include "game.h"


int main(int argc, char *argv[]) {
  auto g = Game();

  if (!g.init()) {
    std::cerr << "Unable to initialize game.\n";
    return 1;
  }

  g.run();

  return 0;
}
