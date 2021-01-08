select case when town_from>town_to then town_from else town_to end tf,
case when town_from<town_to then town_from else town_to end tt, count(*) num from trip
group by town_from, town_to

