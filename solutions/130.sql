with t as (select row_number() over(order by date,name)ID,* from battles)

select rn_1, name_1, date_1, rn_2, name_2, date_2 from (
select ID as rn_1, name as name_1, date as date_1, 
lead(ID,num,NULL) over(order by ID) as rn_2,
lead(name,num,NULL) over(order by ID) as name_2,
lead(date, num, NULL) over(order by ID) as date_2,
NTILE(2) over(order by ID) as halves
from t,(select (count(*)+1)/2 num from battles)z
)zz
where halves=1

