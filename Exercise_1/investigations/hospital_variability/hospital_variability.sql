-- Figure out the procedures which have the most variance across hospitals

select measure_id, sqrt(variance(score)) var from procedure
   where score is not null and score >0 and score <=100 group by measure_id
   order by var desc limit 10;
