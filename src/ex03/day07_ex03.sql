WITH visits_orders AS ((SELECT pizzeria.name AS name, COUNT(*) AS count
                          FROM person_order
                          		JOIN menu
                                ON person_order.menu_id = menu.id
                                JOIN pizzeria
                                ON menu.pizzeria_id = pizzeria.id
                         GROUP BY pizzeria.name
                         ORDER BY count DESC)
UNION
(SELECT pizzeria.name AS name, 
  		COUNT(*) AS count
   FROM person_visits
   		JOIN pizzeria
        ON person_visits.pizzeria_id = pizzeria.id
  GROUP BY pizzeria.name
  ORDER BY count DESC))
SELECT name, 
	   SUM(count) AS total_count
  FROM visits_orders
 GROUP BY name
 ORDER BY total_count DESC, name