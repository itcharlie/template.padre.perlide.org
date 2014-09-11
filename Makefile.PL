use 5.008005;
use strict;

use inc::Module::Install 1.06;

# Configure-time dependencies MUST be done first.
# This version ensures that we have a new MakeMaker that
# WON'T load modules to determine the version.
configure_requires 'ExtUtils::MakeMaker' => '6.52';

name 'Padre-Website';
license 'perl';
author 'Gabor Szabo C<szabgab@cpan.org>';
version 0.01;
requires 'perl' => '5.008005';

# General dependencies
requires 'autodie'                  => 0,
requires 'Capture::Tiny'            => 0,
requires 'Encode'                   => 0,
requires 'File::Copy'               => 0,
requires 'File::Next'               => 0,
requires 'File::Which'              => 0,
requires 'IPC::System::Simple'      => 0,
requires 'Module::Build'            => '0.26',
requires 'Path::Class'              => 0,
requires 'Pod::Xhtml'               => 0,
requires 'Template'                 => 0,
requires 'Text::Unaccent::PurePerl' => 0,
requires 'Time::Piece'              => 0,
requires 'XML::LibXML'              => 0,
requires 'XML::LibXSLT'             => 0,
requires 'YAML::Tiny'               => 0,

test_requires 'Test::More'        => '0.88';

no_index 'directory' => qw{ t xt eg share inc privinc };
homepage 'http://padre.perlide.org/';
bugtracker 'https://github.com/PadreIDE/template.padre.perlide.org/issues';
repository 'https://github.com/PadreIDE/template.padre.perlide.org';

WriteAll;

