*this program creates the merge;
libname tmp1 '\\apporto.com\dfs\SEA\Users\s10_sea\Downloads\SAS_datacodes';
run;
data a1; set tmp1.nwcall1;
proc sort nodupkey; by gvkey2 nyear;
data a2; set tmp1.size1;
proc sort nodupkey; by gvkey2 nyear;
data a3; set tmp1.cashall1;
proc sort nodupkey; by gvkey2 nyear;
data a4; set tmp1.capxall1;
proc sort nodupkey; by gvkey2 nyear;
data a5; set tmp1.rdall1;
proc sort nodupkey; by gvkey2 nyear;
data a6; set tmp1.dvcall1;
proc sort nodupkey; by gvkey2 nyear;
data a7; set tmp1.sgall1;
proc sort nodupkey; by gvkey2 nyear;
data a8; set tmp1.tfiall1;
proc sort nodupkey; by gvkey2 nyear;
data a9; set tmp1.firmageall1;
proc sort nodupkey; by gvkey2 nyear;
data a10; set tmp1.cfoall1;
proc sort nodupkey; by gvkey2 nyear;
data a11; set tmp1.indsigmaall1;
proc sort nodupkey; by gvkey2 nyear;
data a12; set tmp1.managerial_ability;
proc sort nodupkey; by gvkey2 nyear;
data a13; set tmp1.sampledata1;
proc sort nodupkey; by gvkey2 nyear;
data a14; set tmp1.yeardummiesall1;
proc sort nodupkey; by gvkey2 nyear;
data a15; set tmp1.industrydummiesall1;
proc sort nodupkey; by gvkey2 nyear;
data a16;
merge a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 a11 a12 a13 a14 a15;
by gvkey2 nyear;
data a17; set a16;
proc sort; by nyear;
proc means noprint data=a17 p1 p99;
var nwc che2 size capx2 xrd2 growth tfi age cfo sigmacash dma;
by nyear;
output out=winbreak1 p1=nwcp1 che2p1 sizep1 capx2p1 xrd2p1 growthp1 tfip1 agep1 cfop1 sigmacashp1 dmap1
p99=nwcp99 che2p99 sizep99 capx2p99 xrd2p99 growthp99 tfip99 agep99 cfop99 sigmacashp99 dmap99;
run;
data a18; set winbreak1;
proc sort; by nyear;
data a19;
merge a17 a18;
by nyear;
data a20; set a19;
if not missing(nwc);
if not missing(che2);
if not missing(size);
if not missing(capx2);
if not missing(xrd2);
if not missing(growth);
if not missing(tfi);
if not missing(age);
if not missing(cfo);
if not missing(sigmacash);
if not missing(dvc_dummy);
if not missing(dma);
if not missing(seq);
if not missing(prcc_c);
if not missing(at);
if not missing(sale);
if not missing(sic2);
*if (sic2 >= 40 and sic2 < 49) then delete;
*if (sic2 >= 60 and sic2 < 67) then delete;

data a21; set a20;
if nwc<nwcp1 and not missing(nwc) then nwc=nwcp1;
if nwc>nwcp99 and not missing(nwc) then nwc=nwcp99;
if che2<che2p1 and not missing(che2) then che2=che2p1;
if che2>che2p99 and not missing(che2) then che2=che2p99;
if size<sizep1 and not missing(size) then size=sizep1;
if size>sizep99 and not missing(size) then size=sizep99;
if capx2<capx2p1 and not missing(capx2) then capx2=capx2p1;
if capx2>capx2p99 and not missing(capx2)then capx2=capx2p99;
if xrd2<xrd2p1 and not missing(xrd2) then xrd2=xrd2p1;
if xrd2>xrd2p99 and not missing(xrd2) then xrd2=xrd2p99;
if growth<growthp1 and not missing(growth) then growth=growthp1;
if growth>growthp99 and not missing(growth) then growth=growthp99;
if tfi<tfip1 and not missing(tfi) then tfi=tfip1;
if tfi>tfip99 and not missing(tfi) then tfi=tfip99;
if age<agep1 and not missing(age) then age=agep1;
if age>agep99 and not missing(age) then age=agep99;
if cfo<cfop1 and not missing(cfo) then cfo=cfop1;
if cfo>cfop99 and not missing(cfo) then cfo=cfop99;
if sigmacash<sigmacashp1 and not missing(sigmacash) then sigmacash=sigmacashp1;
if sigmacash>sigmacashp99 and not missing(sigmacash) then sigmacash=sigmacashp99;
if dma<dmap1 and not missing(dma) then dma=dmap1;
if dma>dmap99 and not missing(dma) then dma=dmap99;
drop _type_ _freq_ che2p1 che2p99 nwcp1 nwcp99 sizep1 sizep99 capx2p1 capx2p99 xrd2p1 xrd2p99 growthp1 growthp99 tfip1 tfip99 agep1 agep99 cfop1 cfop99 sigmacashp1 sigmacashp99 dmap1 dmap99;
data a22; set a21;
data tmp1.mergedata_model1; set a22;
proc print data=a22 (obs=500); run;
proc means; run;
