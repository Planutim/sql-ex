select name,sum(duration)minutes from company c, (
select distinct date,b.trip_no,time_out,ID_comp,case when datediff(minute,time_out,time_in)<=0 then 1440+datediff(minute,time_out,time_in)
else datediff(minute,time_out,time_in) end duration
 from  pass_in_trip a join trip b on a.trip_no=b.trip_no
)t where c.ID_comp=t.ID_comp
group by c.ID_comp,name

