use strict;
use warnings;
use Text::Trac;
use Path::Tiny qw(path);

my ($infile, $title) = @ARGV;

die "Usage: $0 INFILE TITLE\n" if not $title;

my $text = path($infile)->slurp_utf8;

my $tt = Text::Trac->new;
$tt->parse($text);
my $html = $tt->html;


my $out_content = substitute(
        CONTENT => $html,
        TITLE   => $title,
        DESCRIPTION => $title,
);

my $outpath = lc $title . '.html';
path($outpath)->spew_utf8($out_content);
exit;


sub substitute {
        my (%data) = @_;

        my $tmpl = template();
        foreach my $k (keys %data) {
                $tmpl =~ s/$k/$data{$k}/;
        }
        return $tmpl;
}

# a very simple templating system to create templates... 

sub template {
return <<'END_TEMPLATE';
[% DEFAULT
   title="TITLE"
   description="DESCRIPTION"
%]
[% WRAPPER lib/xhtml_doc

%]

[% WRAPPER chrome/styled_panel %]
CONTENT
[% END %]
[% END %]
END_TEMPLATE
}



