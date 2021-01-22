with t as (select a.*,b.time_out,dense_rank() over(partition by ID_psg order by date asc,time_out asc) rn from pass_in_trip a join trip b on a.trip_no=b.trip_no
)

select name from passenger c, (select distinct t1.ID_psg from t t1,t t2
where t1.ID_psg=t2.ID_psg
and t1.place=t2.place
and (t1.date<>t2.date
or t1.time_out<>t2.time_out)
and abs(t1.rn-t2.rn)=1
)zz where c.ID_psg=zz.ID_psg

