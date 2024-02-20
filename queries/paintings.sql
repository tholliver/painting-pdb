-- Active: 1692226791200@@127.0.0.1@5433@painting
-- Fetch all the paintings which are not displayed on any museums?
SELECT name AS painting_name
FROM work
WHERE museum_id ISNULL;

-- Are there museums without any paintings?
SELECT count(1) as museum_withno_paints
FROM museum 
WHERE museum_id NOT IN (SELECT DISTINCT museum_id FROM work 
WHERE museum_id IS NOT NULL)

-- How many paintings have an asking price of more than their regular price?
SELECT count(1) 
FROM work w INNER JOIN product_size ps ON w.work_id = ps.work_id
WHERE ps.sale_price > ps.regular_price;

-- Identify the paintings whose asking price is less than 50% of its regular price
SELECT regular_price
FROM product_size
WHERE sale_price = ROUND(regular_price/2);

-- Which canva size costs the most? [X]

SELECT cs.width,  MAX(ps.sale_price)
FROM product_size ps, canvas_size cs AND
cs.size_id = ps.size_id

select  name, artist_id, style, museum_id, count(1)
from work
GROUP BY name, artist_id, style, museum_id
HAVING  count(1) > 1
