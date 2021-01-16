with cte as (select point,date, date as date_2 from (select i.point,i.date from income_o i)t
union all
select point,date,dateadd(day,1,date_2) from cte
where datediff(day, date,date_2)<99
and exists(select * from outcome_o o where cte.point=o.point and cte.date_2=o.date)
or datepart(dw,date_2)=case (select @@datefirst) when 7 then 1 else 2 end
)
select * from cte c
where date_2=(select max(date_2) from cte where c.point=point and c.date=date)

