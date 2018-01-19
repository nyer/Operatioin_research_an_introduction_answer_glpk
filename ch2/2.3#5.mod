set month;

param production_cost{month};
param demand{month}; 

param storage_cost;
/* product count at every month */
var x{month}, >= 0;

/* inventory at end of month */
var y{0..card(month)}, >= 0;

minimize z: sum{m in month} (production_cost[m] * x[m] + y[m] * storage_cost);
subject to
xx: y[0] = 0;
inventory{m in month}: x[m] + y[m-1] = demand[m] + y[m];
final_month_inventory_empty: y[card(month)] = 0;

data;

set month := 1 2 3 4 5 6;

param production_cost := 
1 50
2 45
3 55
4 48
5 52
6 50;

param demand := 
1 100
2 250
3 190
4 140
5 220
6 110;

param storage_cost := 8;

end;
