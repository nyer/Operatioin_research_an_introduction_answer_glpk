set projects;
set years;

param cash_flow{years, projects};
param interest_rate;
param init_amount;

var p{projects}, >= 0;
/* bank invest amount */
var s{years}, >= 0;

maximize z: s[card(years)];

subject to
first_bank_invest_limit: s[1] = init_amount +  sum{project in projects} p[project] * cash_flow[1, project];
bank_invest_limit{year in years : year > 1} : s[year] = sum{project in projects} p[project] * cash_flow[year, project] + s[year-1] * (1 + interest_rate);


solve;
printf '%.2f at start of year 5\n', z;

data;
param interest_rate := 0.065;
param init_amount := 10000;
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
