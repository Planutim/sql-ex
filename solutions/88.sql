with t as (select ID_psg,min(ID_comp) ID_comp, count(*) as trip_Qty from pass_in_trip a join trip b on a.trip_no=b.trip_no
group by ID_psg
having count(distinct ID_comp)=1
)
select a.name, t.trip_Qty, b.name from passenger a, company b, t
where a.ID_psg=t.ID_psg and b.ID_comp=t.ID_comp
and trip_Qty>=all(select trip_Qty from t)
