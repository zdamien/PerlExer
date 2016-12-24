sub paths{
    my ($m, $n) = @_;
    if ($n==1 or $m==1) {return 1;}
    else {
        return paths($m-1, $n) + paths($m, $n-1);
    }
}

print paths(1,1), "\n";
print paths(1,2), "\n";
print paths(3,1), "\n";
print paths(2,2), "\n";
print paths(3,2), "\n";
print paths(2,3), "\n";
print paths(3,3), "\n";
print paths(3,4), "\n";
print paths(4,4), "\n";
print paths(5,5), "\n";
