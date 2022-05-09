#!/usr/bin/perl

use strict;
use warnings;

# For Beginning Perl, Chapter 7, Exercise 3 (p. 217)
# write function generator to make arbitrary multiplier functions

sub make_multiplier {
    my $factor1 = shift;
    return sub {
        my $factor2 = shift;
        return $factor1 * $factor2;
    }
}

# test code provided by the book
my $times_seven = make_multiplier(7);
my $times_five = make_multiplier(5);
print 21 == $times_seven->(3) ? "yes\n" : "no\n";
print 20 == $times_five->(4) ? "yes\n" : "no\n";
