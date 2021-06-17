#!/usr/bin/perl

use v5.30;
use utf8;
use warnings;
use open qw(:std :utf8);
use experimental qw(signatures);

package Langs {
  sub new {
    my ($class, @books) = @_;
    return bless \@books, $class
  }

  sub joined($self) {
    return join ', ', @$self
  }
};

my @langs_i_like = qw(
  perl
  c/c++
  js
  lua
  ruby
  php
  python
);

sub lang_say(@langs) {
  my $num_langs = @langs;
  my $lang_preso = join ', ', @langs;

  say "I like $num_langs languages: $lang_preso."
}

lang_say(@langs_i_like);

my $l = Langs->new(@langs_i_like);
say $l->joined;
say $l;

for my $lang (@langs_i_like) {
  say uc $lang;
}

# -----

sub counter {
  state $n = 0;
  return $n++;
}

for (0 .. 20) {
  my $c = counter();
  printf("%05i\n", $c);
}

sub truth($value) {
  if (not defined($value)) {
    return "UNDEF";
  } elsif ($value) {
    return "TRUE";
  } else {
    return "FALSE";
  }
}

my ($a, $b, $c, $d) = (undef, undef, 0, 0);
$a ||= "foo";
$b //= "bar";
$c ||= "baz";
$d //= "quux";

say join(', ', ($a, $b, $c, $d));

# interpolate expressions (function calls) -- an ugly hack :(
say "@{[truth(undef())]}";
say "@{[truth(0)]}";
say "@{[truth('0')]}";
say "@{[truth(1)]}";
say "@{[truth(0.0)]}";
say "@{[truth('0.0')]}";

say \"foo";
say \42;

# I think this just generates a ref to a scalar string, not a "package" object.
say \__PACKAGE__;

package Foo {
  sub self {
    return __PACKAGE__;
  }

  sub woot {
    return "toot";
  }
}

my $foo_pkg = Foo->self;
say Foo->woot;
say $foo_pkg->woot;
say $foo_pkg;
my $foo_str_pkg = 'Foo';
say $foo_str_pkg->woot;
say 'Foo'->woot;

# ------

use experimental qw(refaliasing);

my @lang_hashes = (
  # perl & cousins
  {name => "Perl"},
  {name => "Ruby"},
  {name => "PHP"},
  {name => "Elixir"},

  # & friends
  {name => "C/C++"},
  {name => "JavaScript"},
  {name => "Lua"},
);

# using references (creates a new scalar each time through)
for my $lang_hash_ref (@lang_hashes) {
  say "  by ref: ", $lang_hash_ref->{name}
}

# using aliases (no new variable each time through)
for \my %lang_hash_alias (@lang_hashes) {
  say "by alias: ", $lang_hash_alias{name}
}
