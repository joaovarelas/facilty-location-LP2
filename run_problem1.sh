#!/bin/sh

budget="25000"
solvedata="solve.dat"
populationdata="population.dat"

echo "data;" > $solvedata
echo "param afford_limit := $budget;" >> $solvedata
while read line; do echo $line >> $solvedata; done < $populationdata

glpsol --math problem.mod --data $solvedata -o problem1.sol
