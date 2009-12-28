package Euler::App;

use Moose;
use Modern::Perl;
extends 'Euler';

with 'MooseX::Getopt';

has 'benchmark' => ( is => 'rw', isa => 'Bool', default => sub { 0 } );
has 'verbose' => ( is => 'rw', isa => 'Bool', default => sub { 1 } );

after 'BUILD' => sub {
        my ($self) = @_;

        if($self->benchmark){
                $self->verbose(1); # Turn on verbose

                my $role = 'Euler::Benchmark';
                Moose::Util::apply_all_roles($self, ($role));
        }
};

before 'run' => sub {
        my ($self) = @_;

        $self->_get_problem;
};

after 'run' => sub {
        my ($self) = @_;

        $self->_say_solution;
};

sub _get_problem {
        my ($self) = @_;

        my $problem_num = $self->problem;
        my $problem_text = '';

        say sprintf("Problem %d\n%s",$problem_num,$problem_text);
}

sub _say_solution {
        my ($self, $result) = @_;

        say sprintf("Solution: %s",$self->result);
}


1;
