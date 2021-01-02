select battles.name from outcomes join ships on ships.name=outcomes.ship join battles on battles.name=outcomes.battle where ships.class='Kongo'

