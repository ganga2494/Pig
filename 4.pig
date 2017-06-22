a= load '/user/hive/warehouse/niit.db/h1bfinal' using PigStorage('\t') as (sno:int,casestatus:chararray,employername:chararray,socname:chararray,jobtitle:chararray,fulltime:chararray,wage:int,year:chararray,worksite:chararray,longt:double,lat:double);
b= foreach a generate year,employername;
c= group b by $1;
d= foreach c generate group,COUNT(b.employername) as coun,b.year;
dump d;
