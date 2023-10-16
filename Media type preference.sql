-- Q4: Analyze customer preferences for different media types (e.g., MPEG audio, AAC audio) by looking at the sales data. 
-- Identify the most and least preferred media types.
-- Tables to use: media_types, tracks, invoice_items
SELECT media_types.MediaTypeId, media_types.Name, SUM(invoice_items.Quantity) AS Total_sales
FROM media_types
JOIN tracks
ON tracks.MediaTypeId == media_types.MediaTypeId
JOIN invoice_items
ON invoice_items.TrackId == tracks.TrackId
GROUP BY media_types.MediaTypeId
ORDER BY Total_sales DESC;
-- MPEG is the most popular media type
