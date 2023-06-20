/*  1.	Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
	Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ*/
CREATE DATABASE IF NOT EXISTS phone_db;

USE phone_db;

DROP TABLE IF EXISTS phone_tb;
CREATE TABLE phone_tb (
						Id INT PRIMARY KEY AUTO_INCREMENT,
                        ProductName VARCHAR(60) NOT NULL,
                        Manufacturer VARCHAR(30) NOT NULL,
                        ProductCount INT NULL,
                        Price INT NULL
						);
                        
DESC phone_tb;

INSERT phone_tb (ProductName, Manufacturer, ProductCount, Price)
VALUES 
		("Iphone X", "Apple", 3, 76000),
        ("Iphone 8", "Apple", 2, 51000),
        ("Galaxy S9", "Samsung", 2, 56000),
        ("Galaxy S8", "Samsung", 1, 41000),
        ("P20 Pro", "Huawei", 5, 36000);

-- 2. 	Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)
        
SELECT ProductName, Manufacturer, Price
FROM phone_tb
WHERE ProductCount > 2;

-- 3.  	Выведите весь ассортимент товаров марки “Samsung” 

SELECT Id, ProductName, Manufacturer, ProductCount, Price
FROM phone_tb
WHERE Manufacturer = "samsung";

-- 4. 	Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**

SELECT Id, ProductName, Manufacturer, ProductCount, Price, ProductCount * Price as TotalPrice
FROM phone_tb
WHERE ProductCount * Price > 100000 AND ProductCount * Price < 145000;

-- 4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
--   4.1. Товары, в которых есть упоминание "Iphone"
SELECT Id, ProductName, Manufacturer, ProductCount, Price
FROM phone_tb
WHERE ProductName REGEXP "Iphone"; -- или WHERE ProductName RLIKE "Iphone"

--   4.2. "Galaxy"
SELECT Id, ProductName, Manufacturer, ProductCount, Price
FROM phone_tb
WHERE ProductName REGEXP "Galaxy"; -- или WHERE ProductName RLIKE "Galaxy"

--   4.3.  Товары, в которых есть ЦИФРЫ
SELECT Id, ProductName, Manufacturer, ProductCount, Price
FROM phone_tb
WHERE ProductName REGEXP "[0-9]";

--   4.4.  Товары, в которых есть ЦИФРА "8"
SELECT Id, ProductName, Manufacturer, ProductCount, Price
FROM phone_tb
WHERE ProductName REGEXP "8"; -- или WHERE ProductName RLIKE "8"








