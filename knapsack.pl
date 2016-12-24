use strict;
my @cache;
my @weights;
my @values;

use List::Util qw[min max];

my $N = 100;

for my $i (1 .. $N) {
    $weights[$i]=$i;
    $values[$i]=1;
}

sub knapsack {
    my ($i, $W) = @_;

    if (!defined $cache[$i][$W] ) {
        $cache[$i][$W] = helpknap($i,$W);
    }
    return $cache[$i][$W];
}


sub helpknap {
    my ($i, $W) = @_;
    return 0 if $i==0;
    if ($weights[$i]>$W) {
        return knapsack($i-1, $W);
    }
    return max(knapsack($i-1, $W), knapsack($i-1,
    $W-$weights[$i])+$values[$i]);
}

my $k = knapsack(50,200);
print "$k\n";
