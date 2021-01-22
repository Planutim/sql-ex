select max(B_DATETIME) from utB
group by datepart(year,B_DATETIME),datepart(month,B_DATETIME),datepart(day,B_DATETIME),
datepart(hour,B_DATETIME)

