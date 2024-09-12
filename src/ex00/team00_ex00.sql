CREATE TABLE graph
  (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
      cost INTEGER NOT NULL
  );

INSERT INTO graph(point1, point2, cost)
VALUES ('a', 'b', 10),
       ('b', 'a', 10),
       ('a', 'c', 15),
       ('c', 'a', 15),
       ('a', 'd', 20),

       ('b', 'd', 25),
       ('d', 'b', 25),
       ('b', 'c', 35),
       ('c', 'b', 35),

       ('c', 'd', 30),
       ('d', 'c', 30);
	   
WITH RECURSIVE
    route AS (SELECT ARRAY [point1] AS passed_points, 
                     point2 AS end_point, 
                     2 AS count,
                     cost AS total_cost
                FROM graph
			         WHERE point1 = 'a'
			       UNION
			        SELECT array_append(passed_points, end_point) AS passed_points, 
                     point2 AS end_point, 
                     count + 1 AS count,
                     total_cost + cost AS total_cost
			          FROM route
			              JOIN graph
			              ON end_point = graph.point1
			         WHERE count < 5
			           AND passed_points @> ARRAY [end_point] = FALSE),
    toures AS (SELECT total_cost, 
                      array_append(passed_points, end_point) AS tour
			           FROM route
			          WHERE count = 5 
                  AND end_point = 'a')
SELECT *
  FROM toures
 WHERE total_cost = (SELECT min(total_cost) 
                       FROM toures)
 ORDER BY total_cost, tour;