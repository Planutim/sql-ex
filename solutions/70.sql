with t as (select outcomes.*, classes.country from outcomes  join ships
on ships.name=outcomes.ship join classes on classes.class=ships.class 
union
select outcomes.*, classes.country from outcomes join classes on classes.class=
outcomes.ship)
select battle  from t left join battles on t.battle=battles.name
group by country,battle
having count(*)>=3

