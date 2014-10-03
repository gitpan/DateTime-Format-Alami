package DateTime::Format::Alami::EN;

our $DATE = '2014-10-03'; # DATE
our $VERSION = '0.02'; # VERSION

use 5.010001;
use strict;
use warnings;
use parent qw(DateTime::Format::Alami);

our $RE = "(?P<p_date_wo_year>(?P<o_dayint>(?:[12][0-9]|3[01]|0?[1-9])) ?(?P<o_monthname>(?:january|jan|february|feb|march|mar|april|apr|may|june|jun|july|jul|august|aug|september|sept|sep|october|oct|november|nov|december|dec))|(?P<o_monthname>(?:january|jan|february|feb|march|mar|april|apr|may|june|jun|july|jul|august|aug|september|sept|sep|october|oct|november|nov|december|dec)) ?(?P<o_dayint>(?:[12][0-9]|3[01]|0?[1-9]))\\b|(?P<o_monthint>(?:0?[1-9]|1[012]))[ /-](?P<o_dayint>(?:[12][0-9]|3[01]|0?[1-9]))\\b)|(?P<p_dur_later>(?P<o_dur>(?:((?^x:(?:\n                  [+-]?\n                  (?:\n                      (?:\\d{1,3}(?:[,]\\d{3})+ | \\d+) (?:[.]\\d*)? | # english\n                      [.]\\d+\n                  )\n                  (?:[Ee][+-]?\\d+)?\n              )) ?(?:year|years|y|month|months|mon|week|weeks|wk|wks|day|days|d|hour|hours|h|minute|minutes|min|mins|second|seconds|sec|secs|s) ?)+)) (?:later))|(?P<p_dur_ago>(?P<o_dur>(?:((?^x:(?:\n                  [+-]?\n                  (?:\n                      (?:\\d{1,3}(?:[,]\\d{3})+ | \\d+) (?:[.]\\d*)? | # english\n                      [.]\\d+\n                  )\n                  (?:[Ee][+-]?\\d+)?\n              )) ?(?:year|years|y|month|months|mon|week|weeks|wk|wks|day|days|d|hour|hours|h|minute|minutes|min|mins|second|seconds|sec|secs|s) ?)+)) (?:ago))|(?P<p_now>(?:(?:(?:right|just) )?now|immediately))|(?P<p_yesterday>(?:yesterday|yest))|(?P<p_tomorrow>(?:tomorrow|tom))|(?P<p_today>(?:today|this day))";   # PRECOMPUTE
our $MAPS; # PRECOMPUTE

use Parse::Number::EN qw(parse_number_en);

sub o_num       { $Parse::Number::EN::Pat }
sub _parse_num  { parse_number_en(text => $_[1]) }
sub w_year      { ["year", "years", "y"] }
sub w_month     { ["month", "months", "mon"] }
sub w_week      { ["week", "weeks", "wk", "wks"] }
sub w_day       { ["day", "days", "d"] }
sub w_hour      { ["hour", "hours", "h"] }
sub w_minute    { ["minute", "minutes", "min", "mins"] }
sub w_second    { ["second", "seconds", "sec", "secs", "s"] }

sub w_jan       { ["january", "jan"] }
sub w_feb       { ["february", "feb"] }
sub w_mar       { ["march", "mar"] }
sub w_apr       { ["april", "apr"] }
sub w_may       { ["may"] }
sub w_jun       { ["june", "jun"] }
sub w_jul       { ["july", "jul"] }
sub w_aug       { ["august", "aug"] }
sub w_sep       { ["september", "sept", "sep"] }
sub w_oct       { ["october", "oct"] }
sub w_nov       { ["november", "nov"] }
sub w_dec       { ["december", "dec"] }

sub p_now          { "(?:(?:(?:right|just) )?now|immediately)" }
sub p_today        { "(?:today|this day)" }
sub p_tomorrow     { "(?:tomorrow|tom)" }
sub p_yesterday    { "(?:yesterday|yest)" }
# XXX support cardinal
sub p_date_wo_year { "<o_dayint> ?<o_monthname>|<o_monthname> ?<o_dayint>\\b|<o_monthint>[ /-]<o_dayint>\\b" }
sub p_dur_ago      { "<o_dur> (?:ago)" }
sub p_dur_later    { "<o_dur> (?:later)" }

1;
# ABSTRACT: Parse human date/time expression (English)

__END__

=pod

=encoding UTF-8

=head1 NAME

DateTime::Format::Alami::EN - Parse human date/time expression (English)

=head1 VERSION

This document describes version 0.02 of DateTime::Format::Alami::EN (from Perl distribution DateTime-Format-Alami), released on 2014-10-03.

=head1 DESCRIPTION

List of known date/time expressions:

 (just|right)? now
 today|this day
 tommorow
 yesterday
 1 year 2 months 3 weeks 4 days 5 hours 6 minutes 7 seconds (ago|later)
 may 28, 5/28

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
