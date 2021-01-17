select distinct
 a.b_vol as a,b.b_vol as b,c.b_vol as c
from utB a,utB b, utB c
where a.b_vol<b.b_vol and b.b_vol<c.b_vol
and 
convert(int,a.b_vol)*convert(int,a.b_vol)+
convert(int,b.b_vol)*convert(int,b.b_vol)>=
convert(int,c.b_vol)*convert(int,c.b_vol)

