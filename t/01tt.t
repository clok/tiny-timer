
#! /usr/bin/env perl

use strict;
use warnings;

use Test::More qw( no_plan );

$|=1;
use_ok('TinyTimer');

my $tt = TinyTimer->new;
ok( $tt,
	 'Create TineyTimer' );
ok( defined $tt->{LOCAL},
	 'LOCAL not set' );

my $local = $tt->local;
ok( defined $local,
	 '$local not set' );

$tt->start;
ok( defined $tt->{START},
	 'START not set' );
ok( defined $tt->{_START},
	 '_START not set' );

my $prev_start = $tt->{_START};
$tt->stop;
ok( defined $tt->{STOP},
	 'STOP not defined' );
ok( $tt->{_START} == $tt->{STOP},
	 '_START not set to STOP' );
ok( defined $tt->{DELTA},
	 'DELTA not defined' );

$prev_start = $tt->{_START};
my $split = $tt->split;
ok( defined $split,
	 '$split not set' );
ok( defined $tt->{_STOP},
	 '_STOP not set' );
ok( defined $tt->{_SPLIT},
	 '_SPLIT not set' );
ok( $tt->{_START} != $prev_start,
	 '_START not set to STOP' );
