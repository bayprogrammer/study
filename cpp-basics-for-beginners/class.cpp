#include <iostream>
#include <string>


class Player {

private:

  std::string player;

  int health;
  int armour;
  int magika;

public:

  Player(std::string name) {
    player = name;

    health = 100;
    armour = 100;
    magika = 100;

    std::cout << player << " created.\n";
  }

  ~Player() {
    std::cout << player << " destroyed.\n";
  }

  void print() {
    std::cout << player << " stats:" << std::endl;
    std::cout << "   health: " << health << ", " << std::endl
	      << "   armour: " << armour << ", " << std::endl
	      << "   magika: " << magika << std::endl;
  }

  int getHealth() {
    return health;
  }

};


int main() {
  Player player("Zeb");
  player.print();

  return 0;
}
