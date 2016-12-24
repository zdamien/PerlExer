use strict;

sub midpoint {
    my ($f, $start, $end, $cols) = @_;
    my $step = ($end-$start)/$cols;
    my $half = $step/2;
    my $x = $start+$half;
    my $sum=0;
    for my $c (0..$cols-1) {
        $sum += &$f($x)*$step;
        $x+=$step;
    }
    return $sum;
}

sub trapezoidal {
    my ($f, $start, $end, $cols) = @_;
    my $step = ($end-$start)/$cols;
    my $x = $start;
    my $sum=0;
    for my $c (1..$cols-1) {
        $x+=$step;
        $sum += &$f($x)*$step;
    }
    $sum += (&$f($start)+&$f($end))*$step/2;
    return $sum;
}
sub ff {
    my $x = shift;
    return 1/$x;
    #return $x*$x;
}

my ($start, $end, $cols) = (1, 5, 1000);
#my ($start, $end, $cols) = (0, 10, 1000);

my $msum = midpoint(\&ff, $start, $end, $cols);
my $tsum = trapezoidal(\&ff, $start, $end, $cols);
my $base = log(5);

print $msum-$base,"\n";
print $tsum-$base,"\n";
my $mix = (2*$msum+$tsum)/3;
print $mix-$base,"\n";
