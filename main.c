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

  lua_State *L = luaL_newstate();
  luaL_openlibs(L);

  int error;

  if ((error = luaL_loadstring(L, "print(\"Hello, Lua world.\")")
        || lua_pcall(L, 0, 0 , 0))) {
    // TODO(zmd): error handling!
  };

  if ((error = luaL_loadstring(L, "print(1 + 2 + 3 + 4 + 5)")
        || lua_pcall(L, 0, 0 , 0))) {
    // TODO(zmd): error handling!
  };

  lua_close(L);
}
