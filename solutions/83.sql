select name from ships join classes on classes.class=ships.class
where 
case when numGuns=8 then 1 else 0 end
+
case when bore=15 then 1 else 0 end
+
case when displacement=32000 then 1 else 0 end
+
case when type='bb' then 1 else 0 end
+
case when launched=1915 then 1 else 0 end
+
case when classes.class='Kongo' then 1 else 0 end
+
case when country='USA' then 1 else 0 end
>=4
