-- Table hospitals
drop table hospitals;
create external table hospitals
(
  ProviderID         varchar(8),
  Hospital_Name      varchar(52),
  Address            varchar(52),
  City               varchar(22),
  State              varchar(4),
  Zip_Code           varchar(7),
  County_Name        varchar(22),
  Phone_Number       varchar(12),
  Hospital_Type      varchar(38),
  Hospital_Ownership varchar(45),
  Emergency_Services varchar(5)
)
 row format
 delimited fields terminated by ','
 stored as textfile
 location 'hdfs:///user/raja/hospital_compare/hospitals_data/';


-- Table effective_care
drop table effective_care;
create external table  effective_care
(
  ProviderID         varchar(8),
  Hospital_Name      varchar(52),
  Address            varchar(52),
  City               varchar(22),
  State              varchar(4),
  Zip_Code           varchar(7),
  County_Name        varchar(22),
  Phone_Number       varchar(12),
  Condition          varchar(37),
  Measure_ID         varchar(24),
  Measure_Name       varchar(137),
  Score              varchar(44),
  Sample             varchar(15),
  Footnote           varchar(181),
  Measure_Start_Date varchar(20),
  Measure_End_Date   varchar(20)
)
 row format delimited
fields terminated by ','
 stored as textfile
 location 'hdfs:///user/raja/hospital_compare/effective_care_data/';


-- Table Readmissions
drop table readmissions;
create external table  readmissions
(
  ProviderID         varchar(8),
  Hospital_Name      varchar(52),
  Address            varchar(52),
  City               varchar(22),
  State              varchar(4),
  Zip_Code           varchar(7),
  County_Name        varchar(22),
  Phone_Number       varchar(12),
  Measure_Name       varchar(137),
  Measure_ID         varchar(24),
  Compare_To_National varchar(37),
  Denominator         varchar(15),
  score               varchar(15),
  Lower_Estimate      varchar(15),
 Higher_Estimate     varchar(15),
  Footnote            varchar(58),
  Measure_Start_Date  varchar(12),
  Measure_End_Date  varchar(12)
)
 row format delimited
 fields terminated by ','
 stored as textfile
 location 'hdfs:///user/raja/hospital_compare/readmissions_data/';

-- Table Surveys and Responses
drop table surveys_responses;
create external table surveys_responses
(
  ProviderID         varchar(8),
  Hospital_Name      varchar(52),
  Address            varchar(52),
  City               varchar(22),
  State              varchar(4),
  Zip_Code           varchar(7),
  County_Name        varchar(22),
  Comm_Nurses_Ach_Points varchar(30),
  Comm_with_Nurses_Imp_Points varchar(30),
Comm_with_Nurses_Dim_Score varchar(30),
  Comm_with_Doctors_Ach_Points varchar(30),
  Comm_with_Doctors_Imp_Points varchar(30),
  Comm_with_Doctors_Dim_Score varchar(30),
  Resp_of_Hosp_Staff_Ach_Points varchar(30),
  Resp_of_Hosp_Staff_Imp_Points varchar(30),
  Resp_of_Hosp_Staff_Dim_Score varchar(30),
  Pain_Mgmt_Ach_Points         varchar(30),
  Pain_Mgmt_Imp_Points        varchar(30),
  Pain_Mgmt_Dim_Score          varchar(30),
  Comm_about_Med_Ach_Points    varchar(30),
  Comm_about_Med_Improvement_Points varchar(30),
  Comm_about_Med_Dim_Score     varchar(30),
  Clean_and_Quiet_of_Hosp_Env_Ach_Points varchar(30),
  Clean_and_Quiet_of_Hosp_Env_Imp_Points varchar(30),
  Clean_and_Quiet_of_Hosp_Env_Dim_Score  varchar(30),
  Discharge_Info_Ach_Points    varchar(30),
  Discharge_Info_Imp_Points varchar(30),
  Discharge_Information_Dimension_Score varchar(30),
  Overall_Rating_of_Hospital_Achievement_Points varchar(30),
  Overall_Rating_of_Hospital_Improvement_Points varchar(30),
  Overall_Rating_of_Hospital_Dimension_Score varchar(30),
  HCAHPS_Base_Score varchar(30),
  HCAHPS_Consistency_Score varchar(30)
)
 row format delimited
 fields terminated by ','
 stored as textfile
 location 'hdfs:///user/raja/hospital_compare/surveys_data/';

-- Table measures
drop table measures;
create external table   measures
(
  Measure_Name               varchar(137),
  Measure_ID                 varchar(24),
  Measure_Start_Quarter      varchar(10),
  Measure_Start_Date         varchar(26),
  Measure_End_Quarter        varchar(10),
  Measure_End_Date           varchar(26)
)
 row format delimited
 fields terminated by ','
 stored as textfile
 location 'hdfs:///user/raja/hospital_compare/measures_data/';




