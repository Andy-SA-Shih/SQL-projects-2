-- Q6: Analyze sales data over time to identify trends and patterns. 
-- Determine the best and worst performing months or seasons (in terms of both number of invoices and total invoice value)
-- I focus on 2009 first, but the database has records till 2013
-- strftime function is to extract specific elements from a Date column in SQLite studio (It differs in different systems)
SELECT strftime('%Y-%m', invoices.InvoiceDate) AS year_month, 
COUNT(invoices.InvoiceId) AS 'Number of invoices', 
SUM(invoices.Total) AS 'Total invoice value'
FROM invoices
GROUP BY year_month
HAVING strftime('%Y', invoices.InvoiceDate) == '2009'; -- This having clause is to extract only months in 2009
-- I can add an ORDER BY clause to order the table by either number of invoices or total invoice value