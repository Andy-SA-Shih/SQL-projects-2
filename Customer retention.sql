-- Q7: Explore customer retention by analyzing "how frequently" customers make repeat purchases. 
-- Identify strategies to improve customer loyalty.
-- Table to use: invoices, customers
-- I focus on the year of 2009 to see how many customers make repeat purchases in that year, so I extract all the invoices record in 2009 first
WITH temp AS (
SELECT * FROM invoices
WHERE strftime('%Y', invoices.InvoiceDate) == '2009')

SELECT customers.CustomerId, (customers.FirstName || ' ' || customers.LastName) AS Full_name, COUNT(temp.InvoiceId) AS 'Number of purchase'
FROM customers
JOIN temp
ON customers.CustomerId == temp.CustomerId
GROUP BY customers.CustomerId
ORDER BY COUNT(temp.InvoiceId) DESC
LIMIT 10;