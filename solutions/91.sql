select coalesce(cast(sum(B_VOL)*1.0/(select count(*) from utQ) as numeric(5,2)),0) from utB

