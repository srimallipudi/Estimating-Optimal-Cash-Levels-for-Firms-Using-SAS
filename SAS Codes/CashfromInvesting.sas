*this program creates the cash from investing;
libname tmp1 '\\apporto.com\dfs\SEA\Users\s10_sea\Downloads\SAS_datacodes';
run;
data a1; set tmp1.netcashflow;
gvkey2=gvkey*1;
nyear=year(datadate);
if not missing(ivncf);
if not missing(che);
if not missing(nyear);
if not missing(gvkey2);
if not missing(at);
if (at-che) = 0 then delete;
keep gvkey2  cusip nyear che at ivncf;
proc sort nodupkey; by gvkey2 nyear;
data a2; set a1;
ivncf2 = ivncf/(at-che);
if ivncf2 ne ".";
if nyear>=1975;
data a3; set a2;
keep gvkey2 cusip nyear ivncf2;
proc sort nodupkey; by gvkey2 nyear;
data a4; set a3;
data tmp1.cashfrominvesting1; set a4;
data tmp1.cashfrominvesting2; set a4;
data tmp1.cashfrominvesting3; set a4;
proc means; run;
