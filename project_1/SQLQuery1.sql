CREATE TABLE mein_test(nummer INT, vorname VARCHAR(15));
INSERT INTO mein_test VALUES
(1, 'Karl'),
(2, 'Klara');
SELECT * FROM mein_test;
SELECT vorname FROM mein_test;
SELECT nummer FROM mein_test;


INSERT INTO mein_test (vorname)  VALUES ('xx');
CREATE TABLE mein_test2(nummer INT IDENTITY(1,1), vorname VARCHAR(15));
INSERT INTO mein_test2 VALUES
('Karl'),
('Tom');

CREATE TABLE mein_test3( id int identity(100,2) primary key,
vorname varchar(15));
insert into mein_test3 values ('Bum'), ('Kok'), ('Doom'), (NULL), ('LLOYD');
select * from mein_test3;
select id ID, vorname Bum from mein_test3;


