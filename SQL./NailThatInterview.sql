CREATE TABLESPACE NewSpace LOCATION 'C:\Program Files\PostgreSQL\Storage';

CREATE TABLE customer_test (i int) TABLESPACE NewSpace;

SELECT * pg_tablespace;


/* PRIMARY KEY & FOREIGN KEY */

/* ACID */


/* TRUNCATE */

SELECT * from customer_20_60;

TRUNCATE TABLE customer_20_60;