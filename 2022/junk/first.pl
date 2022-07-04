#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use feature ':5.16';
use experimental 'signatures';

# -- loop over hash ----------------------------------------------------------

my $x = {
  a => 'apple',
  b => 'blueberry',
};

foreach my $key (sort keys %$x) {
  my $value = $x->{$key};
  say "$key: $value";
}

my %y = (
  a => 'apple',
  b => 'blueberry',
);

foreach my $key (sort keys %y) {
  my $value = $y{$key};
  say "$key: $value";
}

# -- use anon subref for referent --------------------------------------------

package Pet {
  use Carp;

  our $public = {
    'name' => 1
  };

  sub new($class, %attrs) {
    my $fn = sub ($key) {
      if ($public->{$key}) {
        return $attrs{$key};
      } else {
        carp('Attempt to access private member.');
      }
    };

    return bless $fn, $class;
  }

  sub name($self) {
    return $self->('name');
  }
}

my $friend = Pet->new(name => 'Fido', type => 'dog');
say $friend->name;
# say $friend->type;  # no such accessor!
say $friend->('type'); # undef warning, no direct access!

# -- use anon subref closing over specific fields ----------------------------

package Pair {
  sub new($class, $car, $cdr) {
    my $fn = sub ($key) {
      if ($key eq 'car') {
        return $car;
      } else {
        return $cdr;
      }
    };

    return bless $fn, $class;
  }

  sub car($self) {
    return $self->('car');
  }

  sub cdr($self) {
    return $self->('cdr');
  }

  sub inspect($self) {
    my ($car, $cdr) = ($self->car, $self->cdr);
    return "($car . $cdr)";
  }
}

my $cell = Pair->new('first', 'second');
say $cell->inspect;

