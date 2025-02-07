/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */


WITH PREVIOUS AS
(
SELECT ACTOR_ID
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
)



SELECT (FIRST_NAME || ' ' || LAST_NAME) AS "Actor Name"
FROM FILM_ACTOR
INNER JOIN ACTOR
USING (ACTOR_ID)
WHERE FILM_ID IN
(
SELECT FILM_ID
FROM FILM_ACTOR
INNER JOIN ACTOR
USING (ACTOR_ID)
WHERE ACTOR_ID
IN
(
SELECT *
FROM
PREVIOUS 
)
)
AND  ACTOR_ID NOT IN (
    SELECT *
    FROM PREVIOUS
)

GROUP BY "Actor Name"
ORDER BY "Actor Name"
