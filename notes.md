# 21st Century C

-----

## Chapter 1: Set Yourself Up for Easy Compilation

Install C libraries via OS package manager (like with apt, dnf, or the various
ports/packages systems available on the BSDs):

```
$ sudo dnf install libcurl-devel \
                   glib-devel \
                   gsl-devel \
                   sqlite-devel \
                   libxml2-devel
```

This is an interesting perspective, to see the native OS' package management
system as being the first-class way to install C libraries. No
Crates/Gems/etc. are necessarily needed. Unix is, in its entirety, a complete
development environment for C, and modern Unix-type systems all have very good
systems for installing packages natively (aside from macOS, the crippled BSD
wannabe; but at least you can use Homebrew there).

Can compile with gcc or clang directly with various useful flags:

```
$ gcc foo.c -o foo -lm -g -Wall -Werror -O3 -std=gnu11
$ clang foo.c -o foo -lm -g -Wall -Werror -O3 -std=gnu11
```

But we can use Makefiles for a better compilation experience.

/some/path/lib for shared library files (shared objects?), /some/path/include
for the header files (providing the ability to make calls to those shared
library functions).

- /usr/lib
- /usr/include
- /usr/local/lib
- /usr/local/include
- ~/.local/lib
- ~/.local/include

To use custom location one can specify via flags:

```
$ gcc -I~/.local/include myprog.c -o myprog -L~/.local/lib -lcustomlib
```

Where `customlib` is your custom library installed to ~/.local/lib and
~/.local/include.

`-I` to augment include search path (makes them available like system h files,
so you can include via angle brackets).

`-L` to augment library search path (so you can link to custom libraries)

`-l` to specify which shared library to link with

`pkg-config` can be used to automatically generate appropriate flags for
specified libraries (as long as it knows where the libs exist, which can be
configured):

```
$ pkg-config --libs gsl libxml-2.0
$ pkg-config --cflags gsl libxml-2.0
```

Shell substitution can be used to include the information for the build command
(such as in makefile). The `pkg-config` not only finds the libs, but works out
dependencies and puts them all in the correct order in the compilation flags it
generates.

```
$ gcc $(pkg-config --cflags --libs gsl libxml-2.0) -o specific specific.c
```

