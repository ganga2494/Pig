-- Find top 5 job titles who are having highest avg growth in applications.
a= load '/user/hive/warehouse/niit.db/h1bfinal' using PigStorage('\t') as (sno:int,casestatus:chararray,employername:chararray,socname:chararray,jobtitle:chararray,fulltime:chararray,wage:int,year:chararray,worksite:chararray,longt:double,lat:double);
b= foreach a generate jobtitle,casestatus;
c= group b by jobtitle;
d= foreach c generate group,COUNT(b.casestatus);
e= order d by $1 desc;
f= LIMIT e 5; 
dump f;
