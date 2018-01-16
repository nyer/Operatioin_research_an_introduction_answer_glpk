set projects;
set years;

param cash_flow{years, projects};
param interest_rate;
param init_fund;

var p{projects}, >= 0;
/* bank invest amount */
var s{years}, >= 0;
/* fund amount at end of year */
var fund{0..card(years)}, >= 0;

maximize z: fund[card(years)-1] + sum{project in projects} p[project] * cash_flow[card(years), project];

subject to
init_fund_limit: fund[0] = init_fund;
fund_limit{year in years} : fund[year] = (sum{project in projects} p[project] * cash_flow[year, project] + fund[year-1]) * (1 + interest_rate);
fund_limit2{year in years}: sum{project in projects} p[project] * cash_flow[year, project] +  fund[year-1] = s[year];


solve;
printf '%.2f at start of year 5', z;

data;
param interest_rate := 0.065;
param init_fund := 10000;
set years := 1 2 3 4 5;
set projects := 1 2 3 4;
param cash_flow
: 1  2 3 4 :=
1 -1 -1 0 -1
2 0.5 0.6 -1 0.4
3 0.3 0.2 0.8 0.6
4 1.8 1.5 1.9 1.8
5 1.2 1.3 0.8 0.95;



end;
