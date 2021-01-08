select row_number() over(order by maker asc, case when type='PC' then 1 
when type='Laptop' then 2 else 3 end asc) num, 
maker,
type from 
(select distinct maker,type,
row_number() over(partition by maker over(order by maker asc, case when type='PC' then 1 
when type='Laptop' then 2 else 3 end asc)  from product) t,(select @i:='a') t1,
(select @id_comp:=0)t2
