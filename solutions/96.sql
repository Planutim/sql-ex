with t as (select V_NAME,V_ID from utB join utV on B_V_ID=V_ID
where V_COLOR='R'
group by V_ID
having count(*)>1)
select distinct V_NAME from utB,t where utB.B_V_ID=V_ID
and B_Q_ID in (select B_Q_ID  from utB join utV on B_V_ID=V_ID
group by B_Q_ID
having sum(case when V_COLOR='B' then B_VOL else 0 end)>0)

