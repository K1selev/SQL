(SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
    JOIN menu
    ON pizzeria.id = menu.pizzeria_id
    JOIN person_order
    ON menu.id = person_order.menu_id
    JOIN person
    ON person_order.person_id = person.id
    WHERE gender = 'female' 
    EXCEPT
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
    JOIN menu
    ON pizzeria.id = menu.pizzeria_id
    JOIN person_order
    ON menu.id = person_order.menu_id
    JOIN person
    ON person_order.person_id = person.id
    WHERE gender = 'male')
UNION
(SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
    JOIN menu
    ON pizzeria.id = menu.pizzeria_id
    JOIN person_order
    ON menu.id = person_order.menu_id
    JOIN person
    ON person_order.person_id = person.id
    WHERE gender = 'male' EXCEPT
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
    JOIN menu
    ON pizzeria.id = menu.pizzeria_id
    JOIN person_order
    ON menu.id = person_order.menu_id
    JOIN person
    ON person_order.person_id = person.id
    WHERE gender = 'female')
ORDER BY 1;