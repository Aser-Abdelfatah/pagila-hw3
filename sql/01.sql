/*
 * Compute the number of customers who live outside of the US.
 */

SELECT COUNT(*)
FROM CUSTOMER
INNER JOIN ADDRESS
USING (ADDRESS_ID)
INNER JOIN CITY
USING (CITY_ID)
INNER JOIN COUNTRY
USING (COUNTRY_ID)
WHERE COUNTRY_ID NOT IN (
SELECT COUNTRY_ID
FROM COUNTRY
WHERE COUNTRY ILIKE 'UNITED STATES'
);
