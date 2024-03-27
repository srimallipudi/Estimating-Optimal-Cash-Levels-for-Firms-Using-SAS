*this program creates the cash;
libname tmp1 '\\apporto.com\dfs\SEA\Users\s10_sea\Downloads\SAS_datacodes';
run;
data a1; set tmp1.leverageraw;
gvkey2=gvkey*1;
nyear=year(datadate);
if dltt = "." then dltt=0;
if dlc = "." then dlc=0;
if not missing(che);
if not missing(nyear);
if not missing(gvkey2);
if not missing(at);
if (at-che) = 0 then delete;
keep gvkey2  cusip nyear che at dltt dlc;
proc sort nodupkey; by gvkey2 nyear;
data a2; set a1;
leverage = (dltt+dlc)/(at-che);
if leverage ne ".";
if nyear>=1975;
data a3; set a2;
keep gvkey2 cusip nyear leverage;
proc sort nodupkey; by gvkey2 nyear;
data a4; set a3;
data tmp1.leverage1; set a4;
data tmp1.leverage2; set a4;
data tmp1.leverage3; set a4;
proc means; run;
