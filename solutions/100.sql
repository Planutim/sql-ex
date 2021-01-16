with i as (select *, row_number() over (partition by date order by code)rowNum from income),
o as (select *, row_number() over(partition by date order by code)rowNum from outcome)
select coalesce(i.date,o.date)date,coalesce(i.rowNum,o.rowNum)rowNum,
i.point,inc, o.point,out from i full join o on i.date=o.date and i.rowNum=o.rowNum

