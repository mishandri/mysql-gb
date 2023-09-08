-- Active: 1694072071425@@localhost@3306@shop
-- Создадим таблицу для разделов
DROP TABLE IF EXISTS catalogs;	-- Удалим, если такая таблица есть
CREATE  TABLE catalogs (		-- Создаём таблицу
	id SERIAL PRIMARY KEY,-- id будут только положительные
	name VARCHAR(255) 			-- Название 255 символов
	COMMENT 'Название раздела',	-- Комментарий к столбцу
	UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';	-- Комментарий к таблице

INSERT IGNORE INTO catalogs VALUES 
	(DEFAULT, 'Процессоры'),
	(DEFAULT, 'Мат.платы'),
	(DEFAULT, 'Видеокарты'),
	(DEFAULT, 'Видеокарты');

SELECT id, name FROM catalogs;

-- Создадим таблицу для пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Имя покупателя',
	birthday_at DATE COMMENT 'Дата рождения',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (id, name, birthday_at) VALUES (1, 'hello', '1979-01-27');
SELECT * FROM users;

-- Создадим таблицу для товаров
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Название',
	description TEXT COMMENT 'Описание',
	price DECIMAL (11,2) COMMENT 'Цена',
	catalog_id INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY index_of_catalog_id(catalog_id)
) COMMENT = 'Товарные позиции';

-- Создадим таблицу заказов
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id SERIAL PRIMARY KEY,
	user_id INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY index_of_user_id(user_id)
) COMMENT = 'Заказы';

-- Создадим таблицу заказанных товаров
DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
	id SERIAL PRIMARY KEY,
	order_id INT UNSIGNED,
	product_id INT UNSIGNED,
	total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY index_of_order_id(order_id),
	KEY index_of_product_id(product_id)
) COMMENT = 'Состав заказа';

-- Создадим таблицу для скидок
DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
	id SERIAL PRIMARY KEY,
	user_id INT UNSIGNED,
	product_id INT UNSIGNED,
	discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
	started_at DATETIME,
	finished_at DATETIME,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	
) COMMENT = 'Скидки';

-- Создадим таблицу товаров на складе
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
	id SERIAL PRIMARY KEY,
	storehouse_id INT UNSIGNED,
	product_id INT UNSIGNED,
	value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	
) COMMENT = 'Запасы на складе';






