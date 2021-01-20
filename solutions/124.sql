select name from passenger,(select ID_psg,ID_comp,count(*)num from pass_in_trip a join trip b on a.trip_no=b.trip_no
where ID_psg in (select ID_psg from pass_in_trip a join trip b on a.trip_no=b.trip_no
group by ID_psg
having count(distinct ID_comp)>1)
group by ID_psg,ID_comp)z where passenger.ID_psg=z.ID_psg
group by z.ID_psg,passenger.name
having count(distinct num)=1

