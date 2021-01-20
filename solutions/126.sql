select name, prev, nxt from (select name,ID_psg, lag(name,1,(select top 1 name from passenger order by ID_psg desc)) over(order by ID_psg asc)prev, lead(name,1,
(select top 1 name from passenger order by ID_psg asc)) over(order by ID_psg asc)nxt from passenger)z  where ID_psg in (select ID_psg from pass_in_trip
group by ID_psg
having count(*)>=all(select count(*)num from pass_in_trip 
group by ID_psg)
)

