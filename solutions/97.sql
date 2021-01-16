select code,speed,ram,price,screen from laptop l1 where exists
(select * from (select [1]one,[2]two,[3]three,[4]four from (select value,row_number() over(order by value asc)rowNum from
(select code,cast(speed as float)speed,cast(ram as float)ram,cast(price as float)price,cast(screen as float)screen from laptop)t
unpivot( value
for name in ([speed],[ram],[price],[screen]))unpvt
where code=l1.code)unpivoted
pivot
(max(value) for rowNum in ([1],[2],[3],[4]))pvt)alias
where one*2<=two and two*2<=three and three*2<=four
)

