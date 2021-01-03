with all_ships  as (select ships.name as name, displacement, numGuns from ships join classes on classes.class=ships.class
UNION
select outcomes.ship as name, displacement, numGuns from outcomes join classes on classes.class=outcomes.ship),
max_nums(displacement, numGuns) as (select displacement,max(numGuns) from all_ships group by displacement)
select t.name from all_ships t where numGuns=(select numGuns from max_nums where displacement=t.displacement)
order by name
