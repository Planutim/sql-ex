with all_town(town_from) as (select town_from from trip union all select town_to from trip),
cte as (select town_from,0 as step,-1 as counter,-1 as last from 
(select town_from from all_town group by town_from,datalength(town_from))z
union all
select town_from,
step+1,
case when town_from like replicate('%a%',step+1) then 1 else 0 end +
case when town_from like replicate('%e%',step+1) then 1 else 0 end +
case when town_from like replicate('%i%', step+1) then 1 else 0 end +
case when town_from like replicate('%o%', step+1) then 1 else 0 end +
case when town_from like replicate('%u%',step+1) then 1 else 0 end,
counter from cte
where counter>=last and counter!=0
)
select town_from from cte
where counter=0
and last>=2

