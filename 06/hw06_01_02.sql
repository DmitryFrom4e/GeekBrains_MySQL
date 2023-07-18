DROP DATABASE IF EXISTS homework6_1;
CREATE DATABASE homework6_1;
USE homework6_1;

-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DROP FUNCTION IF EXISTS format_seconds;

DELIMITER $$

CREATE FUNCTION format_seconds(seconds INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
   DECLARE days INT;
   DECLARE hours INT;
   DECLARE minutes INT;
   DECLARE formatted_time VARCHAR(100);

   SET days = seconds DIV 86400;
   SET seconds = seconds % 86400;

   SET hours = seconds DIV 3600;
   SET seconds = seconds % 3600;
   
   SET minutes = seconds DIV 60;
   SET seconds = seconds % 60;
   
   SET formatted_time = CONCAT(
							days, ' days ', 
							LPAD(hours, 2, '0'), ' hours ', 
                            LPAD(minutes, 2, '0'), ' minutes ', 
                            LPAD(seconds, 2, '0'), ' seconds'
						);
   RETURN formatted_time;
END $$
DELIMITER ;

SELECT format_seconds(123456) as formatted_time;

-- 2. Выведите только четные числа от 1 до 10 (Через цикл).
-- Пример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS print_even_numbers;
DELIMITER $$
CREATE PROCEDURE print_even_numbers()
BEGIN
    DECLARE n INT DEFAULT 1;
    DECLARE result VARCHAR(100) DEFAULT "";

    WHILE n <= 10 DO
        IF n % 2 = 0 THEN
            SET result = CONCAT(result, n, ",");
        END IF;
        SET n = n + 1;
    END WHILE;

    SELECT TRIM(TRAILING ',' FROM result) as even_numbers;
END $$

CALL print_even_numbers();