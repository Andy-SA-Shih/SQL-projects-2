-- Q1: Analyze customer purchase behavior, such as 
-- Q1-1: identifying top customers by total spending
-- Tables to use: customers, invoice_items, invoices
SELECT customers.CustomerId, customers.FirstName || ' ' || customers.LastName AS Full_name, ROUND(SUM(invoices.Total), 3) AS Total_spending
FROM customers
JOIN invoices
ON customers.CustomerId == invoices.CustomerId
JOIN invoice_items
ON invoice_items.InvoiceId == invoices.InvoiceId
GROUP BY customers.CustomerId
ORDER BY Total_spending DESC
LIMIT 10;

-- To inspect the joint table
/*SELECT customers.CustomerId, customers.FirstName || ' ' || customers.LastName AS Full_name, invoices.Total
FROM customers
JOIN invoices
ON customers.CustomerId == invoices.CustomerId
JOIN invoice_items
ON invoice_items.InvoiceId == invoices.InvoiceId;*/

-- Q1-2: identifying top customers by average spending per invoice
SELECT customers.CustomerId, customers.FirstName || ' ' || customers.LastName AS Full_name, ROUND(AVG(invoices.Total), 3) AS Avg_spending_perInvoice
FROM customers
JOIN invoices
ON customers.CustomerId == invoices.CustomerId
JOIN invoice_items
ON invoice_items.InvoiceId == invoices.InvoiceId
GROUP BY customers.CustomerId
ORDER BY Avg_spending_perInvoice DESC
LIMIT 10;

-- Q1-3: identifying top customers by the frequency of purchases
SELECT customers.CustomerId, customers.FirstName || ' ' || customers.LastName AS Full_name, COUNT(invoices.InvoiceId) AS Purchase_frequency
FROM customers
JOIN invoices
ON customers.CustomerId == invoices.CustomerId
JOIN invoice_items
ON invoice_items.InvoiceId == invoices.InvoiceId
GROUP BY customers.CustomerId
ORDER BY Purchase_frequency DESC
LIMIT 10;