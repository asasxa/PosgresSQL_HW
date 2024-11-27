-- Запросы (задание 2)
SELECT title, duration 
FROM tracks 
WHERE duration = (SELECT MAX(duration) FROM tracks); 

SELECT title 
FROM tracks 
WHERE duration >= '00:03:30'

SELECT title 
FROM collection
WHERE release_date BETWEEN '2018-01-01' AND '2020-12-31'; 

SELECT name 
FROM performers  
WHERE LENGTH(name) - LENGTH(REPLACE(name, ' ', '')) = 0;

SELECT title 
FROM tracks 
WHERE title LIKE '%мой%' OR title LIKE '%my%'; 

-- Запросы (задание 3)
SELECT 
    g.name AS genre_name, 
    COUNT(pg.performer_id) AS performer_count
FROM 
    genres g
LEFT JOIN 
    performers_genres pg ON g.id = pg.genre_id
LEFT JOIN 
    performers p ON pg.performer_id = p.id
GROUP BY 
    g.id
ORDER BY 
    genre_name;
    
SELECT 
    a.title AS album_title, 
    COUNT(t.id) AS track_count
FROM 
    albums a
LEFT JOIN 
    tracks t ON a.id = t.album_id
WHERE 
    a.release_date BETWEEN '2019-01-01' AND '2020-12-31'
GROUP BY 
    a.id, a.title
ORDER BY 
    a.release_date;  
   
SELECT 
    a.title AS album_title,
    AVG(EXTRACT(EPOCH FROM t.duration)) AS average_duration 
FROM 
    albums a
LEFT JOIN 
    tracks t ON a.id = t.album_id
GROUP BY 
    a.id, a.title
ORDER BY 
    a.title;   
   
SELECT DISTINCT p.name 
FROM performers p
WHERE p.id NOT IN (
    SELECT ap.performer_id 
    FROM albums_performers ap
    JOIN albums a ON ap.album_id = a.id
    WHERE a.release_date BETWEEN '2020-01-01' AND '2020-12-31'
);

SELECT DISTINCT c.title 
FROM collection c
JOIN collection_tracks ct ON c.id = ct.collection_id
JOIN tracks t ON ct.track_id = t.id
JOIN albums_performers ap ON t.album_id = ap.album_id
JOIN performers p ON ap.performer_id = p.id
WHERE p.name = 'Ария';

-- задание 4
SELECT DISTINCT a.title 
FROM albums a
JOIN albums_performers ap ON a.id = ap.album_id
JOIN performers p ON ap.performer_id = p.id
JOIN performers_genres pg ON p.id = pg.performer_id
GROUP BY a.id, a.title
HAVING COUNT(DISTINCT pg.genre_id) > 1;

SELECT t.title 
FROM tracks t
LEFT JOIN collection_tracks ct ON t.id = ct.track_id
WHERE ct.track_id IS NULL;

SELECT p.name 
FROM performers p
JOIN albums_performers ap ON p.id = ap.performer_id
JOIN tracks t ON ap.album_id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

SELECT a.title, COUNT(t.title) AS track_count 
FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY a.id
HAVING COUNT(t.title) = (  
    SELECT COUNT(t.title) 
    FROM albums a
    JOIN tracks t ON a.id = t.album_id
    GROUP BY a.id
    ORDER BY COUNT(t.title)
    LIMIT 1
);
-- еще один вариант решения последнего запроса 
WITH album_track_counts AS (
    SELECT a.id, a.title, COUNT(t.id) AS track_count
    FROM albums a
    JOIN tracks t ON a.id = t.album_id
    GROUP BY a.id, a.title
)
SELECT title
FROM album_track_counts
WHERE track_count = (SELECT MIN(track_count) FROM album_track_counts);