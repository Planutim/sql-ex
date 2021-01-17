with t as (select b_datetime,b_q_id,b_v_id,b_vol, row_number() over (order by b_datetime,b_q_id,b_v_id asc)rowNum from utB)
select b_datetime,b_q_id,b_v_id,b_vol,convert(decimal(20,8),round(exp(sum(log(b_vol)*
case when rowNum%2=1 then 1 else -1 end
) over(order by b_datetime,b_q_id,b_v_id asc rows
unbounded preceding)),8))tt from t

