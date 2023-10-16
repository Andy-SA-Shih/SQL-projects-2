-- Q3: Analyze which artists have the highest and lowest track sales --
-- Tables to use: artists, albums, invoice_items, tracks
-- The problem is there is no artist info in the tracks table, as each track belongs to only one album, we can link tne track to the album first and link to the artist
-- The reason why I use Quantity instead of InvoiceId or InvoiceLineId is that the qty of each track ordered might not be 1 though it seems it is.
-- Highest sales
SELECT artists.ArtistId, artists.Name, SUM(invoice_items.Quantity) AS Track_sales
FROM artists
JOIN albums
ON artists.ArtistId == albums.ArtistId
JOIN tracks
ON albums.AlbumId == tracks.AlbumId
JOIN invoice_items
ON tracks.TrackId == invoice_items.TrackId
GROUP BY artists.ArtistId -- It does not matter if I group by ID or Name as it is 1-1
ORDER BY Track_sales DESC
LIMIT 20;

-- Lowest sales
SELECT artists.ArtistId, artists.Name, SUM(invoice_items.Quantity) AS Track_sales
FROM artists
JOIN albums
ON artists.ArtistId == albums.ArtistId
JOIN tracks
ON albums.AlbumId == tracks.AlbumId
JOIN invoice_items
ON tracks.TrackId == invoice_items.TrackId
GROUP BY artists.ArtistId -- It does not matter if I group by ID or Name as it is 1-1
ORDER BY Track_sales
LIMIT 20;