There are flags to set in a makefile (or otherwise?) which allow your compiled program to be annotated with the locations to find linked libraries at runtime (if they're not in the usual places for your system):

```
$ LDADD=-L~/.local/lib -Wl,-R~/.local/lib
```

Another, possibly more resiliant solution (especially for writing C programs
quickly on your own system) is to specify a `LD_LIBRARY_PATH` (which is like
`PATH` except for searching for dynamic libraries to link with at runtime for
programs you execute from the commandline; done by something called a "runtime
linker"):

```
export LD_LIBRARY_PATH=~/.local/lib:$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=~/.local/lib:$DYLD_LIBRARY_PATH  # stupid macOS
```

Shortest practical Makefile example per the book:

```
P=program_name
OBJECTS=
CFLAGS = -g -Wall -O3
LDLIBS =
CC     = c99

$(P): $(OBJECTS)
```

Such will allow you to compile your prog_name.c source (note you don't specify
the '.c' inside the makefile for the `P` variable).

A Makefile as follows could be used to construct a program, `domath`, from the
source files `addition.c` and `subtraction.c`:

```
P=domath
OBJECTS=addition.o subtraction.o

$(P): $(OBJECTS)
```

There are implicit defaults that will be applied to automatically infer to
first compile the `.o` files from their correponding `.c` files, as well as
`domath.o`, to meet the dependencies we specified to build `domath` itself.

We can use `pkg-config` in our Makefile, per book:

```
CFLAGS=`pkg-config --cflags apophenia glib-2.0` -g -Wall -std=gnu11 -O3
LDLIBS=`pkg-config --libs apophenia glib-2.0`
```

You could use `make` without a Makefile even, exporting the above environment
variables first then running `make myprogname`.

The author encourages us to learn and use Autotools for setting up our own
projects to build shared objects for any given system, rather than worry about
system-specific specifics. The OpenBSD project seems to dislike Autotools (as
does the Suckless and Cat-V groups I believe). I'll have to experiment with the
different styles and decide for myself. For now, both so I can follow the book
and because Linux is my first platform of choice, I'll continue along the
Autotools path. But I really will need to setup some BSD VMs and fully test any
code I want to publish against those OSes as well (maybe Minix as well?),
because I want my public open source programs to be cross-platform (within the
FLOSSY UNIX world, Windows is not a priority at all for me, and macOS is a very
low priority).

### Using Libraries from Source

For stuff in home dir, these are the variables for shell and make:

```
PATH=~/.local/bin:$PATH

LDLIBS=-L$(HOME)/.local/lib  #plus -l options
CFLAGS=-I$(HOME)/.local/include #plus compiler options like -O3
```

Then to install a library for use in your programs to your home directory,
assuming it uses Autotools:

```
$ ./configure --prefix=$HOME/.local
$ make
$ make install
```

No `sudo` required.

Manpages. `man`, `man -k`, `apropos`. Manual sections:

- Section 1: command line apps, e.g. `man 1 printf`
- Section 3: library functions, e.g. `man 3 printf`
- Other sections (learn about them using `man 1 man`

### Compiling C Programs via Here Document

`gcc -include stdio.h` => `#include <stdio.h>`, same for `clang`.

#### Unified Header

For those quick-n-dirty C programs (you can use C too for "scripts")!

List of C stdlib include files (from: http://en.cppreference.com/w/c/header):

- <assert.h>      Conditionally compiled macro that compares its argument to
                    zero
- <complex.h>     Complex number arithmetic (since C99)
- <ctype.h>       Functions to determine the type contained in character data
- <errno.h>       Macros reporting error conditions
- <fenv.h>        Floating-point environment (since C99)
- <float.h>       Limits of float types
- <inttypes.h>    Format conversion of integer types (since C99)
- <iso646.h>      Alternative operator spellings (since C95)
- <limits.h>      Sizes of basic types
- <locale.h>      Localization utilities
- <math.h>        Common mathematics functions
- <setjmp.h>      Nonlocal jumps
- <signal.h>      Signal handling
- <stdalign.h>    `alignas` and `alignof` convenience macros (since C11)
- <stdarg.h>      Variable arguments
- <stdatomic.h>   Atomic types (since C11)
- <stdbool.h>     Boolean type (since C99)
- <stddef.h>      Common macro definitions
- <stdint.h>      Fixed-width integer types (since C99)
- <stdio.h>       Input/output
- <stdlib.h>      General utilities: memory management, program utilities,
                    string conversions, random numbers
- <stdnoreturn.h> `noreturn` convenience macros (since C11)
- <string.h>      String handling
- <tgmath.h>      Type-generic math (macros wrapping `math.h` and `complex.h`)
                    (since C99)
- <threads.h>     Thread library (since C11)
- <time.h>        Time/date utilities
- <uchar.h>       UTF-16 and UTF-32 character utilities (since C11)
- <wchar.h>       Extended multibyte and wide character utilities (since C95)
- <wctype.h>      Wide character classification and mapping utilities (since
                    C95)

See also: https://en.wikipedia.org/wiki/C_standard_library

With my allheads.h linked to ~/.local/include, I can create the go_c alias per
the book modified like so:

```
$ alias go_c="cc -xc - -I~/.local/include \
                       -L~/.local/lib \
                       -lm \
                       -Wall -include allheads.h -O3 -std=gnu11"
$ go_c << EOF
int main() {
  printf("Hello, world.\n");
}
EOF
$ ./a.out
```

Kinda neat!

Need to check out c99sh as well, making this even better:

- https://github.com/RhysU/c99sh

*NOTE(zmd): completed chapter on 4-Mar-2017*

-----

## Chapter 2: Debug, Test, Document

*TODO(zmd): left off here on 4-Mar-2017*
