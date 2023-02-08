Drop table if exists airlines;
drop database if exists airlines;
create database airlines;

use airlines;
Create table pk_airlines( ID int auto_increment Primary key,
						  Name Varchar(50))
AUTO_INCREMENT = 100;
-- Insert a row, ID will be automatically generated
INSERT INTO pk_airlines (name) VALUES ('United Airlines');
-- Get generated ID
SELECT LAST_INSERT_ID();

insert into Pk_airlines (name) values ('Delta');

-- Specify null or 0
Insert into Pk_airlines Values (Null, 'Spiget');
Insert into Pk_airlines Values (0, 'Aakash');
select * From PK_airlines;
Select Last_insert_id();

Insert into Pk_airlines values (200, 'airways');
Insert Into Pk_airlines (name) values ('British airways');
Select last_insert_id();




