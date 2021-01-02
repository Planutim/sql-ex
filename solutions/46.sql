select outcomes.ship, classes.displacement, classes.numGuns from outcomes join ships on outcomes.ship=ships.name join classes on classes.class=ships.class where outcomes.battle='guadalcanal'
UNION
select ship, displacement, numGuns from outcomes left join classes on outcomes.ship=classes.class where outcomes.battle='guadalcanal' and ship not in (select name from ships)

