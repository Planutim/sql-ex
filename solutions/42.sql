select battles.name from battles where datepart(yy,battles.date) not in (select distinct case when launched is null then -100 else launched end launched from ships)

