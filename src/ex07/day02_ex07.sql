SELECT pizzeria.name AS pizzeria_name
FROM person
INNER JOIN person_visits
ON person.id = person_visits.person_id
INNER JOIN pizzeria
ON person_visits.pizzeria_id = pizzeria.id
INNER JOIN menu
ON pizzeria.id = menu.pizzeria_id AND menu.price < 800
WHERE person.name = 'Dmitriy'
AND person_visits.visit_date = '2022-01-08'