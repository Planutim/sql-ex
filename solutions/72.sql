with t as (select ID_psg,name from 
(select distinct b.*,c.ID_comp from pass_in_trip a left join passenger b on a.ID_psg=b.ID_psg left join
trip c on a.trip_no=c.trip_no)t
group by ID_psg,name
having count(*)=1),
t2 as (select b.name,b.ID_psg,count(*) num from pass_in_trip a join passenger b on a.ID_psg=b.ID_psg join trip c on a.trip_no=c.trip_no
join t on b.ID_psg=t.ID_psg and b.name=t.name
group by b.name,b.ID_psg)
select name,num from t2 where num>=all(select num from t2)
