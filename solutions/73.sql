with t1 as (select outcomes.*, classes.country from outcomes join ships on ships.name=outcomes.ship join classes on classes.class=ships.class
union
select outcomes.*, classes.country from outcomes join classes on classes.class=outcomes.ship)
select country, name from classes cross join battles
except
select country, battle from t1
