*this program creates the size;
libname tmp1 '\\apporto.com\dfs\SEA\Users\s10_sea\Downloads\SAS_datacodes';
run;
data a1; set tmp1.sizeraw;
gvkey2=gvkey*1;
nyear=year(datadate);
if not missing(at);
if not missing(nyear);
if not missing(gvkey2);
keep gvkey2  cusip nyear  at ;
proc sort nodupkey; by gvkey2 nyear;
data a2; set a1;
size=log(at);
if size ne ".";
if nyear>=1975;
data a3; set a2;
keep gvkey2 cusip nyear size;
proc sort nodupkey; by gvkey2 nyear;
data a4; set a3;
data tmp1.size1; set a4;
data tmp1.size2; set a4;
data tmp1.size3; set a4;
data tmp1.size4; set a4;
data tmp1.size5; set a4;
data tmp1.size6; set a4;
data tmp1.size7; set a4;
data tmp1.size8; set a4;
data tmp1.size9; set a4;
data tmp1.size10; set a4;
proc means; run;

