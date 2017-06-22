
a= load '/user/hive/warehouse/niit.db/h1bfinal' using PigStorage('\t') as (sno:int,casestatus:chararray,employername:chararray,socname:chararray,jobtitle:chararray,fulltime:chararray,wage:int,year:chararray,worksite:chararray,longt:double,lat:double);
b= foreach a generate year,worksite,jobtitle;
c= filter b by jobtitle=='DATA ENGINEER II';
d= group c by $0;
e= foreach d generate group,COUNT(c.jobtitle);



dump e;
