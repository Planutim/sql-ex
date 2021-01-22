with cte as (select trip_no as num_orig,trip_no as num, cast('' as varchar(255)) bin from trip
union all
select num_orig,num/2, cast(cast(num%2 as varchar(255))+bin as varchar(255))
from cte
where num!=0 
)
select num_orig,bin from cte
where num=0

