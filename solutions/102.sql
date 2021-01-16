select name from trip a join pass_in_trip b on a.trip_no=b.trip_no join passenger c
on b.ID_psg=c.ID_psg
group by name,c.ID_psg
having count(distinct 
case when town_from>town_to then town_from+town_to else town_to+town_from end)=1

