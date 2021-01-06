with t as(select i.point, i.date,inc, out from income_o i left join outcome_o o on i.point=o.point and
i.date=o.date
union
select o.point,o.date, inc, out from income_o i right join outcome_o o on i.point=o.point
and i.date=o.date)
select point,sum(coalesce(inc,0))-sum(coalesce(out,0)) as remainder from t
group by point
