use strict;
use warnings;

use File::Temp qw(tempdir);
use Capture::Tiny qw(capture);
use Test::More;

plan tests => 3;

my ($stdout, $stderr, @results) = capture { system "$^X build_site.pl"; };
is $stdout, '';
chomp $stderr;
is $stderr, 'Mandatory parameter --destdir was not specified.';
is_deeply \@results, [65280] or diag explain \@results;

