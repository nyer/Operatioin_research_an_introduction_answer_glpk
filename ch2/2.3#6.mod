set month;

param demand{month}; 
param storage_cost;
param hiring_cost;
param firing_cost;
param steady_worker;
param steady_worker_product;
param temp_worker_product;


/* product count at every month */
var x{month}, >= 0;

/* inventory at end of month */
var y{0..card(month)}, >= 0;

/* temporary worker count */
var z{0..card(month)}, >= 0;
/* firing count */
var f{month}, >= 0;
/* hiring count */
var h{month}, >= 0;

minimize cost: sum{m in month} (hiring_cost * h[m]  + firing_cost * f[m] + y[m] * storage_cost);
subject to
init_inventory: y[0] = 0;
init_temporary_worker: z[0] = 0;
inventory{m in month}: x[m] + y[m-1] = demand[m] + y[m];
final_month_inventory_empty: y[card(month)] = 0;
temporary_worker_limit{m in month}: z[m] = z[m-1] + h[m] - f[m];
product_count_limit{m in month}: z[m] * temp_worker_product + steady_worker * steady_worker_product = x[m];

solve;
display cost;

data;

set month := 1 2 3 4;

param steady_worker := 10;
param steady_worker_product := 12;
param temp_worker_product := 10;

param hiring_cost := 200;
param firing_cost := 400;

param demand := 
1 520
2 720
3 520
4 620;

param storage_cost := 50;

end;
