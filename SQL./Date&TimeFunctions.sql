SELECT * from customer;

SELECT * from product;

SELECT * from sales;

/* CURRENT DATE & TIME */

SELECT CURRENT_DATE, CURRENT_TIME(1), CURRENT_TIME(3), CURRENT_TIMESTAMP;


/* AGE */

SELECT AGE('2002-08-24','2025-08-24');

SELECT order_line, ship_date, order_date,
AGE(ship_date, order_date) as time_taken
from sales
ORDER BY time_taken desc;


/* EXTRACT */

SELECT EXTRACT(day from CURRENT_DATE);

SELECT CURRENT_TIMESTAMP, EXTRACT(hour from CURRENT_TIMESTAMP);

SELECT EXTRACT(day from '2014-04-24');

SELECT EXTRACT(day from '2014-04-24 08:44:21');

SELECT EXTRACT(minute from '08:44:21');

SELECT order_date, ship_date,
EXTRACT(epoch from(ship_date-order_date))
from sales;-----error 

SELECT order_date, ship_date,
(EXTRACT(epoch from ship_date)- EXTRACT(epoch from order_date)) as sec_taken
from sales;