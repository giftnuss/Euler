package Euler;

use Moose;
use Moose::Util;
use Modern::Perl;

with 'Euler::MathUtils';

has 'result' => ( is => 'rw', isa => 'Any' );

sub BUILD {
        my ($self, $params) = @_;

        $self->_load_role();
}

sub run {
        my ($self) = @_;

        $self->_get_problem if $self->verbose;

        $self->result($self->_solve);

        $self->_say_solution if $self->verbose;

        return $self->result;
}

sub _get_problem {
        my ($self) = @_;

        my $problem_num = $self->test;
        my $problem_text = '';

        say sprintf("Problem %d\n%s",$problem_num,$problem_text);
}

sub _say_solution {
        my ($self, $result) = @_;

        say sprintf("Solution: %s",$self->result);
}

sub _load_role {
        my ($self) = @_;

        my $role = join '::', ('Euler', 'Problems', $self->test);

        Moose::Util::apply_all_roles($self, ($role));

}

1;
