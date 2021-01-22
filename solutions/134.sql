with t as (select B_Q_ID,
sum(iif(V_COLOR='R',B_VOL,0))R,
sum(iif(V_COLOR='G',B_VOL,0))G,
sum(iif(V_COLOR='B',B_VOL,0))B
 from utB join utV on V_ID=B_V_ID
group by B_Q_ID
),
t2 as (select 'R' all_color union select 'G' union select 'B'),
t3 as (select * from t2, (select Q_ID from utQ)z),
t4 as (select B_Q_ID,V_COLOR, sum(B_VOL)B_VOL_G from utB join utV on V_ID=B_V_ID 
group by B_Q_ID,V_COLOR)


select distinct B_Q_ID from (select *,sum(255-B_VOL_G) over (partition by V_COLOR order by rn rows unbounded preceding)sum
from (select *,row_number() over(partition by V_COLOR order by B_VOL_G desc,B_Q_ID asc)rn from (select all_color as v_color,
Q_ID as B_Q_ID,coalesce(B_VOL_G,0)B_VOL_G
 from t3 left join t4 on Q_ID=B_Q_ID and all_color=v_color
)z
)zz
)o1,
(select z.V_COLOR, l-s leftover from
(select V_COLOR,count(*)*255 l from utV
group by V_COLOR)z,
(select V_COLOR,sum(B_VOL)s from utB join  utV on V_ID=B_V_ID 
group by V_COLOR)zz

where z.V_COLOR=zz.V_COLOR)o2
where o1.V_COLOR=o2.V_COLOR
and leftover<sum

