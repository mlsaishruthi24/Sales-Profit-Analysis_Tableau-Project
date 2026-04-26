CREATE TABLE customer(
customer_id varchar primary key,
customer_name varchar,
segment varchar,
age int,
country varchar,
city varchar,
state varchar,
postal_code bigint,
region varchar);


CREATE TABLE product(
product_id varchar primary key,
category varchar,
sub_category varchar,
product_name varchar);


CREATE TABLE sales(
order_line int primary key,
order_id varchar,
order_date date,
ship_date date,
ship_mode varchar,
customer_id varchar,
product_id varchar,
sales numeric,
quantity int,
discount numeric,
profit numeric);

SELECT * from customer

COPY customer from 'C:\Program Files\PostgreSQL\Customer.csv' CSV header;
COPY product from 'C:\Program Files\PostgreSQL\Product.csv' CSV header;
COPY sales from 'C:\Program Files\PostgreSQL\Sales.csv' CSV header;