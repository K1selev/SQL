SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM menu
JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id
JOIN person_visits
ON pizzeria.id = person_visits.pizzeria_id
JOIN person
ON person_visits.person_id = person.id
WHERE person.name = 'Kate'
AND (price >= 800 AND price <= 1000)
ORDER BY 1, 2, 3;