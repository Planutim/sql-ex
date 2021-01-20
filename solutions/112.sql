select
case when count(*)=3 then min(B_VOL)/255 else 0 end
from(
select V_COLOR, sum(B_VOL)B_VOL from (
select V_COLOR,255-coalesce(sum(B_VOL),0)B_VOL 
from utV left join utB on B_V_ID=V_ID where V_COLOR is not null
group by V_ID,V_COLOR)t
group by V_COLOR)tt

