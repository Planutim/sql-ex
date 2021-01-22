select coalesce(sum,0), dt1, dt2 from (select date dt1,lead(date) over(order by date asc)dt2 from (select distinct date from income_o)i2)i
cross apply
(select sum(out)sum from outcome_o o where 
date between dt1+1 and dt2)z
where dt1 is not null and dt2 is not null

