/*
 * Compute the country with the most customers in it. 
 */

SELECT COUNTRY
FROM CUSTOMER
INNER JOIN ADDRESS
USING (ADDRESS_ID)
INNER JOIN CITY
USING (CITY_ID)
INNER JOIN COUNTRY
USING (COUNTRY_ID)
GROUP BY COUNTRY
ORDER BY COUNT(*) DESC
LIMIT 1
