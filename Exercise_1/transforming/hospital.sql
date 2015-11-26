-- Create a table corresponding to the entity hospital in the ER diagram
-- For the purpose of answering the questions these fields suffice.
drop table hospital;

create table hospital as select providerid, hospital_name, city, State, emergency_services from hospitals;
