use netflix_project;

SELECT title, release_year
FROM netflix
WHERE type = 'Movie';

SELECT COUNT(*) AS total_tv_shows
FROM netflix
WHERE type = 'TV Show';

SELECT title, release_year
FROM netflix
WHERE release_year > 2020;

SELECT country, COUNT(*) AS total
FROM netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total DESC
LIMIT 5;

SELECT rating, COUNT(*) AS total
FROM netflix
GROUP BY rating
ORDER BY total DESC;

SELECT title, duration
FROM netflix
WHERE type = 'Movie'
AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 120;

select d.director_name,count(c.title)as total_content
from directors d
join content c
on d.director_name=c.director_name
group by d.director_name
order by total_content desc
limit 10;

select c.title,d.director_name
from content c
left join directors d
on c.director_name=d.director_name;

select * from movies_view limit 10;

select* from netflix_log;

SELECT type, listed_in, COUNT(*) AS total
FROM netflix
GROUP BY type, listed_in
HAVING total = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM netflix nt2
        WHERE nt2.type = netflix.type
        GROUP BY listed_in
    ) AS sub
);




