select ships.name,launched,z.* from ships
outer apply
(select coalesce(c.name,null)name from battles c where date=
(select case
 when launched is null then max(date)
when launched is not null then (select min(date) from battles where datepart(year,date)>=launched)
end date
 from battles))z

