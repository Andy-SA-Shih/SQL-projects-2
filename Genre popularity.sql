-- Q2: Identify which genres contribute the most to overall revenue
-- Table to use: genres, tracks, invoices, invoice_items

SELECT genres.GenreId, genres.Name, ROUND(SUM(invoices.Total), 3) AS Total_invoice_value
FROM genres
JOIN tracks
ON genres.GenreId == tracks.GenreId
JOIN invoice_items
ON tracks.TrackId == invoice_items.TrackId
JOIN invoices
ON invoice_items.InvoiceId == invoices.InvoiceId
GROUP BY genres.GenreId
ORDER BY Total_invoice_value DESC
LIMIT 10;