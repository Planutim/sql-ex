with t as (select datefromparts(year(date),month(date),1) date, out from outcome)
select * from outcome where datefromparts(year(date),month(date),1) in
(select date from t 
group by date
having sum(out)>=all(select sum(out) from t group by date))

