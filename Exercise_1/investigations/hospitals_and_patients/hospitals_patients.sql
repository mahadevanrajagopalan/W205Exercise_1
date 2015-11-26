--Compute average scores for hospital quality
create table temp_99 as select p.providerid, avg(p.score) avgscore from procedure group by providerid;

-- Patient survey response vs average from previous step.
select p.providerid, p.avgscore, q.score from temp_99  p join survey_result q on p.providerid=q.providerid limit 10;
