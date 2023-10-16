-- Q5: Explore the popularity of playlists by analyzing 
-- the relationship btw playlists and tracks is many-to-many

-- the number of tracks
SELECT playlists.PlaylistId, playlists.Name, COUNT(playlist_track.TrackId) AS 'Number of tracks'
FROM playlists
JOIN playlist_track
ON playlists.PlaylistId == playlist_track.PlaylistId
GROUP BY playlists.PlaylistId
ORDER BY COUNT(playlist_track.TrackId) DESC;

-- average duration of the tracks
-- I will turn milliseconds to seconds (1000:1)
SELECT playlists.PlaylistId, playlists.Name, ROUND(AVG((tracks.Milliseconds) / 1000), 3) AS Average_duration
FROM playlists
JOIN playlist_track
ON playlists.PlaylistId == playlist_track.PlaylistId
JOIN tracks
ON tracks.TrackId == playlist_track.TrackId
GROUP BY playlists.PlaylistId
ORDER BY Average_duration DESC;

