-- Create a table for the entity procedure.

drop table procedure;

create table procedure as select Measure_ID, Measure_Name, ProviderID, Condition, cast(regexp_replace(effective_care.score,'"','') as int) score, cast(regexp_replace(effective_care.sample,'"','') as int) sample, hospital_name, state  from effective_care;
