SELECT * from customer;

SELECT * from product;

SELECT * from sales;

/* CONVERSION TO STRING */

SELECT order_date, ship_date, (extract (epoch from ship_date) - extract (epoch from order_date)) as sec_taken
from sales;

SELECT sales, 'total sales value for this order is' || TO_CHAR(sales,'9999.99') as message
from sales;

SELECT sales, 'total sales value for this order is' || TO_CHAR(sales,'$9,999.99') as message
from sales;

SELECT order_date, TO_CHAR (order_date, 'DD MM YY') 
from sales;

SELECT order_date, TO_CHAR (order_date, 'DD Month YYYY') 
from sales;


/* CONVERSION TO DATE */

SELECT TO_DATE ('2019/01/15', 'YYYY/MM/DD');

SELECT TO_DATE ('26122018', 'DDMMYY');


/* CONVERSION TO NUMBER */

SELECT TO_NUMBER ('2045.876', '9999.999');

SELECT TO_NUMBER ('$2,045.876', 'l9,999.999');