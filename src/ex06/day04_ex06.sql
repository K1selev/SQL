CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats
AS
SELECT pz.name AS pizzeria_name
FROM person
INNER JOIN person_visits
ON person.id = person_visits.person_id
INNER JOIN pizzeria pz
ON person_visits.pizzeria_id = pz.id
INNER JOIN menu
ON pz.id = menu.pizzeria_id AND menu.price < 800
WHERE person.name = 'Dmitriy'
AND person_visits.visit_date = '2022-01-08'::date;