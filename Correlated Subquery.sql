-- Find all the movies that have a rating than the average rating of movies in the same genre.
USE subqueries;
WITH top AS (SELECT star,director,MAX(gross) FROM movies
     		GROUP BY star,director
	    	ORDER BY  SUM(gross) DESC LIMIT 5 
)
SELECT * FROM movies
WHERE (star, director,gross) IN (SELECT * FROM top);

SELECT * FROM movies m1
HAVING score>( SELECT AVG(score) FROM movies m2 WHERE m1.genre=m2.genre)  



-- Find the favorite food of each customer
USE zomato;
WITH fav AS ( SELECT t2.user_id,name,f_name,COUNT(*) AS 'frequency' FROM users t1
JOIN orders t2 ON t1.user_id=t2.user_id
JOIN order_details t3 ON t3.order_id=t2.order_id
JOIN food t4 ON t3.f_id=t4.f_id 
GROUP BY t2.user_id ,t3.f_id)

SELECT * FROM fav f1                                  
WHERE frequency = (SELECT MAX(frequency)
	                FROM fav f2
	                WHERE f1.user_id=f2.user_id)
