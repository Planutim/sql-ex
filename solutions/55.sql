select classes.class,min(launched) from classes left join ships on ships.class=classes.class
group by classes.class

