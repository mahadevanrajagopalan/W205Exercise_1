-- Create a table for the entity survey_result
drop table survey_result;

create table survey_result as select  ProviderID,  cast(regexp_replace(surveys_responses.HCAHPS_Base_Score ,'"','') as int) score  from surveys_responses;
