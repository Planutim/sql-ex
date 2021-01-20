select  rn as Id,type, model, price from (select *,row_number() over(order by
case when
ascrn<descrn
then ascrn*10+1
when ascrn>descrn
then descrn*10+6
else 1000000000
end,
case when type='Laptop' then 1
when type='PC' then 2
else 3 end
)rn from (select 'PC' as type, model, price,row_number() over (order by code asc) ascrn,
row_number() over(order by code desc) descrn from pc
union all
select 'Laptop' as type, model, price,row_number() over(order by code asc) ascrn,
row_number() over(order by code desc) descrn from laptop
union all
select 'Printer' as type, model, price,row_number() over(order by code asc)ascrn,
row_number() over(order by code desc) descrn from Printer
)z

)zz

