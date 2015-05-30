#!/usr/bin/perl

use strict;
use warnings;

# For Beginning Perl, Chapter 6, Exercise 2 (p. 173)
# query out Jim's individual and total sales for Friday

# sales data provided by book for use in this exercise
my $sales = {
    monday    => { jim => [ 2       ], mary => [ 1, 3, 7       ] },
    tuesday   => { jim => [ 3, 8    ], mary => [ 5, 5          ] },
    wednesday => { jim => [ 7, 0    ], mary => [ 3             ] },
    thursday  => { jim => [ 4       ], mary => [ 5, 7, 2, 5, 2 ] },
    friday    => { jim => [ 1, 1, 5 ], mary => [ 2             ] },
};

# get arrayref of Jim's Friday sales
my $jim_friday_sales = $sales->{friday}{jim};

# summarize Jim's sales for Friday
my $jim_total_sales = 0;
for my $sale (@$jim_friday_sales) {
    print "Jim made a sale for:\t\t\$$sale\n";
    $jim_total_sales += $sale;
}
print "Jim's total Friday sales:\t\$$jim_total_sales\n";
