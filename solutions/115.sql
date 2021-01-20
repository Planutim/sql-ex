select distinct b Up, d Down,a Side,
cast(sqrt((c*c-(d-b)/2*(d-b)/2))/2 as decimal(20,2))
 from (select convert(bigint,a.b_vol) a,convert(bigint,b.b_vol) b,convert(bigint,c.b_vol) c,convert(bigint,d.b_vol) d from utB a, utB b, utB c,utB d)t
where a=c and b<d
and a+c=b+d
