TASK 4.1

Part1

1. Instaling mysql on VM

sudo apt-get install mysql-server
sudo mysql -u root -p

2. Acces to mysql

SELECT user, host, plugin from mysql.user;

ALTER USER 'root'@'localhost' INDENTIFIED WITH caching_sha2_password BY 'password'

FLUSH PRIVILEGES

3. CREATE DATABASE comp

use comp

4. CREATE TABLES

CREATE TABLE used (id integer auto_increment Primary Key, mark VARCHAR (10), year YEAR, user VARCHAR (10));
CREATE TABLE buy (id integer auto_increment Primary Key, mark VARCHAR (10), year YEAR, user VARCHAR (10));
CREATE TABLE writeoff (id integer auto_increment Primary Key, mark VARCHAR (10), year YEAR, number VARCHAR (10));

5. Fill tables

INSERT INTO used (mark, year, user) values ('Dell', '2012', 'Ivanov'), ('Lenovo', '2015', 'Petrov'), ('Asus', '2017', 'Sedorov');
INSERT INTO buy (mark, year, user) values ('mcbook', '2021', 'Ivanov'), ('LENOVO', '2021', 'Petrov'), ('ACER', '2021', 'Sedorov');
INSERT INTO writeoff (mark, year, number) values ('DELL', '2012', '123456'), ('LENOVO', '2015', '113456'), ('ASUS', '2017', '223456');

6. SELECT operator with WHERE, GROUP BY and ORDER BY

SELECT * FROM mark used;
SELECT * FROM mark buy;
SELECT * FROM mark writeoff;

SELECT * FROM used WHERE mark='Dell';
SELECT * FROM buy WHERE id=3;
SELECT * FROM buy WHERE id>1;

SELECT * FROM writeoff order by mark;
SELECT * FROM buy where year like '2021' and id>1;
SELECT * FROM writeoff group by id;

7. Create new users with different privileges.

CREATE USER 'petrov'@'%' IDENTIFIED WITH mysql_native_password BY '1111';
GRANT CREATE, ALTER on *.* TO 'petrov'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'ivanov'@'localhost' IDENTIFIED WITH mysql_native_password BY '2222';
GRANT SELECT, DELETE, DROP on *.* TO 'ivanov'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'sedorov'@'localhost' IDENTIFIED WITH mysql_native_password BY '3333';
GRANT CREATE, ALTER, SELECT, DELETE, DROP, INSERT, UPDATE, REFERENCES, RELOAD on *.* TO 'sedorov'@'localhost' WITH GRANT OPTION;

8.Connect to the database as a new users and verify that the privileges allow or deny certain actions.

mysql -u petrov -p 
use comp
SELECT * FROM mark used;
CREATE TABLE testverify (id integer auto_increment Primary Key, mark VARCHAR (10), year YEAR, user VARCHAR (10));
SHOW TABLES;

mysql -u ivanov -p 
use comp
DELETE FROM used where id=1; 

