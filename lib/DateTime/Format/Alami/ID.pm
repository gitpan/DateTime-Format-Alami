package DateTime::Format::Alami::ID;

our $DATE = '2014-10-02'; # DATE
our $VERSION = '0.01'; # VERSION

use 5.010001;
use strict;
use warnings;
use parent qw(DateTime::Format::Alami);

our $RE; # PRECOMPUTE

# XXX *se*minggu (instead of 1 minggu), etc

use Parse::Number::ID qw(parse_number_id);

sub o_num       { $Parse::Number::ID::Pat }
sub _parse_num  { parse_number_id(text => $_[1]) }
sub w_year      { ["tahun", "thn", "th"] }
sub w_month     { ["bulan", "bul", "bln", "bl"] }
sub w_week      { ["minggu", "mgg", "mg"] }
sub w_day       { ["hari", "hr", "h"] }
sub w_hour      { ["jam", "j"] }
sub w_minute    { ["menit", "mnt"] }
sub w_second    { ["detik", "det", "dtk", "dt"] }

sub p_now       { "(?:saat ini|sekarang|skrg?)" }
sub p_today     { "(?:hari ini)" }
sub p_tomorrow  { "(?:b?esok|bsk)" }
sub p_yesterday { "(?:kemar[ei]n|kmrn)" }
sub p_dur_ago   { "<o_dur> (?:(?:(?:yang|yg) )?lalu|tadi|td|yll?)" }
sub p_dur_later { "<o_dur> (?:(?:(?:yang|yg) )?akan (?:datang|dtg)|yad|lagi|lg)" }

1;
# ABSTRACT: Parse human date/time expression (Indonesian)

__END__

=pod

=encoding UTF-8

=head1 NAME

DateTime::Format::Alami::ID - Parse human date/time expression (Indonesian)

=head1 VERSION

This document describes version 0.01 of DateTime::Format::Alami::ID (from Perl distribution DateTime-Format-Alami), released on 2014-10-02.

=for Pod::Coverage ^([aopw]_.+)$

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/DateTime-Format-Alami>.

=head1 SOURCE

Source repository is at L<https://github.com/perlancar/perl-DateTime-Format-Alami>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=DateTime-Format-Alami>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

perlancar <perlancar@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by perlancar@cpan.org.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
