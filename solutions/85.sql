select maker from product
group by maker
having count(distinct type)=1
and (max(type)='Printer'
or
max(type)='PC' 
and count(distinct model)>=3)
