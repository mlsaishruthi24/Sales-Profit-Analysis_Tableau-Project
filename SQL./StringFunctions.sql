SELECT * from customer;

SELECT * from product;

SELECT * from sales;

/* LENGTH */

SELECT customer_name LENGTH(customer_name) as characters_num
from customer
where age>30;


/* UPPER & LOWER */

SELECT UPPER('Vignana Bharathi Institue of Technology');

SELECT LOWER('Vignana Bharathi Institue of Technology');


/* REPLACE */

SELECT customer_name, country, 
REPLACE (lower(country),'United States','US') as country_new
from customer;


/* TRIM */

SELECT TRIM(leading ' ' from '     Vignana Bharathi Institute of Technology     ');

SELECT TRIM(trailing ' ' from '     Vignana Bharathi Institute of Technology     ');

SELECT TRIM(both ' ' from '     Vignana Bharathi Institute of Technology     ');

SELECT TRIM('     Vignana Bharathi Institute of Technology     ', ' ');

SELECT RTRIM('     Vignana Bharathi Institute of Technology     ', ' ');

SELECT LTRIM('     Vignana Bharathi Institute of Technology     ', ' ');


/* CONCATENATION */

SELECT customer_name, city||','||state||','||country as address
from customer;


/* SIBSTRING */

SELECT customer_id, customer_name, 
SUBSTRING (customer_id for 2) as cust_group
from customer 
WHERE SUBSTRING(customer_id for 2) = 'AB';

SELECT customer_id, customer_name, 
SUBSTRING (customer_id from 4 for 5) as cust_number
from customer 
WHERE SUBSTRING(customer_id for 2) = 'AB';


/* LIST AGGREGATION */

SELECT* from sales ORDER BY order_id;

SELECT order_id, 
STRING_AGG(product_id, ',')
from sales
GROUP BY order_id;