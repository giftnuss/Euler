package Euler::001;

use Modern::Perl;
use Moose::Role;

requires 'run';

sub _solve {
        my ($self) = @_;

        say 'Problem 001';
        say 'If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.\n\nFind the sum of all the multiples of 3 or 5 below 1000.';

        my $final_num = 999;
        my $sum = 0;

        my @digits = map { $sum += $_; $_} grep { ($_ % 3 == 0) or ( $_ % 5 == 0) } 1..$final_num;

        say $sum;
}

1;
