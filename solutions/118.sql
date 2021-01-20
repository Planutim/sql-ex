select c.name,z.* from battles c, (select distinct cast(b.date as date) as battle_dt, cast(min(ddate) as date) as election_dt from battles b, 
(select name,date, dateadd(day,incc,ndate) as ddate from 
  (select name,date, datefromparts(datepart(year,dateadd(year,inc,date)),4,1)ndate      from battles, (select tink*3+pink-1 inc from (select 0 tink union all select 1
  union all select 2 union all select 3 union all select 4)t
  cross join
  (select 1 pink
  union all select 2 union all select 3 )p)t
where datepart(month,dateadd(day,1,datefromparts(datepart(year,date)+inc,2,28)))=2
or (datepart(year,date)+inc)%400=0
and 1=
case when (datepart(year,date)+inc)%100=0 then 0
when (datepart(year,date)+inc)%4=0 then 1 
else 1 end
)t1,
  (select tink*3+pink-1 incc from (select 0 tink union all select 1
  union all select 2 union all select 3 union all select 4)t
  cross join
  (select 1 pink
  union all select 2 union all select 3 )p)t2
  where 1=
  case when (select @@datefirst)=7 and datepart(dw, dateadd(day,incc,ndate))=3
  then 1 
  when (select @@datefirst)=1 and datepart(dw,dateadd(day,incc,ndate))=2
  then 1 
  else 0 end
and datepart(month,dateadd(day,incc-1,ndate))=4
and datepart(day,dateadd(day,incc,ndate))<=8
)t
where b.name=t.name 
and b.date=t.date
and t.ddate>b.date
group by b.date
)z where c.date=z.battle_dt

