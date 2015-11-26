-- Create a table for readmissions_mortality
drop table readmissions_mortality;

create table readmissions_mortality as select Measure_ID,  ProviderID, cast(regexp_replace(readmissions.score,'"','') as double) score   from readmissions;
