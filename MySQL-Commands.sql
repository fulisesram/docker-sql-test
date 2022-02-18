--#3
update sakila.film set title = 'ACADEMY DINOSAUR TEST' where film_id = 1;
update sakila.film set description = 'Description TEST' where film_id = 1;
SELECT * FROM sakila.film;

--#4
SELECT f.title AS MOVIES, CONCAT(a.first_name,' ', a.last_name) AS ACTOR
FROM sakila.film_actor AS fa
INNER JOIN sakila.actor AS a ON fa.actor_id = a.actor_id
INNER JOIN sakila.film AS f ON fa.film_id = f.film_id
ORDER BY MOVIES;

--#5
SELECT CONCAT(a.first_name,' ' ,a.last_name) AS ACTOR_NAME , COUNT(fa.film_id) AS TOTAL_MOVIES
FROM sakila.film_actor AS fa
INNER JOIN sakila.actor AS a
ON fa.actor_id = a.actor_id
GROUP BY ACTOR_NAME
ORDER BY ACTOR_NAME;

--#6
SELECT la.name, COUNT(f.language_id)
FROM sakila.language AS la
INNER JOIN sakila.film AS f
ON la.language_id = f.language_id
GROUP BY la.name
ORDER BY la.name;

--#7
SELECT AVG(film.replacement_cost) AS REPLACEMENT_COST_AVG 
FROM sakila.film;

--#8
DELIMITER $$
CREATE PROCEDURE ChangeTitle (IN movie_id int, IN set_title varchar(20))
BEGIN 
	UPDATE sakila.film SET title = set_title WHERE film_id = movie_id; 
    SELECT * FROM sakila.film;
END$$

#Pasamos los parametros para el update en el stored procedure
call ChangeTitle('2', 'CAMBIO-titulo-peli2');