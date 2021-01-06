with t1 as (select ships.name, ships.class,outcomes.result from ships left join classes 
on classes.class=ships.class left join outcomes on ships.name=outcomes.ship
union
select outcomes.ship, classes.class,outcomes.result from outcomes join classes on 
classes.class=outcomes.ship),
t2 as (select distinct class from t1
group by class
having count(*)>=3)
select distinct class, sum(case when result='sunk' then 1 else 0 end) from t1 where
class in (select distinct class from t2)
group by class
having sum(case when result='sunk' then 1 else 0 end)>0

