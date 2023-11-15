USE task;

/*Q-1: Rank Employee in terms of revenue generation. Show employee id, first name, revenue, and rank*/
SELECT t3.EmployeeID, t3.FirstName,(t1.UnitPrice*t1.Quantity) as 'Revenue',
RANK() OVER(ORDER BY Revenue DESC) AS 'RANK'
FROM order_det t1
JOIN orders t2
ON t1.orderID = t2.orderID
JOIN empl t3
ON t3.EmployeeID = t2.EmployeeID
GROUP BY t3.EmployeeID,t3.FirstName
ORDER BY RANK;

/*Q-2: Show All products cumulative sum of units sold each month.*/
SELECT t3.ProductID,month(t1.OrderDate) 'Month',sum(t2.Quantity) FROM orders t1
JOIN order_det t2
ON t1.OrderID=t2.OrderID
JOIN prod t3
ON t3.ProductID = t2.ProductID

