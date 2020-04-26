#!/bin/sh
solvedata="solve.dat"
populationdata="population.dat"

fail() {
    printf "Inexistent. Run this as:\\n  %s (1|2)...\\n Where the argument specifies the exercise to solve\\n" "$0";
    exit 1;
}

[ $# -ne 0 ] || fail

while [ $# -ne 0 ]
do
    echo "Question $1"
    case $1 in
        [1])
            budget="25000"
            ;;
        2)
            budget="125000"
            ;;
        *) fail
    esac

    echo "data;" > $solvedata
    echo "param afford_limit := $budget;" >> $solvedata
    while read -r line; do echo "$line" >> $solvedata; done < $populationdata
    glpsol --math problem.mod --data $solvedata -o problem1.sol
    rm -rf $solvedata
    shift
done

