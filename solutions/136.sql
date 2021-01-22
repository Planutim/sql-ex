with t as (select a*4+b-1 id from
(select 0 a union select 1 union select 2 union select 3 union select 4)p
cross join
(select 1 b  union select 2 union select 3 union select 4)z
),
tt as (select a*20+b id from (select id a from t)p
cross join
(select id b from t)z
),
strid as (select * from tt where id>0 and id<256)


select name,min(n)n,substring(name,min(n),1)let
 from (select name,tz.* from ships
cross apply
(select id as n,substring(name,id,1)let
 from strid where id<=len(name))tz
)tzz
where ascii(let)<97 and ascii(let)>90 or ascii(let)>122
or ascii(let)<65
group by name

