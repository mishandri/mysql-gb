-- Active: 1694072071425@@192.168.1.76@3306
-- Создадим таблицу для разделов
DROP TABLE IF EXISTS catalogs;	-- Удалим, если такая таблица есть
CREATE  TABLE catalogs (		-- Создаём таблицу
	id INT UNSIGNED,			-- id будут только положительные
	name VARCHAR(255) 			-- Название 255 символов
	COMMENT 'Название раздела'	-- Комментарий к столбцу
) COMMENT = 'Разделы интернет-магазина';	-- Комментарий к таблице

-- Создадим таблицу для пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED,
	name VARCHAR(255) COMMENT 'Имя покупателя'
) COMMENT = 'Покупатели';

-- Создадим таблицу для товаров
DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id INT UNSIGNED,
	name VARCHAR(255) COMMENT 'Название',
	description TEXT COMMENT 'Описание',
	price DECIMAL (11,2) COMMENT 'Цена',
	catalog_id INT UNSIGNED
) COMMENT = 'Товарные позиции';

-- Создадим таблицу заказов
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id INT UNSIGNED,
	user_id INT UNSIGNED
) COMMENT = 'Заказы';

-- Создадим таблицу заказанных товаров
DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
	id INT UNSIGNED,
	order_id INT UNSIGNED,
	product_id INT UNSIGNED,
	total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товырных позиций'
) COMMENT = 'Состав заказа';

-- Создадим таблицу для скидок
DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
	id INT UNSIGNED,
	user_id INT UNSIGNED,
	product_id INT UNSIGNED,
	discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0'
) COMMENT = 'Скидки';

-- Создадим таблицу товаров на складе
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
	id INT UNSIGNED,
	storehouse_id INT UNSIGNED,
	product_id INT UNSIGNED,
	value INT UNSIGNED COMMENT 'Запас товарной позиции на складе'
) COMMENT = 'Запасы на складе';






