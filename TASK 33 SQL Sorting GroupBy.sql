USE task;

-- Problem 1:
/*The question is:
Find out the average sleep duration of top 15 male candidates who's sleep duration are equal to 7.5 or greater than 7.5.*/
SELECT AVG(`Sleep duration`) FROM sleep
WHERE `Sleep duration` >= 7.5 AND gender='MALE'
ORDER BY `Sleep duration` DESC LIMIT 15