#!/usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 3;

use Attempt qw(attempt);

subtest 'success' => sub {
    plan tests => 2;

    use autodie qw(open);
    my ($error, $fh) = attempt {
        IO::File->new('/tmp/input', 'w')
            or die $!;
    };
    is($error, undef);
    ok($fh);
};

subtest 'failure' => sub {
    plan tests => 2;
    my ($error, $fh) = attempt {
        IO::File->new('/input', 'w')
            or die $!;
    };
    isnt($error, undef);
    is($fh, undef);
};

subtest 'def' => sub {
    plan tests => 2;
    my ($error, $fh) = attempt {
        def IO::File->new('/input', 'w');
    };
    isnt($error, undef);
    is($fh, undef);
};
