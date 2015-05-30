#!/usr/bin/perl

use strict;
use warnings;

# For Beginning Perl, Chapter 5, Exercise 3 (p. 154)
# compute and print the average of an array of numbers

my @numbers = (1, 2, 8, 2, 5, 3, 0, 3, 5, 9, 2);
my $num_of_elements = @numbers;

# compute sum of the numbers
my $sum = 0;
for my $number (@numbers) {
    $sum += $number;
}

# compute the average, round to two decimal points
my $average = $sum / $num_of_elements;
$average = sprintf "%.2f", $average;

# output our results
print "Number of elements:\t\t$num_of_elements\n";
print "Sum of the elements:\t\t$total\n";
print "Average of the elements:\t$average\n";
