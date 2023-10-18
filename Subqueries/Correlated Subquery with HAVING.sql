-- FIND Genres having avg score>avg score of all movies
-- Using having to filter Group by
USE subqueries;
SELECT genre,avg(score) FROM movies
GROUP BY genre
HAVING avg(score)> (SELECT AVG(score) FROM movies) 