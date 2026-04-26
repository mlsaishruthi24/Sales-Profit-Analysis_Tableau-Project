SELECT * from customer;

SELECT * from product;

SELECT * from sales;


/* IN */

SELECT * from customer WHERE city IN ('Philadelphia','Seattle');

SELECT * from customer WHERE city='Philadelphia' OR city='Seattle';


/* BETWEEN */

SELECT * from customer WHERE age BETWEEN 20 and 30;

SELECT * from customer WHERE age>=20 AND age<=30;

SELECT * from customer WHERE age NOT BETWEEN 20 and 30;

SELECT * from sales WHERE ship_date BETWEEN '2015-04-01' and '2016-04-01';


/* LIKE */

SELECT * from customer WHERE customer_name LIKE 'J%';

SELECT * from customer WHERE customer_name LIKE '%Nelson%';

SELECT * from customer WHERE customer_name LIKE '____ %';

SELECT DISTINCT city from customer WHERE city NOT LIKE 'S%';

SELECT * from customer WHERE customer_name LIKE 'G\%';


/* ORDER BY */

SELECT * from customer WHERE state='California' ORDER BY customer_name;

SELECT * from customer WHERE state='California' ORDER BY customer_name desc;

SELECT * from customer ORDER BY city asc, customer_name desc;

SELECT * from customer ORDER BY 2 asc;

SELECT * from customer ORDER BY age desc;


/* LIMIT */

SELECT * from customer WHERE age>25 ORDER BY age desc LIMIT 8; 

SELECT * from customer WHERE age>25 ORDER BY age asc LIMIT 10;

/* ALIAS */

SELECT customer_id AS serial_number, customer_name AS name, age AS customer_age from customer;