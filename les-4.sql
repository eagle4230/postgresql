--Задание
--Найти, кому принадлежат 10 самых больших видеофайлов. 
--В отчёт вывести идентификатор видеофайла, имя владельца, фамилию владельца, URL основной фотографии пользователя, URL видеофайла, размер видеофайла.


-- Решение только на вложенных запросах

SELECT 
  id, 
  (SELECT first_name FROM users WHERE users.id=video.owner_id) AS first_name, 
  (SELECT last_name FROM users WHERE users.id=video.owner_id) AS last_name, 
  (SELECT
    (SELECT url FROM photo WHERE photo.id=users.main_photo_id)
    FROM users WHERE users.id=video.owner_id
  ) AS main_photo_url,
  url, 
  size 
FROM video 
ORDER BY size DESC LIMIT 10;


-- Решение с помощью объединения JOIN

SELECT
  video.id,
  users.first_name,
  users.last_name,
  photo.url,
  video.url,
  video.size
FROM video 
JOIN users ON video.owner_id = users.id
LEFT JOIN photo ON photo.owner_id = users.id
ORDER BY video.size DESC LIMIT 10;


-- Решение с использованием временной таблицы

CREATE TEMP TABLE big_video 
(
  id INT,
  url VARCHAR(250),
  size INT,
  owner_id INT
);

INSERT INTO big_video
  SELECT id, url, size, owner_id
FROM video
  ORDER BY size DESC 
  LIMIT 10;

SELECT 
  big_video.id,
  first_name,
  last_name,
  photo.url AS main_photo_url,
  big_video.url AS video_url,
  big_video.size
FROM users
  JOIN big_video ON big_video.owner_id = users.id
  LEFT JOIN photo ON photo.id = users.main_photo_id;


-- Решение с использованием общего табличного выражения

WITH biggest_video AS
(
  SELECT id, url, size, owner_id FROM video
)
SELECT
  biggest_video.id,
  first_name,
  last_name,
  photo.url AS main_photo_url,
  biggest_video.url AS video_url,
  biggest_video.size
FROM users
  JOIN biggest_video ON biggest_video.owner_id = users.id
  LEFT JOIN photo ON photo.id = users.main_photo_id
  ORDER BY size DESC LIMIT 10;

