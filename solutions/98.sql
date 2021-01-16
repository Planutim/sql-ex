with cte as (select code,speed,ram, speedram,
cast('' as varchar(max)) binval
from (select code,speed,ram, cast(speed | ram as int)speedram
from pc)t
union all
select code,speed,ram, speedram/2, cast(speedram%2 as varchar(max))+binval
from cte c
where speedram>0)
select code, speed,ram from cte
where speedram=0 and binval like '%1111%'

