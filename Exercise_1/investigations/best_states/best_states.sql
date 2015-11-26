-- The best states are those which have the higher proportion of best hospitals
-- compared to the total number of hospitals in the state.
-- First find the best hospitals.

drop table results;
create table results as select  providerid, avg(score) avg1, sum(score) agg,
                                sqrt(variance(score)) sd from procedure
                        where (score is not null and score <= 100 and score > 0)
                        group by providerid order by avg1 desc;

-- Emergency services.
drop table temp1;
create table temp1 as select providerid, hospital_name, emergency_services
   from hospital where emergency_services='"Yes"';

-- include readmission & mortality rate
drop table temp2;
create table temp2 as select providerid, avg(score)avg2 from readmissions_mortality where score is not null and score <=100 and score >0 group by providerid;

-- readmission rate < 10%.
drop table temp3;
create table temp3  as select providerid, avg2 from temp2 where avg2 <10;

drop table temp4;
create table temp4 as select p.providerid, p.avg1, p.agg, p.sd, q.avg2
  from results p join temp3 q on q.providerid=p.providerid;

-- include hospital name
create table temp5 as select  p.providerid, p.avg1, p.agg, p.sd, p.avg2,
            q.hospital_name from temp4 p join hospital q
       where q.providerid=p.providerid ;

-- Include state.
create table temp51 as select  p.providerid, p.avg1, p.agg, p.sd, p.avg2,
   q.state from temp5 p join hospital q where q.providerid=p.providerid ;

-- Combine all the conditions for a good hospital.
create table temp61 as select p.providerid, p.avg1, p.agg,p.sd,p.avg2,p.state from temp51 p join temp1 q on p.providerid=q.providerid;

