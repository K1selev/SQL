SELECT person.name AS person_name, menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM person_visits
JOIN person
ON person_visits.person_id = person.id
JOIN pizzeria
ON person_visits.pizzeria_id = pizzeria.id
JOIN person_order
ON person.id = person_order.person_id
JOIN menu
ON menu.id = person_order.menu_id
ORDER BY person_name, pizza_name, pizzeria_name;