with t as (select product.*,price from product join pc on pc.model=product.model
union all
select product.*,price from product join laptop on laptop.model=product.model
union all
select product.*, price from product join printer on printer.model=product.model
)
select z.maker, max(
case when z.maker=zz.maker then zz.cou else 0 end),
max(case when z.maker=zz.maker then zz.cou2 else 0 end)
 from (select distinct maker from product)z,
(select maker, count(*)cou,count(distinct price)cou2 from t c
where price in (select price from t where maker=c.maker
group by price
having count(*)>1)
group by maker
)zz
group by z.maker

