USE task;

/*Q-1 Find out top 10 countries' which have maximum A and D values.*/
SELECT t1.Country,A,D FROM (SELECT Country, A FROM country_ab
ORDER BY A DESC LIMIT 10) t1
LEFT JOIN 
(SELECT Country,D FROM country_cd
ORDER BY D DESC LIMIT 10) t2
ON t1.Country=t2.Country
UNION
SELECT t2.Country,A,D FROM (SELECT Country, A FROM country_ab) t1
RIGHT JOIN 
(SELECT Country,D FROM country_cd) t2
ON t1.Country=t2.Country;

/* Q-2 Find out highest CL value for 2020 for every region. Also sort the result in descending order. Also display the CL values 
in descending order.*/
SELECT Region,MAX(CL) FROM country_cl t1
JOIN country_ab t2
ON t1.country=t2.country
WHERE t1.Edition=2020
GROUP BY Region
ORDER BY MAX(CL) DESC;

/* Q-3 Find top-5 most sold products. */
SELECT Name,SUM(Quantity) AS 'total_qty' FROM products t1
JOIN sales1 t2
ON t1.ProductID=t2.ProductID
GROUP BY t1.ProductID 
ORDER BY total_qty DESC LIMIT 5;

/* Q-4: Find sales man who sold most no of products. */
SELECT t1.SalesPersonID,FirstName,SUM(Quantity) AS 'total_qty' FROM sales1 t1
JOIN employees t2
ON t1.SalesPersonID=t2.EmployeeID
GROUP BY t1.SalespersonID
ORDER BY total_qty DESC LIMIT 1;

/* Q-5: Sales man name who has most no of unique customer. */
SELECT t1.SalesPersonID,FirstName,COUNT(DISTINCT CUSTOMERID) AS 'unique_custmr' FROM sales1 t1
JOIN employees t2
ON t1.SalesPersonID=t2.EmployeeID
GROUP BY t1.SalespersonID
ORDER BY unique_custmr DESC LIMIT 1

/* Q-6: Sales man who has generated most revenue. Show top 5. */


/* Q-7: List all customers who have made more than 10 purchases. */


/* Q-8 : List all salespeople who have made sales to more than 5 customers. */


/* Q-9: List all pairs of customers who have made purchases with the same salesperson. */
