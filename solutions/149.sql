select V_NAME from utV, (select distinct V_ID as B_V_ID from utB,utV where B_DATETIME=(select max(date) from (select min(B_DATETIME)date,B_V_ID from utB
group by B_V_ID
)z
)
and V_ID=B_V_ID
)zz where V_ID=B_V_ID

