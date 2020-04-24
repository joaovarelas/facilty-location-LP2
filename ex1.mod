set City;
param latitude{City};
param longitude{City};
param population{City};


# constants
param R := 6371.009;   # earth radius km
param pi := 3.14159265359;


param deliveries{c in City} := ceil(population[c] * 3 / 1000); # avg deliveries / city

param dist{c1 in City, c2 in City} :=
    2 * pi * R * (abs(latitude[c1] - latitude[c2]) + abs(longitude[c1] - longitude[c2])) / 360;

param cost{c1 in City, c2 in City} := dist[c1,c2] * deliveries[c2];
param total_cost{c1 in City} := 2500 + sum{c2 in City} cost[c1,c2];



minimize Total_Cost {c in City}: total_cost[c];

printf {c in City}: "total_cost[%s] = %d\n", c, total_cost[c];

end;


