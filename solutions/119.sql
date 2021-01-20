select period,sum(B_VOL) from (select cast(datepart(year,b_datetime) as varchar(255)) period, B_VOL,b_datetime from utB
union ALL
select concat(datepart(year,b_datetime),
case when datepart(month,b_datetime)<10 then '-0'
else '-' end,
datepart(month,b_datetime)),B_VOL,b_datetime from utB
union ALL
select cast(cast(b_datetime as date) as varchar(255)),B_VOL,b_datetime from utB
)z
group by period
having count(distinct b_datetime)>10

