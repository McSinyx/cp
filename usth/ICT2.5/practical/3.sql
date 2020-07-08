SOURCE mywind/northwind-default-current-timestamp.sql;
SOURCE mywind/northwind-data.sql;

CREATE VIEW recent_orders
AS SELECT *
FROM orders
WHERE order_date>'2006-03-24';
SELECT *
FROM recent_orders;

SELECT
  product_code,
  unit_price,
  quantity,
  (unit_price*quantity*(1-discount)) AS value
FROM order_details, products
WHERE order_id=31 AND product_id=products.id;

CREATE VIEW order_values
AS SELECT
  recent_orders.id AS id,
  order_date,
  company,
  (unit_price*quantity*(1-discount)) AS value
FROM recent_orders, customers, order_details
WHERE recent_orders.id=order_id AND customer_id=customers.id;
SELECT *
FROM order_values
ORDER BY id;

CREATE VIEW order_subtotal
AS SELECT id, order_date, company, SUM(value) as sub_total
FROM order_values
GROUP BY id;
SELECT *
FROM order_subtotal;

SELECT *
FROM order_subtotal
WHERE sub_total>=800;

SELECT
  CONCAT(first_name, ' ', last_name) AS full_name,
  SUM(unit_price*quantity*(1-discount)) AS sale
FROM orders, order_details, employees
WHERE orders.id=order_id AND employee_id=employees.id
GROUP BY employee_id
ORDER BY sale DESC;

SELECT
  company, 
  CONCAT(first_name, ' ', last_name) AS full_name,
  email_address,
  'C' as 'type'
FROM employees
UNION
SELECT
  company, 
  CONCAT(first_name, ' ', last_name) AS full_name,
  email_address,
  'S' as 'type'
FROM suppliers;

SELECT DISTINCT category
FROM products
ORDER BY category;

SELECT
  MIN(standard_cost),
  MAX(standard_cost),
  AVG(standard_cost),
  STD(standard_cost),
  VARIANCE(standard_cost)
FROM products;

CREATE VIEW price_by_category
AS SELECT category, AVG(list_price) as average_price
FROM products
GROUP BY category;
SELECT *
FROM price_by_category;

DELIMITER //
CREATE PROCEDURE top_categories(n int)
BEGIN
  SELECT *
  FROM price_by_category
  ORDER BY average_price DESC
  LIMIT n;
END//
DELIMITER ;
CALL top_categories(3);

SELECT category, MIN(average_price)
FROM price_by_category;

CREATE VIEW employee_names
AS SELECT id, CONCAT(first_name, ' ', last_name) as full_name
FROM employees;
SELECT
  id,
  (SELECT full_name FROM employee_names WHERE id=created_by) as creator,
  (SELECT full_name FROM employee_names WHERE id=approved_by) as approver
FROM purchase_orders;
