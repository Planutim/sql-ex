select maker, string_agg(type, '/') from (select distinct maker, type from product)t
group by maker

