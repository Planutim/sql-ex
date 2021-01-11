with t as (select code,price, row_number() over (order by code asc) rowNum from pc)
select code,
(select avg(price) from t where rowNum between t1.rowNum and t1.rowNum+5)
 from t t1 where rowNum+6-1<=(select max(rowNum) from t)

