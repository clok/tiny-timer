=head1 NAME

TinyTimer - A Very simple timer module for perl

=head1 SYNOPSIS

Simply create a new TinyTimer object:

my $timer = TinyTimer->new;

Then "start" and "stop" in your code for time deltas.

$timer->start;
<<code>>
.
.
.
$time->stop;

On "stop" the "delta" property is populated and can be used.

print $timer->delta;

Output:
>> 0.0003447273118

That's it!

=head1 DESCRIPTION

=head2 FUNCTIONS

=head3 new

Constructor for TinyTimer

=head3 start

Starts a new timer at '0' ('Time::HiRes::time' populates the "start" property)

=head3 stop

Takes current time, 'Time::HiRes::time', and populates the "stop" property.
This will also call "_delta"

=head3 delta

Returns the "delta" property.

=head3 _delta

Takes the currently stored "start" & "stop" and calculates the delta.
Populates the "delta" property.

=head2 AUTHOR

Derek Smith
drsmith.phys@gmail.com

=cut

use strict;
use warnings;
use Time::HiRes;

package TinyTimer;

sub new {
	my $class = shift;
	$class = ref($class) || $class;

	my $self = {};
	$self->{START} = undef;
	$self->{STOP} = undef;
	$self->{DELTA} = undef;

	bless $self, $class;

	return $self;
}

sub start {
	my $self = shift;
	$self->{START} = Time::HiRes::time;
}

sub stop {
	my $self = shift;
	$self->{STOP} = Time::HiRes::time;
	$self->_delta;
}

sub delta {
	my $self = shift;
	return sprintf("%.6f", $self->{DELTA});
}

sub _delta {
	my $self = shift;
	$self->{DELTA} = $self->{STOP} - $self->{START};
}

1;
