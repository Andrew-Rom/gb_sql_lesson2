CREATE DATABASE IF NOT EXISTS hw2;

USE hw2;

-- 1.1 Creating new table 'sales'
CREATE TABLE IF NOT EXISTS sales (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_date DATE NOT NULL,
  count_product INT UNSIGNED NOT NULL
);

-- 1.2 Filling created table 'sales'
INSERT INTO sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

-- 2 Set an order type depending on the quantity of product
SELECT id AS "id заказа",
CASE
	WHEN count_product < 100 THEN "Маленький заказ"
    WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
    ELSE "Большой заказ"
END AS "Тип заказа"
FROM sales;

-- 3.1 Creating new table 'orders'
CREATE TABLE IF NOT EXISTS orders (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  employee_id VARCHAR(3) NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  order_status VARCHAR(10) NOT NULL
);

-- 3.2 Filling created table 'orders'
INSERT INTO orders (employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

-- 3.3 Show full order status info
SELECT id, employee_id, amount,
CASE
	WHEN order_status = 'OPEN' THEN 'Order is in open state'
    WHEN order_status = 'CLOSED' THEN 'Order is closed'
    WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
END AS full_order_status
FROM orders;

-- 4 NULL vs ZERO(0)
/*
0 — это значение. 
NULL указывает на "пустое место" — объявленную, но неинициализированную переменную, объект и т.п., 
Поскольку NULL означает отсутствие какого-либо значения, 
то NULL не может быть равен или не равен какому-либо значению (в т.ч. 0).
*/