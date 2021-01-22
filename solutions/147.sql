select  row_number() over(order by (
select count(*) from product where maker=prod.maker
) desc, maker asc, model asc)no,maker,model from product prod

