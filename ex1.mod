set City;
param latitude{City};
param longitude{City};
param population{City};


param R := 6371.009;
param pi := 3.14159265359;
param dc_num := 1;

param deliveries{c in City} := ceil(population[c] * 3 / 1000);

param dist{c1 in City, c2 in City} :=
    2 * pi * R * (abs(latitude[c1] - latitude[c2])
    + abs(longitude[c1] - longitude[c2])) / 360;


param cost{c1 in City, c2 in City} := dist[c1,c2] * deliveries[c1];

var dc{City}, binary;
var deliver{City, City}, binary;


minimize Total_Cost:
    sum {c in City} dc[c] * 25000
    + sum {c1 in City, c2 in City} deliver[c1,c2] * cost[c1,c2];


subject to
total_dcs: sum{c2 in City} dc[c2] <= dc_num; 
deliver_to {c1 in City}: sum{c2 in City} deliver[c1,c2] = 1;
active {c2 in City, c1 in City}: deliver[c1,c2] <= dc[c2]; 


solve;

printf "\n\n*****************************************\n";
printf {c in City: dc[c] = 1}: "Town with MINIMUM cost: %s\n", c;
printf "*****************************************\n";
#printf {c1 in City: total_cost[c1] = max {c2 in City} total_cost[c2]}: "Town with MAXIMUM cost: %s\n", c1;
#printf "*****************************************\n\n";


#printf {x in City, y in City} "cost[%s,%s] = %d\n", x, y, cost[x,y];

end;


