with t(num) as (select  5*(b-1)+a from (select 1 a union all select 2 union all select 3 union all select  4
union all select 5)pp  
cross join
(select 1 b union all select 2 union all select 3 union all select 4 union all select 5)tt)

select class, format(num, 'bc-#') as num from classes,t where numGuns is not null and type='bc'
and num<=numGuns

