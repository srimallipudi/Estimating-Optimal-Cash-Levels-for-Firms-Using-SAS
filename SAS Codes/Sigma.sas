*this program creates the Industry Sigma;
libname tmp1 '\\apporto.com\dfs\SEA\Users\s10_sea\Downloads\SAS_datacodes';
run;
data a1; set tmp1.industrysigma;
if oibdp="." then delete;
if xint="." then xint=0;
if txt="." then txt=0;
if dvc="." then dvc=0;
if che="." then delete;
if at="." then delete;
if (at-che)=0 then delete;
nyear=year(datadate);
data a2; set a1;
cashflow=(oibdp - xint - txt - dvc)/(at - che);

data a3; set a2;
if 1964<=nyear<=1983;
data a4; set a3;
drop consol indfmt datafmt popsrc curcd costat nyear;

data a5; set a4;
sic2=int(sic/100);
proc sort data=a5; by sic2;

proc means noprint; var cashflow; by sic2;
output out=cash1984 std=sigmacash; by sic2;
data a6; set cash1984;
drop _type_ _freq_;
data a7; set a6;
nyear=1984;
data tmp1.sigma1984; set a7;
proc means; run;
