with all_ships(name, country) as (select ships.name,classes.country from ships join classes on classes.class=ships.class
UNION 
select outcomes.ship,classes.country from outcomes join classes on classes.class=outcomes.ship),
sunk_ships(name, country) as (select outcomes.ship, classes.country from outcomes join ships on outcomes.ship=ships.name join classes on classes.class=ships.class where result='sunk'
UNION
select outcomes.ship, classes.country from outcomes join classes on outcomes.ship=classes.class where result='sunk')
select distinct country from sunk_ships s where 1=(select case when (select count(*) from sunk_ships where s.country=country)=(select count(*) from all_ships where country=s.country) then 1 else 0 end)

