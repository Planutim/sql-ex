select cast(avg(cast(numGuns as real)) as decimal(20,2)) from (select name,numGuns from ships left join classes on
ships.class=classes.class and classes.type='bb' union 
select ship as name, numGuns from outcomes left join classes on classes.class=outcomes.ship
and classes.type='bb')t

