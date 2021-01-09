select country, class from classes where country=all(select country from classes where country='Russia')

