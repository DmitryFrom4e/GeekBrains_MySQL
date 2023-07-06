DROP DATABASE IF EXISTS homework_5_2;
CREATE DATABASE homework_5_2;
USE homework_5_2;

DROP TABLE IF EXISTS train_shedule;
CREATE TABLE train_shedule
(
train_id INT,
station VARCHAR(20),
station_time TIME(0)
);

INSERT INTO train_shedule
		(train_id, station, station_time)
VALUES 
		(110, 'San Francisco', '10:00:00'),
        (110, 'Redwood City', '10:54:00'),
        (110, 'Paolo Alto', '11:02:00'),
        (110, 'San Jose', '12:35:00'),
        (120, 'San Francisco', '11:00:00'),
        (120, 'Paolo Alto', '12:49:00'),
        (120, 'San Jose', '13:30:00');
        
SELECT *
FROM train_shedule;


/*Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. 
Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.

пошел слово в слово, как в задаче:
- добавил столбец
*/

ALTER TABLE train_shedule
ADD COLUMN time_to_next_station TIME(0);

SELECT *
FROM train_shedule;

-- обновил инф в нем
UPDATE train_shedule t1
	JOIN (
		  SELECT train_id, station_time,
		  LEAD(station_time) OVER w AS next_station_time
		  FROM train_shedule
		  WINDOW w AS (PARTITION BY train_id ORDER BY station_time)
		) t2 
	ON t1.train_id = t2.train_id 
	AND t1.station_time = t2.station_time
SET t1.time_to_next_station = TIMEDIFF(t2.next_station_time, t1.station_time);

SELECT *
FROM train_shedule;



