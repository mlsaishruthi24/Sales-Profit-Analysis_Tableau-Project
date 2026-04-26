SELECT * from customer;

SELECT * from product;

SELECT * from sales;

/* EXPLAIN */

EXPLAIN SELECT * from customer;

EXPLAIN SELECT DISTINCT * from customer;


/* SCHEMAS */

CREATE SCHEMA test;

CREATE TABLE test.customer as SELECT * from customer;