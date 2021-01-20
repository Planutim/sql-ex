select point,date,
case 
when out>out_o then 'more than once a day'
when out<out_o then 'once a day'
else 'both' end
lider 
from (select coalesce(o1.point,o2.point) point,
coalesce(o1.date,o2.date) date,
coalesce(o1.out,0)out_o, coalesce(o2.out,0)out
from (select * from outcome_o where point in (select point from outcome)) o1 full join (select point,date,sum(coalesce(out,0))out from outcome where point in (select point from outcome_o)
group by point,date
)o2 on o1.point=o2.point and o1.date=o2.date
)z

