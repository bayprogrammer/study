//
// g++ -std=c++0x initialization.cpp -o initialization
//

#include <iostream>
using namespace std;

int main() {
  int a = 5;
  int b(3);
  int c{2};
  int result;

  a = a + b;
  result = a - c;
  cout << result << endl;

  return 0;
}
