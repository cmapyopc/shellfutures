#!/bin/dash

# shell futures

# adjust paths and notifiers to your needs 

o=`mktemp`  # stdout
e=`mktemp`  # stderr

# load your env so that you can pass aliases, too
. ~/.shell_independent
. ~/.shell_aliases

# execute 
eval "$@ >$o 2>$e"

# prepare output:
# if neither output nor errors, say OK
[ -s $o ] || [ -s $e ] || echo OK >$o 
# if errors, append errors to output
[ -s $e ] && (echo --- >>$o; cat $e >> $o)

# adjust delay to the length of the command;
# (if you are more on the simplicity trip, just throw this away and put
# a constant delay in the notify command)
h=50
l=`wc -l <$o`
[ $l -gt $h ] && t=11 || t=$(( $l / 5 + 3))
echo l: $l, t: $t
t=$((t*1000))

notify-send -t $t -u low "`sed '$h q' $o`" 

rm $o $e
