select Q_NAME,R as Qty from (select B_Q_ID,
sum(case when V_COLOR='R' then B_VOL end)R,
sum(case when V_COLOR='G' then B_VOL end)G,
sum(case when V_COLOR='B' then B_VOL end)B
 from utB join utV on utB.B_V_ID=utV.V_ID
group by B_Q_ID)t,utQ
where B_Q_ID=Q_ID and R!=255 and R=G and G=B
