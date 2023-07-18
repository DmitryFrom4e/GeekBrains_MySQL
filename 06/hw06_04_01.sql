DROP DATABASE IF EXISTS homework6_3;
CREATE DATABASE homework6_3;
USE homework6_3;

-- 5. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
-- (по желанию)

DROP FUNCTION IF EXISTS hello;

DELIMITER $$
CREATE FUNCTION hello() RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
  DECLARE current_hour INT;
  DECLARE greeting VARCHAR(50);
  
  -- Получаем текущий час
  SET current_hour = HOUR(CURRENT_TIME());
  
  -- Определяем приветствие в зависимости от текущего времени суток
  IF current_hour >= 6 AND current_hour < 12 THEN
    SET greeting = 'Доброе утро';
  ELSEIF current_hour >= 12 AND current_hour < 18 THEN
    SET greeting = 'Добрый день';
  ELSEIF current_hour >= 18 AND current_hour < 24 THEN
    SET greeting = 'Добрый вечер';
  ELSE
    SET greeting = 'Доброй ночи';
  END IF;
  
  -- Возвращаем приветствие
  RETURN greeting;
END $$

DELIMITER ;

SELECT hello();
