#!/usr/bin/env perl

use strict;
use warnings;

use Module::Build;

Module::Build->new(
	module_name        => 'TinyTimer',
	dist_abstract      => 'Simple wrapper around Timer::HiRes for timing stats',
	dist_author        => 'Derek Smith <derek@clokwork.net>',
	build_requires     => {
		'Time::HiRes'   => 0,
	},
	requires           => {
		'Time::HiRes'   => 0,
	}
)->create_build_script;
