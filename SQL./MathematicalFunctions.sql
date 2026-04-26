SELECT * from customer;

SELECT * from product;

SELECT * from sales;

/* CEIL & FLOOR */

SELECT order_line, sales,
CEIL(sales),
FLOOR(sales)
from sales;


/* RANDOM */
/* a=10 b=50 */

SELECT RANDOM(), RANDOM()*40+10 , FLOOR(RANDOM()*40)+10;


/* SETSEED */

SELECT SETSEED(0.5);

SELECT RANDOM();----0.98
SELECT RANDOM();----0.82

SELECT SETSEED(0.5);

SELECT RANDOM();----0.98
SELECT RANDOM();----0.82


/* ROUND */

SELECT order_line, sales, 
ROUND(sales)
from sales
ORDER BY sales desc;


/* POWER */

SELECT POWER(age,2), age from customer;