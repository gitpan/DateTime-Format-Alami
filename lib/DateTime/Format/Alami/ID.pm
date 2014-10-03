package DateTime::Format::Alami::ID;

our $DATE = '2014-10-03'; # DATE
our $VERSION = '0.05'; # VERSION

use 5.010001;
use strict;
use warnings;
use parent qw(DateTime::Format::Alami);

our $RE = "(?P<p_date_wo_year>(?P<o_dayint>(?:[12][0-9]|3[01]|0?[1-9])) ?(?P<o_monthname>(?:januari|jan|februari|pebruari|feb|peb|maret|mar|april|apr|mei|juni|jun|juli|jul|agustus|agu|agt|september|sept|sep|oktober|okt|november|nopember|nov|nop|desember|des))|(?P<o_dayint>(?:[12][0-9]|3[01]|0?[1-9]))[ /-](?P<o_monthint>(?:0?[1-9]|1[012]))\\b)|(?P<p_dur_later>(?P<o_dur>(?:((?:[+-]?(?:\\d{1,2}(?:[.]\\d{3})*(?:[,]\\d*)?|\\d{1,2}(?:[,]\\d{3})*(?:[.]\\d*)?|[,.]\\d+|\\d+)(?:[Ee][+-]?\\d+)?) ?(?:tahun|thn|th|bulan|bul|bln|bl|minggu|mgg|mg|hari|hr|h|jam|j|menit|mnt|detik|det|dtk|dt) ?)+)) (?:(?:(?:yang|yg) )?akan (?:datang|dtg)|yad|lagi|lg))|(?P<p_dur_ago>(?P<o_dur>(?:((?:[+-]?(?:\\d{1,2}(?:[.]\\d{3})*(?:[,]\\d*)?|\\d{1,2}(?:[,]\\d{3})*(?:[.]\\d*)?|[,.]\\d+|\\d+)(?:[Ee][+-]?\\d+)?) ?(?:tahun|thn|th|bulan|bul|bln|bl|minggu|mgg|mg|hari|hr|h|jam|j|menit|mnt|detik|det|dtk|dt) ?)+)) (?:(?:(?:yang|yg) )?lalu|tadi|td|yll?))|(?P<p_now>(?:saat ini|sekarang|skrg?))|(?P<p_yesterday>(?:kemar[ei]n|kmrn))|(?P<p_tomorrow>(?:b?esok|bsk))|(?P<p_today>(?:hari ini))";   # PRECOMPUTE
our $MAPS = {months=>{agt=>8,agu=>8,agustus=>8,apr=>4,april=>4,des=>12,desember=>12,feb=>2,februari=>2,jan=>1,januari=>1,jul=>7,juli=>7,jun=>6,juni=>6,mar=>3,maret=>3,mei=>5,nop=>11,nopember=>11,nov=>11,november=>11,okt=>10,oktober=>10,peb=>2,pebruari=>2,sep=>9,sept=>9,september=>9}}; # PRECOMPUTE

# XXX relative day reference -> yesterday | today | tomorrow (-1, 0, 1)
# XXX holidays -> christmas | new year | ...

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

sub w_jan       { ["januari", "jan"] }
sub w_feb       { ["februari", "pebruari", "feb", "peb"] }
sub w_mar       { ["maret", "mar"] }
sub w_apr       { ["april", "apr"] }
sub w_may       { ["mei"] }
sub w_jun       { ["juni", "jun"] }
sub w_jul       { ["juli", "jul"] }
sub w_aug       { ["agustus", "agu", "agt"] }
sub w_sep       { ["september", "sept", "sep"] }
sub w_oct       { ["oktober", "okt"] }
sub w_nov       { ["november", "nopember", "nov", "nop"] }
sub w_dec       { ["desember", "des"] }

sub p_now          { "(?:saat ini|sekarang|skrg?)" }
sub p_today        { "(?:hari ini)" }
sub p_tomorrow     { "(?:b?esok|bsk)" }
sub p_yesterday    { "(?:kemar[ei]n|kmrn)" }
sub p_date_wo_year { "<o_dayint> ?<o_monthname>|<o_dayint>[ /-]<o_monthint>\\b" }
sub p_dur_ago      { "<o_dur> (?:(?:(?:yang|yg) )?lalu|tadi|td|yll?)" }
sub p_dur_later    { "<o_dur> (?:(?:(?:yang|yg) )?akan (?:datang|dtg)|yad|lagi|lg)" }

1;
# ABSTRACT: Parse human date/time expression (Indonesian)

__END__

=pod

=encoding UTF-8

=head1 NAME

DateTime::Format::Alami::ID - Parse human date/time expression (Indonesian)

=head1 VERSION

This document describes version 0.05 of DateTime::Format::Alami::ID (from Perl distribution DateTime-Format-Alami), released on 2014-10-03.

=head1 DESCRIPTION

List of known date/time expressions:

 sekarang|saat ini
 hari ini
 besok
 kemarin
 1 tahun 2 bulan 3 minggu 4 hari 5 jam 6 menit 7 detik (lalu|nanti|yang akan datang)
 28 mei, 28/5

List of recognized duration expressions:

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
