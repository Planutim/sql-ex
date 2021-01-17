select Q_NAME,
sum(W) over(),
sum(B) over()
from
(select Q_NAME,
case when B_VOL is null then 1 else 0 end B,
case when B_VOL=255*3 then 1 else 0 end W
 from utQ left join 
(select distinct B_Q_ID,sum(B_VOL) over(partition by B_Q_ID)B_VOL from utB)t on B_Q_ID=Q_ID where B_VOL=255*3 or B_VOL is null)tt

