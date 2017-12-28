// TODO(zmd) @Temporary: allow main to accept default args without using them
#pragma GCC diagnostic ignored "-Wunused-parameter"

#include "game.h"

int main(int argc, char *argv[]) {
  auto g = Game();

  g.init();
  g.run();

  return 0;
}
