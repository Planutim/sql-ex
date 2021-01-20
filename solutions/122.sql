with t as (select ID_psg, town_from,town_to,date, 
row_number() over(partition by ID_psg order by date asc,time_out asc) rowNum,
row_number() over(partition by ID_psg order by date desc,time_out desc) rowNum_2
from pass_in_trip a
join trip b on a.trip_no=b.trip_no)
select name, town_from from t c,passenger where rowNum=1
and town_from<>(select town_to from t where c.ID_psg=ID_psg and rowNum_2=1 )
and passenger.ID_psg=c.ID_psg

