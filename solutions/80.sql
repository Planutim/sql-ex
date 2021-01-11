select distinct maker  from product prod 
where not exists(
select model from product where maker=prod.maker and type='PC'
except
select distinct model from pc
)
