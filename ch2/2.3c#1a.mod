/*  projects */
set projects;

/* years */
set years;

param outlays{years, projects};

/* funds of every year */
param funds{years};

/* return of project */
param returns{projects};

/* proportion of project i */
var p{projects}, >= 0, <= 1;

maximize z: sum{project in projects} p[project] * returns[project];

subject to
fund_limit{year in years } :
 sum{project in projects} outlays[year, project] * p[project] <= funds[year];

data;

param :projects :returns  :=
	1 32.40
	2 35.80
	3 17.75
	4 14.80
	5 18.20
	6 12.35;

param :years :funds :=
1 60.0
2 70.0
3 35.0
4 20.0;

param outlays 
:  1     2    3     4    5     6 :=
1  10.5  8.3  10.2  7.2  12.3  9.2 
2  14.4  12.6 14.2  10.5 10.1  7.8
3  2.2   9.5  5.6   7.5  8.3   6.9
4  2.4   3.1  4.2   5.0  6.3   5.1;


end;