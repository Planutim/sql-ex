select maker from product where model in (select model from pc
where price>=all(select price from pc)
)
intersect
select maker from product where model in (select model from pc
where price<=all(select price from pc)
)
