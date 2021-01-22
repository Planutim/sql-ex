select name from passenger, (select ID_psg from pass_in_trip a join trip b on a.trip_no=b.trip_no
group by ID_psg,town_to
having count(*)>1
intersect
select ID_psg from pass_in_trip a join trip b on a.trip_no  = b.trip_no
group by ID_psg
having count(distinct plane)=1
)z
where passenger.ID_psg=z.ID_psg
