with t as(select time_out,ID_psg,plane,ID_comp,a.trip_no, date from pass_in_trip a join trip b on a.trip_no=b.trip_no)
select name, count(distinct checksum(date,time_out,trip_no))flights,count(distinct plane) as planes
, count(distinct ID_psg)diff_psngrs,count(ID_psg)tot_psngrs from t,company where t.ID_comp=company.ID_comp
group by t.ID_comp,name

