SELECT person.address AS address,
       pizzeria.name AS name,
       COUNT(*) AS count_of_orders
  FROM person_order
         INNER JOIN menu 
		 ON menu.id = person_order.menu_id
         INNER JOIN person 
		 ON person.id = person_order.person_id
         INNER JOIN pizzeria 
		 ON pizzeria.id = menu.pizzeria_id
 GROUP BY person.address, pizzeria.name
 ORDER BY address, name;