/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */

SELECT COUNTRY, SUM(AMOUNT) AS total_payments
FROM PAYMENT
INNER JOIN CUSTOMER
USING (CUSTOMER_ID)
INNER JOIN ADDRESS
USING (ADDRESS_ID)
INNER JOIN CITY
USING (CITY_ID)
INNER JOIN COUNTRY
USING (COUNTRY_ID)
GROUP BY COUNTRY
ORDER BY total_payments DESC, COUNTRY
