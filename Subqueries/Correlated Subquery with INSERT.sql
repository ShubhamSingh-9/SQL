-- Subquerie suisng INSERT
-- Populate a already created loyal_customer tabel with records of only those customers who have orderd more than 3 times.

USE zomato;
INSERT INTO loyal_customers
(user_id,name)
SELECT t1.user_id,name 
FROM orders t1
JOIN users t2 
ON t1.user_id=t2.user_id
GROUP BY user_id
HAVING COUNT(*) > 3


               
          
       

             