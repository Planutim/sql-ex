with t as (select dateadd(day,a,'2003-04-01') as dateAdd from  
(select 0 a union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 )y)
select dateAdd, (select count(*) from (select distinct trip.trip_no,trip.town_from, pass_in_trip.date from trip join pass_in_trip on trip.trip_no=pass_in_trip.trip_no join
passenger on pass_in_trip.ID_psg=passenger.ID_psg)t where town_from='Rostov' and date=dateAdd) as t from t

