with t as (select a.ID_psg,
case when datediff(minute,b.time_out, b.time_in)>0 then datediff(minute,b.time_out, b.time_in)
else 1440+datediff(minute,b.time_out, b.time_in) end duration from pass_in_trip a join trip b on a.trip_no=b.trip_no)
select name, sum(duration) from t,passenger where passenger.ID_psg=t.ID_psg
group by t.ID_psg,name
having sum(duration)>=all(select sum(duration) from t group by ID_psg)

