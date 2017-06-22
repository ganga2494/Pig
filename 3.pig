--3)Which industry(SOC_NAME) has the most number of Data Scientist positions?
a= load '/user/hive/warehouse/niit.db/h1bfinal' using PigStorage('\t') as (sno:int,casestatus:chararray,employername:chararray,socname:chararray,jobtitle:chararray,fulltime:chararray,wage:int,year:chararray,worksite:chararray,longt:double,lat:double);
b= foreach a generate socname,jobtitle;
c= filter b by jobtitle=='DATA SCIENTIST';
d= group c by socname;
e= foreach d generate group,COUNT(c.jobtitle);
f= order e by $1 desc;
g= limit  f 1;
dump g;
