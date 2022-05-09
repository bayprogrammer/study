#!/usr/bin/perl

use strict;
use warnings;

# For Beginning Perl, Chapter 3, Exercise 3 (p. 81)
# create and loop over a hash of fruits and their colors

my %fruits = (
    bananas => 'yellow',
    apples => 'red',
    oranges => 'orange',
    pears => 'green',
    cherries => 'deep red',
    lemons => 'yellow',
);

for my $fruit (keys %fruits) {
    print "$fruit are $fruits{$fruit}\n";
}
