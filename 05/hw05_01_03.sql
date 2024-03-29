DROP DATABASE IF EXISTS homework_5_1;
CREATE DATABASE homework_5_1;
USE homework_5_1;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- -- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE OR REPLACE VIEW cars_new_view AS
SELECT *
FROM cars
WHERE cost <= 25000;

SELECT *
FROM cars_new_view;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор OR REPLACE) 
-- либо пересоздаю с OR REPLACE
CREATE OR REPLACE VIEW cars_new_view AS
SELECT *
FROM cars
WHERE cost <= 30000;

-- либо меняю существующую через ALTER VIEW
ALTER VIEW cars_new_view AS
SELECT *
FROM cars
WHERE cost <= 30000;

SELECT *
FROM cars_new_view;

-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE OR REPLACE VIEW skoda_audi_cars AS
SELECT *
FROM cars
WHERE name IN ('Skoda', 'Audi');

SELECT *
FROM skoda_audi_cars;

