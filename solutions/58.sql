with t1 as (select maker,type,
cast(cast(count(*) as float)/(select count(*) from product where maker=prod.maker)*100 as decimal(20,2)) as prc from product prod
group by maker,type),
t2 as (select distinct a.maker, b.type from product a, product b)
select t2.*,  coalesce(prc, '.00') from t2 left join t1 on t1.maker=t2.maker and t1.type=t2.type
order by maker

