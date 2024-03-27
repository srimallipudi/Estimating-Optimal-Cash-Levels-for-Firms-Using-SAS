*this program creates the cash from financing;
libname tmp1 '\\apporto.com\dfs\SEA\Users\s10_sea\Downloads\SAS_datacodes';
run;
data a1; set tmp1.netcashflow;
gvkey2=gvkey*1;
nyear=year(datadate);
if not missing(fincf);
if not missing(che);
if not missing(nyear);
if not missing(gvkey2);
if not missing(at);
if (at-che)=0 then delete;
keep gvkey2  cusip nyear che at fincf;
proc sort nodupkey; by gvkey2 nyear;
data a2; set a1;
fincf2 = fincf/(at-che);
if fincf2 ne ".";
if nyear>=1975;
data a3; set a2;
keep gvkey2 cusip nyear fincf2;
proc sort nodupkey; by gvkey2 nyear;
data a4; set a3;
data tmp1.cashfromfinancing1; set a4;
data tmp1.cashfromfinancing2; set a4;
data tmp1.cashfromfinancing3; set a4;
proc means; run;
