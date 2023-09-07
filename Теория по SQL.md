# Основы SQL

## 01. Общие команды mysql

### Подключение

Подключение к mysql на самом сервере. Параметр u отвечает за имя пользователя, p - запрос пароль.

```bash
mysql -u root -p
```

Подключение к mysql с другого компьютера. Параметр h указывает сервер, P - порт.

```bash
mysql -u root -h 192.168.1.36-P 3306-p
```

### Команды mysql

```sql
USE     \u  -- Выбор БД
SOURCE  \.  -- Выполнение SQL-команд из файла
SYSTEM  \!  -- Выполнение команды ОС
STATUS  \s  -- Вывод имнформации о состоянии сервера
EXIT    \q  -- выход    \G  -- Вывод информации в вертикальном формате. Только для самого клиента mysql, а не других программ
```

### Создание дампа для бэкапа

```bash
mysqldump -u root -p mysql >mysql.sql
```

### Восстановление дампа

```bash
mysql -u root -p mysql 
```

Чтобы не вводить каждый раз пользователя и пароль, можно создать файл `.my.cnf` в папке запуска (дамашней папке)

### Настройка подключения

Для подключения самого mysql:

```plaintext
[mysql]
user=root
password=123
```

Если хочешь оставить пароль внутри, то надо ограничить доступ, оставить только для текущего пользователя: `chmod 0600 ~/.my.cnf`

Для подключения всех клиентов:

```plaintext
[client]
user=root
password=123
```

### Основные команды с БД

Просмотр всех БД

```sql
SHOW DATABASES;
```

Создание БД

```sql
CREATE DATABASE shop;
```

Создание БД с проверкой на существование

```sql
CREATE DATABASE IF NOT EXISTS shop;
```

Каталог данных

```sql
SHOW VARIABLES LIKE'datadir';
```

Удаление БД

```sql
DROP DATABASE shop;
```

Удаление БД с проверкой на существование

```sql
DROP DATABASE IF EXISTS shop;
```

Выбрать БД по умолчанию

```sql
USE shop
```

Можно не указывать USE, но тогда нужно всегда писать FROM

```sql
SHOW TABLES FROM shop
```

Подключиться сразу к БД

```bash
mysql shop
```

### Основные команды с таблицами

Создание таблиц

```sql
CREATE TABLE users (k INT);
```

Показать все таблицы в БД

```sql
SHOW TABLES;
```

Подробный вывод для конкретной таблицы

```sql
DESCRIBE user;
```

Подробный вывод для интересующего столбца таблицы

```sql
DESCRIBE user 'User';
```

Подробный вывод столбцов таблицы, начинающихся на m

```sql
DESCRIBE user 'm%';
```

*Примечание: SHOW и DESCRIBE являются не стандартными, другие БД их могут не иметь.* 

Поэтому всегда можно воспользоваться стандартными средствами:

```sql
SELECT*FROMinformation_schema.SCHEMA; --information_schema - виртуальная БД
```

Вывод таблицы

```sql
SELECT*FROMinformation_schema.TABLESWHERE TABLE_SCHEMA ='shop'\G; -- \G только в mysql
```

# 02. Язык SQL

SQL - Structured Query Language
