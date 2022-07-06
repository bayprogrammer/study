#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use feature ':5.16';
use experimental 'signatures';

package Animal {
    sub new($class, $name) {
        my $self = {
            name => $name,
        };

        return bless $self, $class;
    }

    sub name($self, $new_name=undef) {
        if ($new_name) {
            $self->{name} = $new_name;
        }

        return $self->{name};
    }

    sub speak($self) {
        say("animal sound");
    }
}

package Dog {
    # see also https://perldoc.perl.org/parent (when in sep. files)
    our @ISA = qw(Animal);

    sub new($class, $name, $breed) {
        my $self = $class->SUPER::new($name);

        $self->{breed} = $breed;

        return $self;
    }

    sub breed($self) {
        return $self->{breed};
    }

    sub speak($self) {
        say("Woof!");
    }
}

my $a = Animal->new('Bill');
$a->speak();
say($a->name);

$a->name('Sam');
say($a->name);

my $d = Dog->new('Fido', 'Labrador');
$d->speak();
say($d->name);
say($d->breed);

$d->name('Spot');
say($d->name);

# of course, you shouldn't be able to change a breed for a living animal!
# $d->breed('Dalmation');  # BANG!

# now this is neat:
Animal::speak($d);

