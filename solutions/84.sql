with t as (select name,ID_psg,date,
case 
when day(date) between 1 and 10 then 1 
when day(date) between 11 and 20 then 2
else 3
end grp
 from trip a 
join pass_in_trip b on a.trip_no=b.trip_no
join company c on a.ID_comp=c.ID_comp
where year(date)=2003 and month(date)=4)
select name, sum(coalesce([1],0)) as '1-10',
sum(coalesce([2],0)) as '11-20',
sum(coalesce([3],0)) as '21-30' from 
(
select name, [1],[2],[3] from t
pivot
(count(grp) for grp in ([1],[2],[3])
) as p)t
group by name

