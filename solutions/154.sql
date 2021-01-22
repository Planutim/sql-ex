with t as (select coalesce(i.point,o.point)point, coalesce(i.date,o.date)date,coalesce(sum(inc),0)inc,
coalesce(sum(out),0)out, 'several' how
 from income i full join outcome o on i.point=o.point and i.date=o.date
group by coalesce(i.point,o.point),coalesce(i.date,o.date)
union
select coalesce(i.point,o.point),
coalesce(i.date,o.date),
coalesce(inc,0),
coalesce(out,0),
'once' how
from income_o i full join outcome_o o on i.point=o.point and i.date=o.date)
select t1.* from t t1 
cross apply
(select point,date from t
group by point,date 
having count(*)=1)z
where z.point=t1.point and z.date=t1.date

