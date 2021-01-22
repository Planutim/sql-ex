select chr,value from (select 
cast(model as varchar(255))model,
cast(speed as varchar(255))speed,
cast(ram as varchar(255))ram,
cast(hd as varchar(255))hd,
cast(cd as varchar(255))cd,
coalesce(cast(price as varchar(255)),'')price
from PC where code>=all(select code from pc))z
unpivot(
value
for chr in ([model],[speed],[ram],[hd],[cd],[price])
)unpvt

