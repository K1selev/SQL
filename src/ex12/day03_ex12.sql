WITH max_po AS (SELECT max(id) FROM person_order),
     max_p AS (SELECT max(id) FROM person)
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT gs + (SELECT * FROM max_po) AS id, 
	   id AS person_id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza') AS menu_id, 
	   '2022-02-25' AS order_date
FROM person
       JOIN generate_series(1, (SELECT * FROM max_p)) AS gs
       ON person.id = gs;