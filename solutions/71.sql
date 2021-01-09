select distinct maker from product pr1 where type='PC'
and not exists(
select model from product where type='PC' and maker=pr1.maker
except
select model from pc where maker=pr1.maker)

