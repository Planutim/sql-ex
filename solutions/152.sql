select row_number() over(order by nn, case when type='Printer' then 1 else 2 end,model asc)nn,
model,type from (select model,type,
coalesce(nullif(row_number() over (order by model asc)%(select count(*) from product where type='Printer') ,0),(select count(*) from product where type='Printer'))
as nn
from product where type='PC'
union all
select model, type, row_number() over(order by model asc) nn from product where type='Printer'
)z

