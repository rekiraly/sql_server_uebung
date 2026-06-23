-- DROP TABLE mein_test5;
-- DROP TABLE mein_test7;
-- DROP TABLE mein_test1;

CREATE TABLE mein_test1 (nummer INT, vorname VARCHAR(10));
CREATE TABLE mein_test7 (nummer INT, vorname VARCHAR(10));
CREATE TABLE mein_test5 (nummer INT, vorname VARCHAR(10));

select * from mein_test1;

Delete from mein_test1
where vorname = 'Fred';

delete from mein_test1
where nummer is NULL;

insert into mein_test1 (vorname) values ('Jenny'), ('Johnny');

INSERT INTO mein_test1 VALUES
(1, 'Karl'),
(2, 'Klara');

delete from mein_test1
where nummer is not NULL;

delete mein_test1;

drop table mein_test1;

CREATE TABLE mein_test1 (nummer INT, vorname VARCHAR(10));

-- SP_RENAME 'mein_test1', 'mein_test6';

-- MySQL, PstgreSQL:
-- Alter Table mein_test6 RENAME TO neu_name;

--Str + K + C kommentar hunzufügen
--Str + K + U zurückmachen 

SELECT column_name, data_type, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'mein_test1';

CREATE TABLE mein_test1 (
id INT IDENTITY(1,1) PRIMARY KEY,
vorname VARCHAR(20)
);

SELECT name FROM sys.key_constraints;

CREATE TABLE mein_test8 (
id INT IDENTITY(1,1),
vorname VARCHAR(20),
email VARCHAR(100),
CONSTRAINT PK_test8_id PRIMARY KEY (id),
CONSTRAINT UQ_test8_email UNIQUE (email)
);

select * from sys.foreign_keys;