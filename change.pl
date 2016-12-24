sub pennies{  return 1; }

sub nickels {
    my $N = shift;
    if ($N >= 5) {
        return nickels($N-5) + pennies($N);
    }
    else { return pennies ($N); }
}

sub dimes {
    my $N = shift;
    if ($N >= 10) {
        return  dimes($N-10) + nickels($N);
    }
    else { return nickels ($N); }
}

sub quarters {
    my $N = shift;
    if ($N >= 25) {
        return  quarters($N-25) + dimes($N);
    }
    else { return dimes ($N); }
}

print nickels(4), "\n";
print nickels(5), "\n";
print nickels(10), "\n";
print nickels(15), "\n";
print nickels(20), "\n";
print nickels(25), "\n";
print nickels(30), "\n";

print "\n";
print quarters(4), "\n";
print quarters(5), "\n";
print quarters(10), "\n";
print quarters(15), "\n";
print quarters(20), "\n";
print quarters(25), "\n";
print quarters(30), "\n";
