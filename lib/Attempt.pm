package Attempt;

use 5.008001;
use strict;
use warnings;

use Carp qw(croak);
use Exporter qw(import);

our @EXPORT_OK = qw(attempt def);
our $VERSION = "0.01";

sub attempt(&) {
    my $code = shift;
    my @results;
    my $error = do {
        local $@;
        @results = eval { $code->() };
        $@;
    };
    if ($error eq '') {
        undef $error;
    }
    return ($error, @results);
}

sub def {
    my @results = @_;
    unless (@_) {
        croak 'expected a defined result';
    }
    return @results;
}

1;
__END__

=encoding utf-8

=head1 NAME

Attempt - It's new $module

=head1 SYNOPSIS

    use Attempt;

=head1 DESCRIPTION

Attempt is ...

=head1 LICENSE

Copyright (C) Nathaniel Nutter.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Nathaniel Nutter E<lt>iam@nnutter.comE<gt>

=cut

