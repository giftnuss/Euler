package Euler;

use Moose;
use Moose::Util;
use Math::Big;
use Modern::Perl;

with 'MooseX::Getopt';

has 'test' => ( is => 'rw', isa => 'Str', default => sub { '001' } );
has 'verbose' => ( is => 'rw', isa => 'Bool', default => sub { 1 } );

sub BUILD {
        my ($self, $params) = @_;

        $self->_load_role();
}

sub run {
        my ($self) = @_;

        $self->_solve;
}

sub _load_role {
        my ($self) = @_;

        my $role = 'Euler::' . $self->test;

        Moose::Util::apply_all_roles($self, ($role));

}

sub get_primes {
        my ($self, $max) = @_;

        my @primes = Math::Big::primes($max);

        return @primes;
}

1;
