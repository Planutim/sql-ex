select name from passenger where ID_psg in (select ID_psg from pass_in_trip
group by place, ID_psg
having count(*)>1
)
