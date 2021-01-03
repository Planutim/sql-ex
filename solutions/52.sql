select ships.name from ships left join classes on ships.class=classes.class where COALESCE(classes.country,'Japan')='Japan' and COALESCE(classes.type,'bb')='bb' and numGuns>=9 and classes.displacement<=65000 and bore<19

