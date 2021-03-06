package Euler::Problems::003;

use Modern::Perl;
use Moose::Role;

requires 'run';

sub _solve {
        my ($self) = @_;

        my $target = 600851475143;

        my $max_prime = sprintf "%d", sqrt $target;

        my @primes = $self->get_primes($max_prime);

        my @pf;

        while($target > 1){
                foreach (@primes){
                        if ($target % $_ == 0){
                                push @pf, $_;
                                $target /= $_;
                                last if $target == 1;
                        }
                }
        }

        return pop @pf;
}

1;
