package Devel::TraceINC;

use 5.006;
use strict;
use warnings;


our $VERSION = '0.01';


BEGIN {
    unshift @INC, sub {
        my ($self, $file) = @_;
        my ($package, $filename, $line) = caller;
        warn "$file loaded from package $package, file $filename, line $line\n";
    };
    return;   # undef to indicate that require() should look further
}


1;


__END__

=head1 NAME

Devel::TraceINC - trace who is loading which perl modules

=head1 SYNOPSIS

    $ perl -MDevel::TraceINC t/01_my_test.t
    Test/More.pm loaded from package main, file t/01_my_test.t, line 6
    Test/Builder/Module.pm loaded from package Test::More, file /usr/local/svn/perl/Test/More.pm, line 22
    Test/Builder.pm loaded from package Test::Builder::Module, file /usr/local/svn/perl/Test/Builder/Module.pm, line 3
    Exporter/Heavy.pm loaded from package Exporter, file /System/Library/Perl/5.8.6/Exporter.pm, line 17
    ...

=head1 DESCRIPTION

I had a situation where a program was loading a module but I couldn't find
where in the code it was loaded. It turned out that I loaded some module,
which loaded another module, which loaded the module in question. To be
able to track down who loads what, I wrote Devel::TraceINC.

Just C<use()> the module and it will print a warning every time a module is
searched for in C<@INC>, i.e., loaded.

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<develtraceinc> tag.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-devel-traceinc@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHOR

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2002-2007 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

