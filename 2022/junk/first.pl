#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use feature ':5.16';
use experimental 'signatures';

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
