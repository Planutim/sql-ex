select z.type,avg(price) from 
(select type,model, coalesce(nullif(row_number() over(order by model asc)%5,0),5) rn 
from product
)z left join (
select 'PC' as type,model, price from PC
union all
select 'Laptop', model, price from Laptop
union all
select 'Printer', model,price from Printer
)zz
on z.type=zz.type
and z.model=zz.model
where rn=5
group by z.model,z.type

