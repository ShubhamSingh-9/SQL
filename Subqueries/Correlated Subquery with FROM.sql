-- Display average rating of all he resturant

USE zomato;
SELECT r_name,avg_rat
FROM (SELECT r_id,AVG(restaurant_rating) AS 'avg_rat' FROM orders
       GROUP BY r_id) t1 JOIN restaurants t2
       ON t1.r_id=t2.r_id;
       

               
          
       

             