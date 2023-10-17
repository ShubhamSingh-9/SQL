-- Using Subqueries with SELECT 
-- Get the percenatge of votes for each movie comapred to the total number of votes

USE subqueries;
SELECT name, (votes/(SELECT SUM(votes) FROM movies))*100 FROM movies;


-- Disolay all movie anmes,genre,score and avg(score)
SELECT name,genre,score,(SELECT AVG(score) AS 'AVG_score' FROM movies m2
WHERE m2.genre=m1.genre) 
FROM movies m1