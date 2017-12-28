#include <string>
#include <SDL2/SDL.h>

class Game {

private:

  std::string title;

  // TODO(zmd): look up how to set as class constants? (or at least read-only
  //     after initial set?)
  int width;
  int height;

  SDL_Window *window;
  SDL_Renderer *renderer;

public:

  Game();
  ~Game();

  bool init();

  void run();

  void printTitle();

};
