use Test::More;

BEGIN
{
    $ENV{CLONE_CHOOSE_PREFERRED_BACKEND} and eval "use $ENV{CLONE_CHOOSE_PREFERRED_BACKEND}; 1;";
    $@ and plan skip_all => "No $ENV{CLONE_CHOOSE_PREFERRED_BACKEND} found.";
}

use Clone::Choose;

my %src = (
    simple => "yeah",
    ary    => [qw(foo bar)],
    hash   => {foo => "bar"}
);

my $tgt = clone(\%src);
is_deeply(\%src, $tgt);

done_testing;
