set City;
param latitude{City};
param longitude{City};
param population{City};

param R := 6371.009;
param pi := 3.14159265359;
param yearly_cost := 25000;

param afford_limit;
param max_dc := afford_limit / yearly_cost;

param deliveries{c in City} := ceil(population[c] * 3 / 1000);

param dist{src in City, dst in City} :=
    2 * pi * R *
    ( abs(latitude[dst] - latitude[src])
    + abs(longitude[dst] - longitude[src]) ) / 360;


var dc{City}, binary;
var deliver{City, City}, binary;

param cost{src in City, dst in City} := dist[src,dst] * deliveries[dst];


minimize Total_Cost:
    sum {c in City} dc[c] * yearly_cost
    + sum {src in City, dst in City} deliver[src,dst] * cost[src,dst];

subject to
total_dcs: sum{c in City} dc[c] <= max_dc; 
deliver_to {dst in City}: sum{src in City} deliver[src,dst] = 1;
active_dc {src in City, dst in City}: deliver[src,dst] <= dc[src]; 

solve;

printf "\n\n*********************************************************************\n";
printf {src in City: dc[src] = 1}:
    "Town with MINIMUM cost (DC): %s (%d€)\n", src,
    sum {dst in City} cost[src,dst] * deliver[src,dst];
printf "*********************************************************************\n";
printf {src in City, dst in City:
    dc[src] = 1 and
    cost[src,dst] = max {_dst in City} cost[src,_dst]}:
        "Town with LARGEST DELIVERY cost: %s (%d€) [from %s]\n", dst, cost[src,dst], src;
printf "*********************************************************************\n\n";

end;

