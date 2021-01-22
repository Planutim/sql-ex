with words as (select ship  from outcomes where charindex(' ',ship,charindex(' ',ship)+1)>0
),
cte as (select ship,-1 as first, -1 as last,1 as step from words
union all
select ship,
iif(charindex(' ',ship,step)>0 and first=-1,charindex(' ',ship,step),first),
iif(charindex(' ',ship,step)>0, charindex(' ',ship,step),last),
step+1
from cte
where step<=datalength(ship)
)
select ship,concat(substring(ship,1,first),replicate('*',last-first-1),
substring(ship,last,datalength(ship)))new_name from cte
where step-datalength(ship)=1

