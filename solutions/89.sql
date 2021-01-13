select distinct maker from product where maker in(
select maker from product
group by maker
having count(*)>=all(select count(*) from product group by maker)
or
count(*)<=all(select count(*) from product group by maker))

