SELECT person.name
FROM person
JOIN(SELECT person_order.person_id
     FROM person_order
     JOIN menu
     ON person_order.menu_id = menu.id
     WHERE menu.pizza_name IN ('pepperoni pizza', 'cheese pizza')
     GROUP BY person_order.person_id
     HAVING COUNT(DISTINCT menu.pizza_name) = 2) AS p
ON p.person_id = person.id
WHERE person.gender = 'female'
ORDER BY 1;
