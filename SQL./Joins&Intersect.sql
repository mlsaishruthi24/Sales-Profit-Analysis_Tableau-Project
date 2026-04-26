
/* JOINS */


/*Creating sales table of year 2015*/

Create table sales_2015 as select * from sales where ship_date between '2015-01-01' and '2015-12-31';
select count(*) from sales_2015; --2131
select count(distinct customer_id) from sales_2015;--578

/* Customers with age between 20 and 60 */
create table customer_20_60 as select * from customer where age between 20 and 60;
select count (*) from customer_20_60;--597

Create table sales_2015 as select * from sales where ship_date between '2015-01-01' and '2015-12-31';
Create table customer_20_60 as select * from customer where age between 20 and 60;


/* INEER JOIN */

SELECT customer_id from sales_2015 order by customer_id;
SELECT cutsomer_id from customer_20_60 order by customer_id;

SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
from sales_2015 as a 
INNER JOIN customer_20_60 as b 
on a.customer_id = b.customer_id
ORDER BY customer_id;


/* LEFT JOIN */

SELECT customer_id from sales_2015 order by customer_id;
SELECT customer_id from customer_20_60 order by customer_id;

/* AA-10315 not present in customer_20_60 table
AA-10375 present in both
AA-10480 ot present in sales_2015 table */

SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
from sales_2015 as a 
LEFT JOIN customer_20_60 as b 
on a.customer_id = b.customer_id
ORDER BY customer_id;


/* RIGHT JOIN */

SELECT customer_id from sales_2015 order by customer_id;
SELECT customer_id from customer_20_60 order by customer_id;

/* AA-10315 not present in customer_20_60 table
AA-10375 present in both
AA-10480 ot present in sales_2015 table */

SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age
from sales_2015 as a 
RIGHT JOIN customer_20_60 as b 
on a.customer_id = b.customer_id
ORDER BY customer_id;


/* OUTER JOIN */

SELECT customer_id from sales_2015 order by customer_id;
SELECT customer_id from customer_20_60 order by customer_id;

/* AA-10315 not present in customer_20_60 table
AA-10375 present in both
AA-10480 ot present in sales_2015 table */

SELECT
a.order_line ,
a.product_id,
a.customer_id,
a.sales,
b.customer_name,
b.age,
b.customer_id
from sales_2015 as a 
FULL JOIN customer_20_60 as b 
on a.customer_id = b.customer_id
ORDER BY a.customer_id , b.customer_id;


/* CROSS JOIN */

CREATE TABLE month_values(MM integer);
CREATE TABLE year_values(YYYY integer);

INSERT INTO month_values values (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);
INSERT INTO year_values values (2011),(2012),(2013),(2014),(2015),(2016),(2017),(2018),(2019);

SELECT * from month_values;
SELECT * from year_values;

SELECT a.YYYY, b.MM
from year_values as a, month_values as b
ORDER BY a.YYYY, b.MM;


/* INTERSECT */

SELECT customer_id from sales_2015
INTERSECT
SELECT customer_id from customer_20_60;


/* EXCEPT */

SELECT customer_id from sales_2015
EXCEPT
SELECT customer_id from customer_20_60
ORDER BY customer_id;


/* UNION */

/* AA-10315 not present in customer_20_60 table
AA-10375 present in both
AA-10480 ot present in sales_2015 table */

SELECT customer_id from sales_2015
UNION
SELECT customer_id from customer_20_60
ORDER BY customer_id;