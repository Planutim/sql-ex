select name, coalesce(cnt,0)cnt from passenger, (
select z.ID_psg, zz.cnt from (select distinct ID_psg from pass_in_trip)z left join
(select ID_psg, 
iif(ff_date>'2003-04-30' or lf_date<'2003-04-01',0, datediff(day,ff_date,lf_date)+1)

as cnt from (
select ID_psg, 
iif(min(date)<'2003-04-01','2003-04-01',min(date))ff_date,
iif(max(date)>'2003-04-30','2003-04-30',max(date))lf_date
from pass_in_trip
group by ID_psg)pt
)zz
on z.ID_psg=zz.ID_psg
)zzz
where passenger.ID_psg=zzz.ID_psg

