a= load '/user/hive/warehouse/niit.db/h1bfinal' using PigStorage('\t') as (sno:int,casestatus:chararray,employername:chararray,socname:chararray,jobtitle:chararray,fulltime:chararray,wage:int,year:chararray,worksite:chararray,longt:double,lat:double);

b= foreach a generate jobtitle,casestatus;
c= filter b by casestatus=='CERTIFIED' OR casestatus=='CERTIFIED-WITHDRAWN';
d= group c by jobtitle;

e= foreach d generate group,COUNT(c.casestatus) as coun;
f= order e by coun desc;
g= limit f 5;
dump g;
