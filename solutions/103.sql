with t3 as (select *,row_number() over(order by trip_no asc)rowNum from (select * from (select top 3 trip_no from trip order by trip_no asc)t
union
select * from (select top 3 trip_no from trip order by trip_no desc)t2
)t4)
select [1] as min1, [2] as min2,[3] as min3,[4] as min4,[5] as min5, [6] as min6
from t3
pivot
(avg(trip_no)
for rowNum in ([1],[2],[3],[4],[5],[6]))pvt

