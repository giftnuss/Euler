package Euler;

use Moose;
use Moose::Util;
use Modern::Perl;

with qw/
        Euler::MathUtils
        /;

has 'problem' => ( is => 'rw', isa => 'Str', default => sub { '001' } );
has 'result' => ( is => 'rw', isa => 'Any' );

sub BUILD {
        my ($self, $params) = @_;

        $self->_load_problem();
}

sub run {
        my ($self) = @_;

        return $self->result($self->_solve);
}

=head2

Load the given Problems.

TODO: Handle multiple tests

=cut 

sub _load_problem {
        my ($self) = @_;

        my $role = join '::', ('Euler', 'Problems', $self->problem);

        Moose::Util::apply_all_roles($self, ($role));

}

1;
