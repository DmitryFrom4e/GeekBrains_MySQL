CREATE DATABASE IF NOT EXISTS homework_2;
USE homework_2;

-- 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.
DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
    count_product INT
);

INSERT INTO sales (order_date, count_product)
VALUES
		("2022-01-01", 156),
        ("2022-01-02", 180),
        ("2022-01-03", 21),
        ("2022-01-04", 124),
        ("2022-01-05", 341);

/*2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ*/

SELECT 	id "id заказа",
/*order_date,
        count_product,*/
        CASE 
			WHEN count_product < 100 THEN "Маленький заказ"
            WHEN count_product BETWEEN	100 and 300 THEN "Средний заказ"
            WHEN count_product > 300 THEN "Большой заказ"
		ELSE "ОШИБКА" END "Тип заказа"
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id VARCHAR(10),
    amount DECIMAL,
    order_status VARCHAR(30)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
      ("e03", 15.00, "OPEN"),
      ("e01", 25.50, "OPEN"),
      ("e05", 100.70, "CLOSED"),
      ("e02", 22.18, "OPEN"),
      ("e04", 9.50, "CANCELLED");
      
/* Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
*/

SELECT ORD.*,
		CASE 
			WHEN ORD.order_status = "OPEN" THEN "Order is in open state"
            WHEN ORD.order_status = "CLOSED" THEN "Order is closed"
            WHEN ORD.order_status = "CANCELLED" THEN "Order is cancelled" END full_order_status
FROM orders ORD