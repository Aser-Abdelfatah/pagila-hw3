/*
 * This question and the next one are inspired by the Bacon Number:
 *
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */
SELECT (FIRST_NAME || ' ' || LAST_NAME) AS "Actor Name"
FROM FILM_ACTOR
INNER JOIN ACTOR
USING (ACTOR_ID)
WHERE FILM_ID
IN 
(
SELECT FILM_ID
FROM  FILM_ACTOR
INNER JOIN ACTOR
USING (ACTOR_ID)
WHERE  FIRST_NAME ILIKE 'RUSSELL' AND LAST_NAME ILIKE 'BACALL'
)
AND NOT (FIRST_NAME ILIKE 'RUSSELL' AND LAST_NAME ILIKE 'BACALL')

GROUP BY "Actor Name"
ORDER BY "Actor Name"
