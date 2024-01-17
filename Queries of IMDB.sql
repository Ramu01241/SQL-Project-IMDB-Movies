									-- IMDB Movies Query

-- 1)	Can you get all data about movies?
SELECT * FROM project.movies;

-- 2)	How do you get all data about directors?
SELECT * FROM project.directors;

-- 3)	Check how many movies are present in IMDB?
SELECT DISTINCT count(title) AS Total_Movies_In_IMDB FROM project.movies;

-- 4)	Find these 3 directors: James Cameron ; Luc Besson ; John Woo
SELECT * FROM project.directors
WHERE name IN ('James Cameron','Luc Besson','John Woo');

-- 5)	Find all directors with name starting with Steven.
SELECT * FROM project.directors
WHERE name LIKE 'steven%';

-- 6)	Count female directors.
SELECT count(gender) AS Total_Female_Directors FROM project.directors
WHERE gender = 0 OR gender = 1;

-- 7)	Find the name of the 10th first women directors?
SELECT Name FROM project.directors
WHERE gender = 0 OR gender = 1
ORDER BY name
LIMIT 1 OFFSET 9;

-- 8)	What are the 3 most popular movies?
SELECT title AS Most_Popular_Movie 
FROM project.movies
ORDER BY popularity DESC
LIMIT 3;

-- 9)	What are the 3 most bankable movies?
SELECT title AS Most_Bankable_Movie FROM project.movies
ORDER BY revenue DESC
LIMIT 3;

-- 10)	What is the most awarded average vote since the January 1st, 2000?
SELECT director_id as id,directors.name,title,vote_average AS Most_Awarded_Movies ,release_date 
FROM project.movies
JOIN project.directors ON directors.id = movies.director_id
WHERE release_date >= '01-01-2000'
ORDER BY vote_average DESC
LIMIT 3;

-- 11)	Which movie were directed by Brenda Chapman?
SELECT * FROM project.directors
LEFT JOIN project.movies
ON directors.id = movies.director_id
WHERE name = 'Brenda Chapman';

-- 12)	Whose director made the most movies?
SELECT director_id, name AS Director_Name, COUNT(director_id) AS Movies_count
FROM project.movies
JOIN project.directors ON movies.director_id = directors.id
GROUP BY director_id
ORDER BY Movies_count DESC
LIMIT 3;

-- 13)	Whose director is the most bankable?
SELECT director_id, name, title, revenue FROM project.directors
INNER JOIN project.movies
ON directors.id = movies.director_id
ORDER BY revenue DESC
LIMIT 1
											-- END