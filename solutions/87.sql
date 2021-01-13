select name, count(*) from pass_in_trip a join trip b on a.trip_no=b.trip_no
join passenger c on a.ID_psg=c.ID_psg
where town_to='Moscow'
group by c.ID_psg,name
having count(*)>1
and exists (select ID_psg from (select town_from, name, c.ID_psg,date,
row_number() over(partition by c.ID_psg order by date,datepart(hour,time_out)) rowNum from pass_in_trip a join trip b on a.trip_no=b.trip_no join passenger c on a.ID_psg=c.ID_psg)t
where rowNum=1 and town_from!='Moscow' and ID_psg=c.ID_psg)

