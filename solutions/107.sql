with t as (select b.*, ID_psg,date,dense_rank() over (partition by date,time_out order by b.trip_no)rowNum from pass_in_trip a join trip b on a.trip_no=b.trip_no)
select name, t.trip_no, date from t join company on t.ID_comp=company.ID_comp where datepart(year,date)=2003 and datepart(month,date)=4 and town_from='Rostov'
and rowNum=1 order by date asc offset 4 rows fetch next 1 rows only

