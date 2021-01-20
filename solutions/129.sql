select min(gapmin)q_min, max(gapmax)q_max
from (select Q_ID, 
case when
Q_ID-coalesce((select max(Q_ID) from utQ where Q_ID<u1.Q_ID),0)>1
then coalesce((select max(Q_ID) from utQ where Q_ID<u1.Q_ID),0)+1
else -1 end gapmin,
case when
Q_ID-coalesce((select max(Q_ID) from utQ where Q_ID<u1.Q_ID),0)>1
then Q_ID-1
else -1 end gapmax
from utQ u1
)z where gapmin!=-1 and gapmax!=-1

