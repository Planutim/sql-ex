with a as (select *, row_number() over(order by code asc)rowNum from printer),
cte as (select code,model,color,type,price,1 as groupNum,rowNum,1 as counter from a where rowNum=1
union all
select a.code,a.model,a.color,a.type,a.price,
case when a.color='n' then groupNum+1 else groupNum end,a.rowNum,counter+1 from cte, a  where cte.rowNum+1=a.rowNum 
and counter<100
)
select code,model,color,type,price, max(model) over(partition by groupNum)max_model,
(select count(distinct type) from cte where groupNum=c.groupNum) as distct_types,
avg(price) over(partition by groupNum)avg_price from cte c

