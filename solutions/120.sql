select distinct coalesce(name,'TOTAL')Company, 
cast(round(sum(cast(duration as float))/count(*),2) as decimal(20,2))A_Mean,
cast(round(power(exp(sum(log(duration))),1.0/count(*)),2) as decimal(20,2))G_Mean,
cast(round(sqrt(sum(duration*duration)/count(*)),2) as decimal(20,2))Q_Mean,
cast(round(count(*)/(sum(1.0/duration)),2) as decimal(20,2))H_Mean
from (select 
ID_comp,
case when duration>0 then duration
else 1440+duration end duration
from (select distinct a.trip_no,date,ID_comp,datediff(minute,time_out,time_in)duration from pass_in_trip a join trip b on a.trip_no=b.trip_no
)z
)zz,
company where
zz.ID_comp=company.ID_comp
group by name,zz.ID_comp with rollup

