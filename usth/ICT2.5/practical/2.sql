SOURCE mywind/northwind-default-current-timestamp.sql;
SOURCE mywind/northwind-data.sql;

SELECT *
FROM products
WHERE discontinued=1;

SELECT *
FROM products
ORDER BY list_price
LIMIT 4;

SELECT id, product_name, list_price
FROM products
WHERE list_price
BETWEEN 15 AND 25;

SELECT id, CONCAT(first_name, ' ', last_name) AS name
FROM employees;

SELECT id, first_name, last_name
FROM employees
WHERE first_name LIKE 'A%';

SELECT COUNT(DISTINCT city) AS 'number of different cities'
FROM employees;

SELECT DISTINCT ship_name
FROM orders;

SELECT MIN(list_price), MAX(list_price)
from products;

SELECT COUNT(id) AS 'number of current products'
FROM products
WHERE discontinued=0;

SELECT AVG(list_price), STD(list_price)
FROM products;

SELECT product_name, list_price
FROM products
WHERE list_price > (SELECT AVG(list_price) FROM products);

INSERT INTO suppliers (company, last_name, first_name, city, country_region)
VALUES ('Habeco', 'Nguyễn', 'Hồng Linh', 'Hanoi', 'Vietnam');

INSERT INTO products (
  supplier_ids,
  product_code,
  product_name,
  list_price,
  discontinued,
  category)
VALUES (
  (SELECT id FROM suppliers WHERE company='Habeco'),
  'TB',
  'Truc Bach',
  22,
  0,
  'Beverages');

UPDATE products
SET standard_cost=18
WHERE product_name='Truc Bach';

DELETE
FROM suppliers
WHERE company='Habeco';
