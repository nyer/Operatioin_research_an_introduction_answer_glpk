var x1 , >= 0; # number of efficiency
var x2 , >= 0; # number of duplex
var x3 , >= 0; # number of single 

maximize z: 600 * x1 + 750 * x2 + 1200 * x3 + (10 * x1 + 15 * x2 + 18 * x3) * 100;
subject to 
max_efficiency: x1 <= 500;
max_duplex: x2 <= 300;
duplex_at_least: x2 >= 0.5 * (x1 + x3);
max_single: x3 <= 250;
max_retail_space: 10 * x1 + 15 * x2 + 18 * x3 <= 10000;

end;
