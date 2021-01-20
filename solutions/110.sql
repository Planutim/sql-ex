select name from passenger, (select distinct a.ID_psg from pass_in_trip a join trip b on a.trip_no=b.trip_no join passenger c on a.ID_psg=c.ID_psg where datepart(dw,date)=
case (select @@datefirst)
when 1 then 6 
else 7 end
and datediff(hour,time_out,time_in)<0)tt
where tt.ID_psg=passenger.ID_psg

