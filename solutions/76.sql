select b.name, sum(case when datediff(minute, time_out, time_in)<0 then 1440+datediff(minute, time_out, time_in) else datediff(minute, time_out, time_in) end) minutes  from pass_in_trip a join passenger b on a.ID_psg=b.ID_psg join trip c on
a.trip_no=c.trip_no where not exists (select place,count(*) from pass_in_trip where ID_psg=b.ID_psg
group by place
having count(*)>1)
group by b.name,b.ID_psg
order by minutes

