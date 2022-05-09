#!/usr/bin/perl

use strict;
use warnings;

# For Beginning Perl, Chapter 7, Exercise 1 (p. 217)
# write average sub that averages list of numbers; no error checking

sub average {
    my @numbers = @_;
    my $num_samples = @numbers;
    my $sum = 0;
    foreach (@numbers) {
        $sum += $_;
    }
    return $sum / $num_samples;
}

# test with array
my @numbers = ( 3, 5, 9, 89, 23, 1, 13 );
print average(@numbers), "\n";

# test with list literal
print average(1, 2, 3, 4, 98, 34), "\n";
