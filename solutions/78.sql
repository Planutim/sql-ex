select name,
datefromparts(year(date),month(date),1) as firstDay,
dateadd(day, -1, dateadd(month,1,datefromparts(year(date),month(date),1))) as lastDay
from battles

