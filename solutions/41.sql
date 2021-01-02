with all_prices as (select model, price from pc 
UNION ALL
select model, price from laptop
union ALL
select model, price from printer)
select maker, case when min(case when price is null then 0 else 1 end)=0 then null else max(price) end testo from product join all_prices on product.model=all_prices.model group by maker

