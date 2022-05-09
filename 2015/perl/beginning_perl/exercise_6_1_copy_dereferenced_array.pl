#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

# For Beginning Perl, Chapter 6, Exercise 1 (p. 173)
# Create reference to array, create reference, then copy values via
# dereference

my @first = (1, 2, 3, 4, 5, 6, 7, 8, 9);
my $first_ref = \@first;

# make a *copy* of the *referent*, not the reference value itself
my @second = @$first_ref;

print Dumper \@first, $first_ref, \@second;
