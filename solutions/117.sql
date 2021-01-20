with t as (select country,max(coalesce(numGuns,0))*5000 max_val, 'numGuns' name from classes
group by country
union all
select country,max(coalesce(bore,0))*3000,'bore' from classes group by country
union all
select country,max(coalesce(displacement,0)), 'displacement' from classes group by country
)


select * from t b where  max_val>=all(select max_val from t where country=b.country)

