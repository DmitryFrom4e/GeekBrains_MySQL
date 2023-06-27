-- Создание БД 
CREATE DATABASE IF NOT EXISTS homework_3; -- Создали БД lesson_3

USE homework_3;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45),
    lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT, 
    salary DECIMAL(8,2),
    age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
 ('Петр', 'Петров', 'Рабочий', 20, 25000, 60),
 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
/*
1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
2. Выведите 5 максимальных заработных плат (saraly)
3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
5. Найдите количество специальностей
6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
*/

 -- 1.1 Сортировка данных по полю заработная плата (salary) в порядке убывания
SELECT *
FROM staff
ORDER BY salary DESC;

 -- 1.2 Сортировка данных по полю заработная плата (salary) в порядке возрастания
SELECT *
FROM staff
ORDER BY salary; -- или ORDER BY salary ASC;

-- 2. Вывод 5 максимальных заработных плат (salary)
SELECT DISTINCT salary -- без дистинкта выводит 2 раза по 70000 - подумал, что это неправильно=))
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3. Суммарная зарплата (salary) по каждой специальности (post)
SELECT post, SUM(salary) AS total_salary
FROM staff
GROUP BY post;

-- 4. Количество сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно
SELECT COUNT(*) AS total_employees
FROM staff
WHERE post = 'Рабочий' AND age BETWEEN 24 AND 49;

-- 5. Количество специальностей
SELECT COUNT(DISTINCT post) AS total_specialties
FROM staff;

-- 6. Специальности, у которых средний возраст сотрудников меньше 30 лет
SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) <= 30; -- если строго < ничего не показывает

-- 7.1* Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)
-- у коллеги с работы спросил =))
SELECT *
FROM (
  SELECT *,
         ROW_NUMBER() OVER(PARTITION BY post ORDER BY salary DESC) AS top_rank
  FROM staff
) AS ranked_staff
WHERE top_rank <= 2;

-- 7.2* Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)
-- нашел такое еще =))
SELECT s1.*
FROM staff s1
WHERE (
  SELECT COUNT(*)
  FROM staff s2
  WHERE s2.post = s1.post AND s2.salary >= s1.salary
) <= 2;

-- 7.3* Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)
-- с запросом и джойном =))
SELECT s1.*
FROM staff s1
left join (
			 SELECT post, max(salary) salary, COUNT(*) CountValues
			FROM staff s2
            GROUP BY post
) s2 ON s2.post = s1.post AND s2.salary >= s1.salary
WHERE CountValues <= 2

