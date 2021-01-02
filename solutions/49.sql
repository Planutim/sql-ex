select bore from (select classes.bore from ships join classes on classes.class=ships.class 
UNION
select classes.bore from outcomes join classes on classes.class=outcomes.ship )t where bore=16

