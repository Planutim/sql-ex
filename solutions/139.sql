select z.name,t.battle_list from (select * from ships where name not in (select ship from outcomes))z
cross apply
(select string_agg(cast(name as varchar(max)),',') within group(order by date asc)battle_list from battles
where datepart(year,date)<
case when launched is null
then (select launched from ships where name=z.class)
else launched end
)t

