-- Active: 1692226791200@@127.0.0.1@5433@painting
SELECT * from artist;
SELECT * from canvas_size;
SELECT * from image_link;
SELECT * from museum_hours;
SELECT * from museum;
SELECT * from product_size;
SELECT * from subject;
SELECT * from work;


SELECT table_name
FROM INFORMATION_SCHEMA.tables
where table_schema = 'public';



