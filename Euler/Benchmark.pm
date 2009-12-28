package Euler::Benchmark;

use Modern::Perl;
use Moose::Role;
use Benchmark qw/timeit timestr/;

has 't_obj' => ( is => 'rw', isa => 'Benchmark');

around 'run' => sub {
        my ($orig, $self) = @_;

        $self->t_obj(timeit(1, sub { $self->$orig }));
        say "Time: " . timestr($self->t_obj);
};

1;
