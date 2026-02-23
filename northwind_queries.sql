/* 
Name: Pham Thuy Huyen
IRN: 2132309006
Date: 6/2/2026 */

-- Dataset using: northwind

/* Question 1 — Simple SQL (Single Table)
Show all products that cost more than $20
Expected skills: SELECT, WHERE */

SELECT * FROM products
WHERE unit_price > 20;

/* Question 2 — JOIN Two Tables
Display the Order ID, Customer Company Name, and Order Date
You must join:
•	orders
•	customers
Expected skills: INNER JOIN, foreign keys */
SELECT order_id, company_name, order_date
FROM orders
INNER JOIN customers USING (customer_id);

--Q3: Top 3 most customer brought
SELECT 
    customer_id, 
    COUNT(order_id) AS num_bought
FROM orders
GROUP BY customer_id
ORDER BY num_bought DESC -- ASC it nhat
LIMIT 3;


