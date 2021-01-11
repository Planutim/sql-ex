with t as (select a.*, town_from from (select distinct trip_no,date from pass_in_trip) a join trip b on
a.trip_no=b.trip_no)
select sum(case when town_from='Rostov' then 1 else 0 end) Qty, date from t
group by date 
having 2*sum(case when town_from='Rostov' then 1 else 0 end)>=count(*)
and count(*)>=0

having 2*sum(case when town_from='Rostov' then 1 else 0 end)>=count(*)
and count(*)>=0
