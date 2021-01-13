with t as (select distinct date,b.trip_no,town_from from pass_in_trip a join trip b on a.trip_no=b.trip_no where town_from='Rostov'),
most_flights as (select top 1 date from t
group by date
having count(*)>=all(select count(*) from t group by date)
order by date 
),
week as (select dateadd(day,ttt,(select * from most_flights))date from 
(select 0 ttt union select 1 union select 2 union select 3 union select 4
union select 5 union select 6)t)
select week.date, 
sum(case when town_from is null then 0 else 1 end) from week left join t on t.date=week.date
group by week.date

