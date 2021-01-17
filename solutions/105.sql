select maker, model, row_number() over(order by maker asc, model asc)A,
dense_rank() over(order by maker asc)B, 
rank() over(order by maker asc)C,
count(*) over(partition by maker order by maker asc)+rank() over(order by maker asc)-1 D
from product

