set projects;
set quarters;

param borrow_annual_rate;
param surplus_annual_rate;
param cash_flow{quarters, projects};
param dollors_at_start_of_quarter;

/* dollors borrow quarterly */
var b{quarters}, >= 0, <= 1;
/* participate portion */
var p{projects}, >= 0, <= 1;
/* dollors invest in bank */
var s{quarters}, >= 0;

maximize z: 
	s[card(quarters)] - dollors_at_start_of_quarter - b[card(quarters)-1];

subject to
first_bank_invest: s[1] = dollors_at_start_of_quarter + sum{project in projects} p[project] * cash_flow[1, project] + b[1];
bank_invest_recursion{quarter in quarters: quarter > 1}:
	s[quarter] = 
		  s[quarter-1]  * (1 + surplus_annual_rate / 4)
		+ dollors_at_start_of_quarter
		+ b[quarter]
		+ sum{project in projects} p[project] * cash_flow[quarter, project]
		- b[quarter-1] * (1 + borrow_annual_rate / 4);


data;
param borrow_annual_rate := 0.1;
param surplus_annual_rate := 0.08;
set quarters := 1 2 3 4 5;
set projects := 1 2;
param cash_flow
: 1 2 :=
1 -1 -3
2 -3.1 -2.5
3 -1.5 1.5
4 1.8 1.8
5 5.0 2.8;

param dollors_at_start_of_quarter := 1;

end;
