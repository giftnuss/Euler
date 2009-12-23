package Euler::MathUtils;

use Modern::Perl;
use Moose::Role;
use Math::Big;

sub get_primes {
        my ($self, $max) = @_;

        my @primes = Math::Big::primes($max);

        return @primes;
}

1;
