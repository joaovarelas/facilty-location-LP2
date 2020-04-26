#!/bin/sh

budget="125000"
solvedata="solve.dat"
populationdata="population_reduced.dat"

echo "data;" > $solvedata
echo "param afford_limit := $budget;" >> $solvedata
while read line; do echo $line >> $solvedata; done < $populationdata

glpsol --math problem.mod --data $solvedata -o problem2.sol
