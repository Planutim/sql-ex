select coalesce((select sum(inc) from income_o where date<'2001-04-15'),0)-
coalesce((select sum(out) from outcome_o where date<'2001-04-15'),0)

