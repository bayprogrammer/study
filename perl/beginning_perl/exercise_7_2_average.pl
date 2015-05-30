#!/usr/bin/perl

use strict;
use warnings;
use Carp 'croak';
use Scalar::Util 'looks_like_number';

# For Beginning Perl, Chapter 7, Exercise 2 (p. 217)
# write average sub that averages list of numbers; with error checking

sub average {
    my @numbers = @_;
    my $num_samples = @numbers;
    my $sum = 0;
    foreach (@numbers) {
        if (looks_like_number $_) {
            $sum += $_;
        }
        else {
            croak "Non number contained in the array."
        }
    }
    return $sum / $num_samples;
}

# test with array
my @numbers = ( 3, 5, 9, 89, 23, 1, 13 );
print average(@numbers), "\n";

# test with list literal
print average(1, 2, 3, 4, 98, 34), "\n";

# test with non-numeric data
print average(1, 2, "hello", [2, 3])
