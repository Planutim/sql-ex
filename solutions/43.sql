select ships.name from ships where ships.name like 'R%'
UNION
select outcomes.ship from outcomes where outcomes.ship like 'R%'

