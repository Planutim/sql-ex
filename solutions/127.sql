select cast(round(sum(result)/sum(case when result=0 then 0 else 1 end),2) as decimal(20,2))avg_val from (select coalesce(min(price),0)result from product join laptop on laptop.model=product.model
where maker in (select maker from product join pc on pc.model=product.model
group by maker
having min(convert(int,substring(cd,1,len(cd)-1)))<=all(select convert(int,substring(cd,1,len(cd)-1)) 
from pc))
union all
select coalesce(max(price),0) from pc join product on product.model=pc.model where maker in(
select maker from product join printer on product.model=printer.model where price=
(select min(price) from printer))
union all
select coalesce(max(price),0) from printer join product on product.model=printer.model where maker in 
(select maker from laptop join product on product.model=laptop.model where ram=(select max(ram) 
from laptop)))z

