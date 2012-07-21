TinyTimer.pm
==========
Very simple timer module for perl

SYNOPSIS
------

Simply create a new TinyTimer object:

```perl
my $timer = TinyTimer->new;
```

Then "start" and "stop" in your code for time deltas.

```perl
$timer->start;
.
.
<CODE>
.
.
$time->stop;
```

On "stop" the "delta" property is populated and can be used.

```perl
print $timer->delta;
```

Output:
```
0.0003447273118
```

That's it!

DESCRIPTION
-----
### FUNCTIONS
#### new
Constructor for TinyTimer

####start
Starts a new timer at '0' ('Time::HiRes::time' populates the "start" property)

####stop
Takes current time, 'Time::HiRes::time', and populates the "stop" property.
This will also call "_delta"
####delta
Returns the "delta" property.
####_delta
Takes the currently stored "start" & "stop" and calculates the delta.
Populates the "delta" property.

AUTHOR
----
Derek Smith
[drsmith.phys--AT--gmail.com](drsmith.phys@gmail.com)