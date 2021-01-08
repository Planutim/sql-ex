select count(*) from (select town_from, town_to, count(*) p from trip
group by town_from,town_to
having count(*)>=all(select count(*) from trip group by town_from, town_to))t

