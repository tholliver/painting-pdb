-- Active: 1692226791200@@127.0.0.1@5433@painting
SELECT m.museum_id, m.name AS museum_name, m.city
FROM museum_hours mh
JOIN museum m ON m.museum_id = mh.museum_id
WHERE day = 'Sunday'
AND EXISTS (
    SELECT 1 
    FROM museum_hours mh2 
    WHERE mh2.museum_id = mh.museum_id
    AND mh2.day = 'Monday'
)

SELECT 
SELECT museum_id
FROM museum_hours mh2 
where  mh2.day = 'Monday'