-- A good hospital is one which has a high score as well as low readmission
-- and mortality rate. It provides a number of services including emergency.
--
-- Create a table results  which has the average score for each providerid
-- Compute the sum as well as the standard deviation.

drop table results;
create table results as select  providerid, avg(score) avg1, sum(score) agg,
                                sqrt(variance(score)) sd from procedure
                        where (score is not null and score <= 100 and score > 0)                        group by providerid order by avg1 desc;

-- temp1 has all the providers of emergency_sevices.
drop table temp1;
create table temp1 as select providerid, hospital_name, emergency_services  from hospital where emergency_services='"Yes"';

-- temp2 has the average scores of readmission and mortality for different
-- providers.
drop table temp2;
create table temp2 as select providerid, avg(score)avg2
                      from readmissions_mortality
                      where score is not null and score <=100 and score >0
                      group by providerid;

-- Good hospitals would have a readmission_mortality rate less than 10%.
drop table temp3;
create table temp3  as select providerid, avg2 from temp2 where avg2 <10;

-- combine mortality rate < 10% (avg2) with hospital score (avg1)
drop table temp4;
create table temp4 as select p.providerid, p.avg1, p.agg, p.sd, q.avg2
                   from results p join temp3 q on q.providerid=p.providerid;

-- Get hospital name.
create table temp5 as select  p.providerid, p.avg1, p.agg, p.sd, p.avg2,
                              q.hospital_name
                 from temp4 p join hospital q where q.providerid=p.providerid ;

-- Hospital should have emergency services. So Join with temp1.
create table temp6 as select p.providerid, p.avg1, p.agg,p.sd,p.avg2,p.hospital_name from temp5 p join temp1 q on p.providerid=q.providerid;

#select the first ten good hospitals from temp6.
select * from temp6 order by avg1 desc limit 10;


