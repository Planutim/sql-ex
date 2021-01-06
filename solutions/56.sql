with t as (select ships.class,ships.name,outcomes.result from outcomes 
join ships on ships.name=outcomes.ship
join classes on classes.class=ships.class where outcomes.result='sunk'
union ALL
select classes.class, outcomes.ship, outcomes.result from outcomes 
join classes on classes.class=outcomes.ship where outcomes.result='sunk')
select a.class, (select count(*) from t where t.class=a.class) as Sunks 
from classes as a

