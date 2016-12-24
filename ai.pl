# simple AI program from my AP Pascal days. User enters h or t (heads or
# tails), program guesses what user will enter, based on a array keyed
# by the last four moves.  Surprisingly effective.

use strict;
use Term::ReadKey;

sub getmove {
    loop:
    print("Enter move (h or t): ");
    my $move;
    while (not defined ($move = ReadKey -1)){}
    #chomp $move;
    if ($move eq 'h') {
        return 1;
    }
    elsif ($move eq 't') {
        return 0;
    }
    else {goto loop;}
}

sub printmoves {
    my @moves = @_;
    for my $i (0.. $#moves) {
        print "$moves[$i] ";
    }
    print "\n";
}

sub main {
    my $score = 0;
    my @moves = [];
    my $i;
    for $i (0..15) {$moves[$i]=0};
    my $lastfour = 0;

    ReadMode 3;
    print "You enter h or t, and I try to guess what you'll pick, getting a point if I'm right, losing if I'm wrong. Game ends at +/- 25.\n";

    for $i (0..3) {
        my $guess = rand() > 0.5;
        my $move = getmove();
        if ($move == $guess) {
            $score++;
        } else {$score--;}
        $moves[$lastfour] += ($move ? 1 : -1);
        $lastfour = (($lastfour << 1) + $move) % 16;
        print ("I guessed $guess. Score is $score.\n");
        printmoves(@moves);
    }
    while (abs($score)<25) {
        my $guess = $moves[$lastfour] > 0;
        my $move = getmove();
        if ($move == $guess) {
            $score++;
        } else {$score--;}
        $moves[$lastfour] += ($move ? 1 : -1);
        $lastfour = (($lastfour << 1) + $move) % 16;
        print ("I guessed $guess. Score is $score.\n");
        print "$lastfour: ";
        printmoves(@moves);
    }
    
    if ($score == 25) {
        print "I win!\n";
    } else {
        print "Darn, you win.\n";
    }

    ReadMode 0;
}

main()
