select point,
(select max(date) from income where date<min_date)date1,
min_date mi, max_date ma,
(select min(date) from income where date>max_date)date2
 from
(select point,min(date)min_date, max(date)max_date from Income
group by point
)z

