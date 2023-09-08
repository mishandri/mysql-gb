-- Active: 1694072071425@@192.168.1.76@3306
-- Создадим таблицу для разделов
DROP TABLE IF EXISTS catalogs;	-- Удалим, если такая таблица есть
CREATE  TABLE catalogs (		-- Создаём таблицу
	id INT UNSIGNED NOT NULL,			-- id будут только положительные
	name VARCHAR(255) 			-- Название 255 символов
	COMMENT 'Название раздела'	-- Комментарий к столбцу
) COMMENT = 'Разделы интернет-магазина';	-- Комментарий к таблице

-- Создадим таблицу для пользователей
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id INT UNSIGNED NOT NULL,
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
	id INT UNSIGNED NOT NULL,
	name VARCHAR(255) COMMENT 'Название',
	description TEXT COMMENT 'Описание',
	price DECIMAL (11,2) COMMENT 'Цена',
	catalog_id INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Товарные позиции';

-- Создадим таблицу заказов
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id INT UNSIGNED NOT NULL,
	user_id INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Заказы';

-- Создадим таблицу заказанных товаров
DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products (
	id INT UNSIGNED NOT NULL,
	order_id INT UNSIGNED,
	product_id INT UNSIGNED,
	total INT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товырных позиций',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Состав заказа';

-- Создадим таблицу для скидок
DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
	id INT UNSIGNED,
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
	id INT UNSIGNED,
	storehouse_id INT UNSIGNED,
	product_id INT UNSIGNED,
	value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	
) COMMENT = 'Запасы на складе';






