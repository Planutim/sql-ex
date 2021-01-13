select B_Q_ID from (select B_Q_ID from utB
group by B_Q_ID
having sum(B_VOL)=255*3)t
where not exists
(select B_V_ID from utB where B_Q_ID=t.B_Q_ID
except
select B_V_ID from utB group by
B_V_ID
having sum(B_VOL)=255
)

