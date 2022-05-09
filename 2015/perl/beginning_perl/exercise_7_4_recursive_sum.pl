#!/usr/bin/perl

use strict;
use warnings;

# For Beginning Perl, Chapter 7, Exercise 4 (p. 217)
# write sum function that uses recursion to perform operation

sub sum {
    return 0 if not @_;
    my $num = shift;
    return $num + sum(@_);
}

print sum(1, 2, 3, 4, 5), "\n";
print sum(1, 9, 2, 4, 8), "\n";
