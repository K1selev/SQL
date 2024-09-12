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
    OR total_cost = (SELECT max(total_cost) 
			  FROM toures)
 ORDER BY total_cost, tour;