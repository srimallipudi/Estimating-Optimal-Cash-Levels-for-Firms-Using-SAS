*this program creates the Sales Growth;
libname tmp1 '\\apporto.com\dfs\SEA\Users\s10_sea\Downloads\SAS_datacodes';
run;
data a1; set tmp1.sgraw;
gvkey2=gvkey*1;
nyear=year(datadate);
if not missing(sale);
if not missing(nyear);
if not missing(gvkey2);
keep gvkey2 cusip nyear sale ;
proc sort nodupkey; by gvkey2 nyear;

data a2; set a1; by gvkey2;
first_gvkey = first.gvkey2;	
sale_py = lag(sale);
if first_gvkey=0 then prior_sale = sale_py;
if first_gvkey=1 then prior_sale = 0;

data a3; set a2;
if prior_sale ne 0;
growth = (sale - prior_sale)/prior_sale;

data a4; set a3;
if growth ne ".";
if nyear>=1975;
keep gvkey2 cusip nyear growth;
proc sort nodupkey; by gvkey2 nyear;
data a5; set a4;
data tmp1.sgall1; set a5;
data tmp1.sgall2; set a5;
data tmp1.sgall3; set a5;
data tmp1.sgall4; set a5;
data tmp1.sgall5; set a5;
data tmp1.sgall6; set a5;
data tmp1.sgall7; set a5;
data tmp1.sgall8; set a5;
data tmp1.sgall9; set a5;
data tmp1.sgall10; set a5;
proc means; run;
proc print data=a5 (obs=200); run;

