with all_t as (select product.*,price from product join pc on pc.model=product.model
union
select product.*,price from product join laptop on laptop.model=product.model
union
select product.*,price from product join printer on printer.model=product.model),
t_maker as (select maker from all_t
group by maker
having coalesce(max(price),0)!=0)
select maker, max(case when type='laptop' then price else null end) laptop,
max(case when type='pc' then price else null end) pc,
max(case when type='printer' then price else null end) printer
from all_t where maker in (select * from t_maker)
group by maker

