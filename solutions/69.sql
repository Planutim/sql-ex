with i as (select point,date, sum(inc)inc from income group by point,date),
o as (select point,date, sum(out)out from outcome group by point,date),
t as (select coalesce(i.point,o.point)point, coalesce(i.date,o.date)date, 
coalesce(inc,0)inc,coalesce(out,0)out from i full join o on i.point=o.point and i.date=o.date)
select  point,convert(varchar,date,103), 
sum(inc-out) over(partition by point order by date range unbounded preceding)
from t

