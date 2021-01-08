select point,date, 'inc' as operation, sum(inc) from income a where exists
(select * from (select point,date from income
except
select point,date from outcome)t where a.point=point and a.date=date)
group by point,date
union
select point,date, 'out' as operation, sum(out) from outcome a where exists
(select * from (select point,date from outcome
except
select point,date from income)t where a.point=point and a.date=date)
group by point,date

