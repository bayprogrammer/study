#!/usr/bin/perl

use strict;
use warnings;
use diagnostics;

# For Beginning Perl, Chapter 4, Exercise 2 (p. 122)
# convert array of Fahrenheit values to an array of Celsius values

my @fahrenheit = ( 0, 32, 65, 80, 212 );
my @celsius = map { ( $_ - 32 ) * ( 5 / 9 ) } @fahrenheit;

for my $index (0 .. $#celsius) {
    # Round the converted Celsius value
    my $c_temp = sprintf "%.2f", $celsius[$index];

    # Print Fahrenheit value and Celcius conversion, tab aligned
    print "$fahrenheit[$index] (f)\t=>\t";
    print "$c_temp (c)\n";
}
