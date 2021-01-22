with t as (select ((select datepart(year,min(date))/10 from battles)+a*10+b-1)
grp from (select 0 a union select 1 union select 2 union select 3
union select 4 union select 5 union select 6 union select 7 union select 8
union select 9 union select 10 union select 11
)p
cross join
(select 1 b union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9 union select 10)z
)


select concat(cast(t.grp*10 as varchar(max)),'s')years,coalesce(battles,0)battles from t left join
(
select datepart(year,date)/10 grp, count(*)battles from battles
group by datepart(year,date)/10)z
on t.grp=z.grp
where t.grp<=(select max(datepart(year,date))/10 from battles)

