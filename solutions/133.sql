select c.ID_comp top_id, t.* from company c
cross apply
(select concat(
(select 
string_agg(ID_comp,'') within group(order by ID_comp asc)
as rezz
from company where ID_comp<c.ID_comp),
(select c.ID_comp),
(select
string_agg(ID_comp,'') within group(order by ID_comp desc)
as rezz
from company where ID_comp<c.ID_comp)
)hill)t

