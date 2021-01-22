with t as (select B_Q_ID,string_agg(B_V_ID,':')V_SET from
(select distinct B_Q_ID, B_V_ID from utB
where B_Q_ID in (select B_Q_ID from utb group by B_Q_ID having sum(B_VOL)>0)
)z
group by B_Q_ID
)

select t1.B_Q_ID,t2.B_Q_ID from t t1,t t2
where t1.B_Q_ID<t2.B_Q_ID and t1.V_SET=t2.V_SET

