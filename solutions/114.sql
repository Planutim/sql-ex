select name,times as NN from (select name, times,rank() over(order by times desc)rnk from passenger, (select distinct ID_psg,count(*)times from pass_in_trip
group by ID_psg,place)t where passenger.ID_psg=t.ID_psg)tt
where rnk=1

