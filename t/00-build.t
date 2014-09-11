use strict;
use warnings;

use File::Temp qw(tempdir);
use Capture::Tiny qw(capture);
use Test::More;

my $dir = tempdir( CLEANUP => 1 );

plan tests => 4;

{
	my ($stdout, $stderr, @results) = capture { system "$^X build_site.pl"; };
	is $stdout, '';
	chomp $stderr;
	is $stderr, 'Mandatory parameter --destdir was not specified.';
	#is_deeply \@results, [65280] or diag explain \@results;
	# it returned 65280 on perl 5.14 - 5.20
	# it returned 512   on perl 5.10 - 5.12
}

{
	my ($stdout, $stderr, @results) = capture { system "$^X build_site.pl --destdir $dir"; };
	is $stdout, '';
	chomp $stderr;
	is $stderr, 'Mandatory parameter --sourcedir was not specified.';
}

