*this program creates the merged file for components;
libname tmp1 '\\apporto.com\dfs\SEA\Users\s10_sea\Downloads\SAS_datacodes';
run;
data a1; set tmp1.mergedata_new;
/*proc univariate; run;*/

proc corr data = a1; var che2 nwc capx2 size growth cfo xrd2 tfi age sigmacash dvc_dummy dma; run;
proc reg data = a1;
model che2 = growth capx2 nwc size cfo xrd2 tfi age sigmacash dvc_dummy dma y1988 y1989 y1990 y1991 y1992 y1993 y1994 y1995
y1996 y1997 y1998 y1999 y2000 y2001 y2002 y2003 y2004 y2005 y2006 y2007 y2008 y2009 y2010 y2011 y2012 y2013 y2014 y2015 y2016
y2017 y2018 y2019 y2020 ind2 ind7 ind8 ind9 ind10 ind12 ind13 ind14 ind15 ind16 ind17 ind20 ind21 ind22 ind23 ind24
ind25 ind26 ind27 ind28 ind29 ind30 ind31 ind32 ind33 ind34 ind35 ind36 ind37 ind38 ind39 ind50 ind51 ind52 ind53 ind54 ind55 
ind56 ind57 ind58 ind59 ind70 ind72 ind73 ind75 ind76 ind78 ind79 ind80 ind81 ind82 ind83 ind86 ind87 ind89 ind99;
run;
