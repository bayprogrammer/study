#include <stdio.h>
#include <lauxlib.h>
#include <lua.h>
#include <lualib.h>

// pushd vendor/lua
// make
// popd
// gcc main.c -Lvendor/lua/src -Ivendor/lua/src -llua -lm -ldl -Wall -Wextra -Wpedantic -Werror -Wfatal-errors && ./a.out foo
int main(int argc, char** argv) {
  for (int i=0; i < argc; ++i) {
    printf("%s\n", argv[i]);
  }

  printf("Hello, world.\n");

  lua_State *L = luaL_newstate();

  lua_close(L);
}
