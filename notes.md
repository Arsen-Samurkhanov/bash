test $USER = root   "test if current user is root"
echo $?             " if output is 0 then above expression is true, if 1 the expression is false
 
 
test $USER != root  "not equal"

[ $USER = root ]  same as $USER = root

[ $USER != root ]  same as "test $USER != root"  or  "test  ! $USER = root"   or  [ ! $USER = root ]

test -n $SSH_TTY     check existence of a variable ( if var has a value) if ss connection estableshed it has a value
[ -n $SSH_TTY ]

test -z $1  tetin for zero value
[ -z $1 ]