*this program creates the Market to Book;
libname tmp1 '\\apporto.com\dfs\SEA\Users\s10_sea\Downloads\SAS_datacodes';
run;
data a1; set tmp1.market2bookraw;
gvkey2=gvkey*1;
nyear=year(datadate);
if not missing(csho);
if not missing(prcc_f);
if not missing(nyear);
if not missing(gvkey2);
if not missing(at);
keep gvkey2 cusip nyear csho prcc_f at ;
proc sort nodupkey; by gvkey2 nyear;

data a2; set a1;
if at ne 0 then mtb=(csho*prcc_f)/(at);
else mtb = .;
if mtb ne ".";
if nyear>=1975;

data a3; set a2;
keep gvkey2 cusip nyear mtb;
proc sort nodupkey; by gvkey2 nyear;

data a4; set a3;
data tmp1.markettobook1; set a4;
data tmp1.markettobook2; set a4;
data tmp1.markettobook3; set a4;
proc means; run;
