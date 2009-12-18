package Euler::001;

use Modern::Perl;
use Moose::Role;

requires 'run';

sub _solve {
        my ($self) = @_;

        my $final_num = 999;
        my $sum = 0;

        my @digits = map { $sum += $_; $_} grep { ($_ % 3 == 0) or ( $_ % 5 == 0) } 1..$final_num;

        say $sum;
}

1;
