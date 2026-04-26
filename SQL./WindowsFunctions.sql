SELECT * from customer;

SELECT * from product;

SELECT * from sales;

/* ROW NUMBER */

SELECT * from customer limit 10;

SELECT * from sales limit 10;

SELECT a.*, b.order_num, b.sales_tot, b.quantity_tot, b.profit_tot
from customer as a
left join(SELECT customer_id, count(distinct order_id) as order_num, sum(sales) as sales_tot, 
                              sum(quantity) as quantity_tot, 
							  sum(profit) as profit_tot 
							  from sales group by customer_id) as b
on a.customer_id=b.customer_id;

SELECT * from sales where customer_id = 'AA-10315' order by order_id;

CREATE TABLE customer_order as (SELECT a.*, b.order_num, b.sales_tot, b.quantity_tot, b.profit_tot
from customer as a
left join(SELECT customer_id, count(distinct order_id) as order_num, sum(sales) as sales_tot, 
                              sum(quantity) as quantity_tot, 
							  sum(profit) as profit_tot 
							  from sales group by customer_id) as b
on a.customer_id=b.customer_id);

SELECT * from customer_order;

SELECT customer_id, customer_name, state, order_num, ROW_NUMBER() over 
(PARTITION by state ORDER BY order_num desc) as row_n
from customer_order;

SELECT * from (SELECT customer_id, customer_name, state, order_num, ROW_NUMBER() over 
(PARTITION by state ORDER BY order_num desc) as row_n
from customer_order) as a where a.row_n<=3;


/* RANK */

SELECT customer_id, customer_name, state, order_num, 
ROW_NUMBER() over (PARTITION by state ORDER BY order_num desc) as row_n,
RANK() over (PARTITION by state ORDER BY order_num desc) as rank_n,
DENSE_RANK() over (PARTITION by state ORDER BY order_num desc) as d_rank_n
from customer_order;


/* NTILE */

SELECT customer_id, customer_name, state, order_num, 
ROW_NUMBER() over (PARTITION by state ORDER BY order_num desc) as row_n,
RANK() over (PARTITION by state ORDER BY order_num desc) as rank_n,
DENSE_RANK() over (PARTITION by state ORDER BY order_num desc) as d_rank_n,
NTILE(5) over (PARTITION by state ORDER BY order_num desc) as ntile_n
from customer_order;

SELECT * from (SELECT customer_id, customer_name, state, order_num, 
ROW_NUMBER() over (PARTITION by state ORDER BY order_num desc) as row_n,
RANK() over (PARTITION by state ORDER BY order_num desc) as rank_n,
DENSE_RANK() over (PARTITION by state ORDER BY order_num desc) as d_rank_n,
NTILE(5) over (PARTITION by state ORDER BY order_num desc) as ntile_n
from customer_order) where ntile_n=1;


/* AVERAGE FUNCTION */

SELECT * from customer_order;

SELECT customer_id, customer_name, state, sales_tot as revenue,
AVG(sales_tot) OVER (PARTITION BY state) as avg_revenue
from customer_order;

-----customer with less than avy revenue

SELECT * from (SELECT customer_id, customer_name, state, sales_tot as revenue,
AVG(sales_tot) OVER (PARTITION BY state) as avg_revenue
from customer_order) as a where a.revenue<avg_revenue;


/* COUNT */

SELECT customer_id, customer_name, state, 
COUNT(customer_id) OVER (PARTITION BY state) as count_cust
from customer_order;


/* SUM TOTAL */

SELECT * from sales;

SELECT order_id, max(order_date) as order_date, max(customer_id) as customer_id, 
SUM(sales) as sales from sales group by order_id;

CREATE TABLE order_rollup as SELECT order_id, max(order_date) as order_date, max(customer_id) as customer_id, 
SUM(sales) as sales from sales group by order_id;

CREATE TABLE order_rollup_state as select a.*, b.state
from order_rollup as a
left join customer as b
on a.customer_id=b.customer_id;

SELECT * from order_rollup_state;

SELECT *,
SUM(sales) OVER(PARTITION BY state) as sales_state_total
from order_rollup_state;


/* RUNNING TOTAL */

SELECT *,
SUM(sales) OVER(PARTITION BY state) as sales_state_total,
SUM(sales) OVER(PARTITION BY state ORDER BY order_date) as running_total
from order_rollup_state;


/* LAG/LEAD */

SELECT customer_id, order_date, order_id, sales,
LAG(sales,1) OVER(PARTITION BY customer_id ORDER BY order_date) as previous_sales,
LAG(order_id,1) OVER(PARTITION BY customer_id ORDER BY order_date) as previous_order_id
from order_rollup_state;

SELECT customer_id, order_date, order_id, sales,
LEAD(sales,1) OVER(PARTITION BY customer_id ORDER BY order_date) as previous_sales,
LEAD(order_id,1) OVER(PARTITION BY customer_id ORDER BY order_date) as previous_order_id
from order_rollup_state;


/* COALESCE */

CREATE TABLE emp_name(
S_No int,
First_name varchar(255),
Middle_name varchar(255),
Last_name varchar(255));

INSERT INTO emp_name (S_No, First_name, Middle_name, Last_name)   values (1,    'Paul',    'Van',    'High');
INSERT INTO emp_name (S_No, First_name,              Last_name)   values (2,    'David',             'Flashing');
INSERT INTO emp_name (S_No,             Middle_name, Last_name)   values (3,               'Lena',   'Radford');
INSERT INTO emp_name (S_No, First_name,              Last_name)   values (4,    'Henry',             'Goldwyn');
INSERT INTO emp_name (S_No,                          Last_name)   values (5,                         'Holden');
INSERT INTO emp_name (S_No, First_name, Middle_name, Last_name)   values (6,    'Erin',    'T',      'Mull');

SELECT * from emp_name;

SELECT *, 
COALESCE(first_name, middle_name, last_name) as name_corr,
CONCAT (first_name, middle_name, last_name) from emp_name;

)