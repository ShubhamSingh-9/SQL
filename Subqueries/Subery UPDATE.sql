-- Subquey useing UPDATE
-- Populate money col of loyal_customer table using the orders table. Provide a 10% app money to all customers based on their order value.

UPDATE loyal_customers
SET money = (SELECT SUM(amount) FROM orders WHERE loyal_customers.user_id=orders.user_id)
