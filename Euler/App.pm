package Euler::App;

use Moose;
extends 'Euler';

with 'MooseX::Getopt';

has 'test' => ( is => 'rw', isa => 'Str', default => sub { '001' } );
has 'verbose' => ( is => 'rw', isa => 'Bool', default => sub { 1 } );

1;
