#include "game.h"

using namespace std;


int main() {
  auto game = Game();

  if (!game.init())      return 1;
  if (!game.loadMedia()) return 2;

  game.blitMedia();
  game.delay(2000);

  return 0;
}
