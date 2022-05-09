#!/usr/bin/perl

use strict;
use warnings;

# For Beginning Perl, Chapter 5, Exercises 5 & 6 (pp. 154-155)
# calculate strength of characters for hypothetical game

# NOTE: subs would be very nice for this exercise, but not using
# because we haven't gotten to them yet in the book

# character stat hash provided in book for use in this exercise:
my %stat_for = (
    strength     => undef,
    intelligence => undef,
    dexterity    => undef,
);

# add your code here (character stats generator)
for my $attribute (keys %stat_for) {
    # roll the dice
    my $stat = ( 1 + int rand 6 ) + ( 1 + int rand 6 );
    $stat_for{$attribute} = $stat;
}

# character stats output code provided in book for use in this
# exercise:
print "Stats for a mere normal character.\n";
print <<"END_CHARACTER";
Strength:      $stat_for{strength}
Intelligence:  $stat_for{intelligence}
Dexterity:     $stat_for{dexterity}
END_CHARACTER

# extra credit: calculate stats for "exceptional" character
for my $attribute (keys %stat_for) {
    my $stat = ( 1 + int rand 6 ) + ( 1 + int rand 6 );
    if ($stat < 6) {
        # discard any value less than 6 and try again for the current
        # attribute
        redo;
    }
    $stat_for{$attribute} = $stat;
}

print "Stats for an exceptional character!\n";
print <<"END_CHARACTER";
Strength:      $stat_for{strength}
Intelligence:  $stat_for{intelligence}
Dexterity:     $stat_for{dexterity}
END_CHARACTER
