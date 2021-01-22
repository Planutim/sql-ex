with t as (select 0 a union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 )

select name,cast(date as date),lday from (select battles.*,dateadd(day,-a,eomonth(date))lday from battles,t
)z
where datepart(dw, lday)=
case when (select @@datefirst)=7 then
6
else 7 end

