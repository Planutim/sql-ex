select ship from outcomes where ship like '% % %'
UNION
select name from ships where name like '% % %'

