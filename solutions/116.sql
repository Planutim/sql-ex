with t as (select *,dense_rank() over(order by b_datetime asc)rowNum from utB),
tt as (select b_datetime,dateadd(second,-rowNum,b_datetime)rn from t)
select min(b_datetime)date_begin,max(b_datetime)date_finish from tt
group by rn
having count(distinct b_datetime)>1

