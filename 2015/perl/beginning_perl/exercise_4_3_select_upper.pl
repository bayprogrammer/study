#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;

# For Beginning Perl, Chapter 4, Exercise 3 (p. 122)
# select subset of array: retain only all uppercase elements

my @ids = qw (AAA bbb Ccc ddD EEE);
my @upper = grep $_ eq uc $_, @ids;

print "ids:\t@ids\n";
print "upper:\t@upper\n";
