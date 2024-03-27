*this program creates the Industry Sigma;
libname tmp1 '\\apporto.com\dfs\SEA\Users\s10_sea\Downloads\SAS_datacodes';
run;
data a1; set tmp1.sigma1975 tmp1.sigma1976 tmp1.sigma1977 tmp1.sigma1978 
tmp1.sigma1979 tmp1.sigma1980 tmp1.sigma1981 tmp1.sigma1982 tmp1.sigma1983 
tmp1.sigma1984 tmp1.sigma1985 tmp1.sigma1986 tmp1.sigma1987 tmp1.sigma1988 
tmp1.sigma1989 tmp1.sigma1990 tmp1.sigma1991 tmp1.sigma1992 tmp1.sigma1993 
tmp1.sigma1994 tmp1.sigma1995 tmp1.sigma1996 tmp1.sigma1997 tmp1.sigma1998 
tmp1.sigma1999 tmp1.sigma2000 tmp1.sigma2001 tmp1.sigma2002 tmp1.sigma2003 
tmp1.sigma2004 tmp1.sigma2005 tmp1.sigma2006 tmp1.sigma2007 tmp1.sigma2008 
tmp1.sigma2009 tmp1.sigma2010 tmp1.sigma2011 tmp1.sigma2012 tmp1.sigma2013 
tmp1.sigma2014 tmp1.sigma2015 tmp1.sigma2016 tmp1.sigma2017 tmp1.sigma2018 
tmp1.sigma2019 tmp1.sigma2020 tmp1.sigma2021 tmp1.sigma2022;
data a2; set a1;
proc sort; by nyear sic2;
data a3; set a2;
data tmp1.sigmaall1; set a3;
data tmp1.sigmaall2; set a3;
data tmp1.sigmaall3; set a3;
data tmp1.sigmaall4; set a3;
data tmp1.sigmaall5; set a3;
data tmp1.sigmaall6; set a3;
data tmp1.sigmaall7; set a3;
data tmp1.sigmaall8; set a3;
data tmp1.sigmaall9; set a3;
data tmp1.sigmaall10; set a3;
proc means; run;
