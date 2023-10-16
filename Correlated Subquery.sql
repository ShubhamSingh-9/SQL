USE subqueries;
WITH top AS (SELECT star,director,MAX(gross) FROM movies
     		GROUP BY star,director
	    	ORDER BY  SUM(gross) DESC LIMIT 5 
)
SELECT * FROM movies
WHERE (star, director,gross) IN (SELECT * FROM top);

SELECT * FROM movies m1
HAVING score>( SELECT AVG(score) FROM movies m2 WHERE m1.genre=m2.genre) 