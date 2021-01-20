select name from ships where launched<1941
union
select ship from outcomes join battles on battles.name=outcomes.battle where datepart(year,date)<1941
union
select ships.class from outcomes join battles on battles.name=outcomes.battle  join ships on ships.name=outcomes.ship
where datepart(year,date)<1941
and class in (select name from ships union select ship from outcomes)
union
select class from ships where launched<1941 and class in (
select name from ships union select ship from outcomes)

