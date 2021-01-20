select [R],[G],[B] from (select V_COLOR,
255*(select count(*) from utQ)-B_VOL as B_VOL from
(select V_COLOR,sum(B_VOL)B_VOL from utB join utV on utB.B_V_ID=V_ID
group by V_COLOR)t)tt
pivot
(avg(B_VOL) for V_COLOR in ([R],[G],[B]))pvt

