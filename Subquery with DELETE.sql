-- SUbquery using DELETE
-- DELETE all the customers record who have never ordered 

USE zomato;


DELETE FROM users
WHERE user_id IN(SELECT user_id from users
where user_id NOT IN (SELECT DISTINCT(user_id) FROM orders))