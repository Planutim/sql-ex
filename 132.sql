select
concat(
iif(age/12>0, concat(cast(age/12 as varchar(255)), ' y.'),''),
iif(age%12>0 and age/12>0, ', ',''),
iif(age%12>0, concat(cast(age%12 as varchar(255)), ' m.'),'')) age,
date1,
date2
 from (select 
datediff(month,date1,date2)-
case when 
datediff(month,date1,date2)>0 
and not(datepart(day,date2)-datepart(day,date1)>=0
or datediff(month,date2,dateadd(day,1,date2))=1
and datepart(day,date2)-datepart(day,date1)<0)
 then 1 else 0 end
as age,
*
 from
(select 
cast(b1.date as date) as date1, 
cast(coalesce(z.date,getdate()) as date) as date2 from battles b1
outer apply
(select top 1 date from battles b2 where
b1.date<b2.date order by date asc)z
)zz
)zzz

