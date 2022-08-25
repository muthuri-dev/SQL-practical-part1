CREATE DATABASE hr_database;
/*creating region table*/

USE hr_database;
CREATE TABLE REGION(
region_id VARCHAR(25),
region_name VARCHAR(100),
PRIMARY KEY(region_id)
);

/*region table values*/
INSERT INTO REGION VALUES ('R01','Europe');
INSERT INTO REGION VALUES ('R02','Americas');
INSERT INTO REGION VALUES ('R03','Asia');
INSERT INTO REGION VALUES ('R04','Africa');

/*checking the region table values*/
SELECT * FROM REGION;

/*creating COUNTRY table*/
CREATE TABLE COUNTRY (
 country_id VARCHAR (25),
 country_name VARCHAR (100),
 region_id VARCHAR (25),
 PRIMARY KEY (country_id),
   FOREIGN KEY (region_id) REFERENCES REGION (region_id)
);
/*inserting values in COUNTRY table*/
INSERT INTO COUNTRY VALUES ('AR','Argentina','R02');
INSERT INTO COUNTRY VALUES ('AU','Australia','R03');
INSERT INTO COUNTRY VALUES ('BE','Belgium','R01');
INSERT INTO COUNTRY VALUES ('BR','Brazil','R02');
INSERT INTO COUNTRY VALUES ('CA','Canada','R02');
INSERT INTO COUNTRY VALUES ('CH','Switzerland','R01');
INSERT INTO COUNTRY VALUES ('CN','China','R03');
INSERT INTO COUNTRY VALUES ('DE','Germany','R01');
INSERT INTO COUNTRY VALUES ('DK','Denmark','R01');
INSERT INTO COUNTRY VALUES ('EG','Egypt','R04');
INSERT INTO COUNTRY VALUES ('FR','France','R01');
INSERT INTO COUNTRY VALUES ('HK','HongKong','R03');
INSERT INTO COUNTRY VALUES ('IL','Israel','R04');
INSERT INTO COUNTRY VALUES ('IN','India','R03');
INSERT INTO COUNTRY VALUES ('IT','Italy','R01');
INSERT INTO COUNTRY VALUES ('JP','Japan','R03');
INSERT INTO COUNTRY VALUES ('KW','Kuwait','R04');
INSERT INTO COUNTRY VALUES ('MX','Mexico','R02');
INSERT INTO COUNTRY VALUES ('NG','Nigeria','R04');
INSERT INTO COUNTRY VALUES ('NL','Netherlands','R01');
INSERT INTO COUNTRY VALUES ('SG','Singapore','R03');
INSERT INTO COUNTRY VALUES ('UK','United Kingdom','R01');
INSERT INTO COUNTRY VALUES ('US','United States of America','R02');
INSERT INTO COUNTRY VALUES ('ZM','Zambia','R04');
INSERT INTO COUNTRY VALUES ('ZW','Zimbabwe','R04');

/*checking values in COUNTRY table*/
SELECT * FROM COUNTRY;

/*creating LOCATION table*/
CREATE TABLE LOCATION (
 location_id VARCHAR(25),
 street_address VARCHAR (100),
 postal_code VARCHAR (100),
 city VARCHAR (100),
 state_province VARCHAR (100),
 country_id VARCHAR (25),
 PRIMARY KEY (location_id),
   FOREIGN KEY (country_id) REFERENCES COUNTRY (country_id)
);
/* inserting value into LOCATION table*/
INSERT INTO LOCATION VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO LOCATION VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO LOCATION VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO LOCATION VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO LOCATION VALUES (2400,'8204 Arthur St','000','London',NULL,'UK');
INSERT INTO LOCATION VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO LOCATION VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

/*checking values in LOCATION table*/

/*creating JOB table*/
CREATE TABLE JOB (
 job_id VARCHAR(25),
 job_title VARCHAR (100),
 min_salary DECIMAL(8,2),
 max_salary DECIMAL(8,2),
 PRIMARY KEY (job_id)
);

/*inserting values in JOB table*/
INSERT INTO JOB VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO JOB VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO JOB VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO JOB VALUES (4,'President',20000.00,40000.00);
INSERT INTO JOB VALUES (5,'Admin Vice President',15000.00,30000.00);
INSERT INTO JOB VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO JOB VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO JOB VALUES (8,'HR Representative',4000.00,9000.00);
INSERT INTO JOB VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO JOB VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO JOB VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO JOB VALUES (12,'PR Representative',4500.00,10500.00);
INSERT INTO JOB VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO JOB VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO JOB VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO JOB VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO JOB VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO JOB VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO JOB VALUES (19,'Stock Manager',5500.00,8500.00);

/*checking values in JOB table*/
SELECT * FROM JOB;

/*creating DEPARTMENT table*/
CREATE TABLE DEPARTMENT (
 department_id VARCHAR(25),
 department_name VARCHAR (100),
 location_id VARCHAR(25),
 PRIMARY KEY (department_id),
   FOREIGN KEY (location_id) REFERENCES LOCATION (location_id)
);

/*inserting values in DEPARTMENT table*/
INSERT INTO DEPARTMENT VALUES (1,'Administration',1700);
INSERT INTO DEPARTMENT VALUES (2,'Marketing',1800);
INSERT INTO DEPARTMENT VALUES (3,'Purchasing',1700);
INSERT INTO DEPARTMENT VALUES (4,'Human Resources',2400);
INSERT INTO DEPARTMENT VALUES (5,'Shipping',1500);
INSERT INTO DEPARTMENT VALUES (6,'IT',1400);
INSERT INTO DEPARTMENT VALUES (7,'Public Relations',2700);
INSERT INTO DEPARTMENT VALUES (8,'Sales',2500);
INSERT INTO DEPARTMENT VALUES (9,'Executive',1700);
INSERT INTO DEPARTMENT VALUES (10,'Finance',1700);
INSERT INTO DEPARTMENT VALUES (11,'Accounting',1700);

/*checking values in DEPARTMENT table*/
SELECT * FROM DEPARTMENT;

/*Creating EMPLOYEE table*/
CREATE TABLE EMPLOYEE (
 employee_id VARCHAR(25),
 first_name VARCHAR (100),
 last_name VARCHAR (100),
 email VARCHAR (100),
 phone_number VARCHAR (25),
 hire_date DATE NOT NULL,
 job_id VARCHAR(25) NOT NULL,
 salary DECIMAL (8,2) NOT NULL,
 manager_id VARCHAR(25),
 department_id VARCHAR(25),
 PRIMARY KEY (employee_id),
   FOREIGN KEY (department_id) REFERENCES DEPARTMENT (department_id),
   FOREIGN KEY (job_id) REFERENCES JOB (job_id)
);

/*inserting values into EMPLOYEE table*/
INSERT INTO EMPLOYEE VALUES (100,'Steven','King','king@sql.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO EMPLOYEE VALUES (101,'Neena','Kochhar','kochhar@sql.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO EMPLOYEE VALUES (102,'Lex','De Haan',' haan@sql.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO EMPLOYEE VALUES (103,'Alexander','Hunold','hunold@sql.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO EMPLOYEE VALUES (104,'Bruce','Ernst','ernst@sql.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO EMPLOYEE VALUES (105,'David','Austin','austin@sql.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO EMPLOYEE VALUES (106,'Valli','Pataballa','pataballa@sql.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO EMPLOYEE VALUES (107,'Diana','Lorentz','lorentz@sql.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO EMPLOYEE VALUES (108,'Nancy','Greenberg','greenberg@sql.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO EMPLOYEE VALUES (109,'Daniel','Faviet','faviet@sql.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO EMPLOYEE VALUES (110,'John','Chen','chen@sql.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO EMPLOYEE VALUES (111,'Ismael','Sciarra','sciarra@sql.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO EMPLOYEE VALUES (112,'Jose Manuel','Urman','urman@sql.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO EMPLOYEE VALUES (113,'Luis','Popp','popp@sql.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO EMPLOYEE VALUES (114,'Den','Raphaely','raphaely@sql.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO EMPLOYEE VALUES (115,'Alexander','Khoo','khoo@sql.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO EMPLOYEE VALUES (116,'Shelli','Baida','baida@sql.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO EMPLOYEE VALUES (117,'Sigal','Tobias','tobias@sql.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO EMPLOYEE VALUES (118,'Guy','Himuro','himuro@sql.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO EMPLOYEE VALUES (119,'Karen','Colmenares','colmenares@sql.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO EMPLOYEE VALUES (120,'Matthew','Weiss','weiss@sql.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO EMPLOYEE VALUES (121,'Adam','Fripp','fripp@sql.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO EMPLOYEE VALUES (122,'Payam','Kaufling','kaufling@sql.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO EMPLOYEE VALUES (123,'Shanta','Vollman','vollman@sql.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO EMPLOYEE VALUES (126,'Irene','Mikkilineni','mikkilineni@sqll.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO EMPLOYEE VALUES (145,'John','Russell','russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO EMPLOYEE VALUES (146,'Karen','Partners','partners@sql.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO EMPLOYEE VALUES (176,'Jonathon','Taylor','taylor@sql.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO EMPLOYEE VALUES (177,'Jack','Livingston','livingston@sql.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO EMPLOYEE VALUES (178,'Kimberely','Grant','grant@sql.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO EMPLOYEE VALUES (179,'Charles','Johnson','johnson@sql.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO EMPLOYEE VALUES (192,'Sarah','Bell','bell@sql.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO EMPLOYEE VALUES (193,'Britney','Everett','everett@sql.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO EMPLOYEE VALUES (200,'Jennifer','Whalen','whalen@sql.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO EMPLOYEE VALUES (201,'Michael','Hartstein','hartstein@sql.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO EMPLOYEE VALUES (202,'Pat','Fay','pat.fay@sql.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO EMPLOYEE VALUES (203,'Susan','Mavris','mavris@sql.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO EMPLOYEE VALUES (204,'Hermann','Baer','baer@sql.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO EMPLOYEE VALUES (205,'Shelley','Higgins','higgins@sql.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO EMPLOYEE VALUES (206,'William','Gietz','gietz@sql.org','515.123.8181','1994-06-07',1,8300.00,205,11);

/*checking values in EMPLOYEE table*/
SELECT * FROM EMPLOYEE;

/*creating DEPENDANT table*/
CREATE TABLE DEPENDENT (
 dependent_id VARCHAR(25) NOT NULL,
 first_name VARCHAR (100) NOT NULL,
 last_name VARCHAR (100) NOT NULL,
 relationship VARCHAR (100),
 employee_id VARCHAR(25) NOT NULL,
 PRIMARY KEY (dependent_id),
   FOREIGN KEY (employee_id) REFERENCES EMPLOYEE (employee_id)
);

/*inserting values into DEPENDANT table*/
INSERT INTO DEPENDENT VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO DEPENDENT VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO DEPENDENT VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO DEPENDENT VALUES (4,'Jennifer','King','Child',100);
INSERT INTO DEPENDENT VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO DEPENDENT VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO DEPENDENT VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO DEPENDENT VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO DEPENDENT VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO DEPENDENT VALUES (10,'Christian','Urman','Child',112);
INSERT INTO DEPENDENT VALUES (11,'Zero','Popp','Child',113);
INSERT INTO DEPENDENT VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO DEPENDENT VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO DEPENDENT VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO DEPENDENT VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO DEPENDENT VALUES (16,'Fred','Austin','Child',105);
INSERT INTO DEPENDENT VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO DEPENDENT VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO DEPENDENT VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO DEPENDENT VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO DEPENDENT VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO DEPENDENT VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO DEPENDENT VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO DEPENDENT VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO DEPENDENT VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO DEPENDENT VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO DEPENDENT VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO DEPENDENT VALUES (28,'Woody','Russell','Child',145);
INSERT INTO DEPENDENT VALUES (29,'Alec','Partners','Child',146);
INSERT INTO DEPENDENT VALUES (30,'Sandra','Taylor','Child',176);

/*checking values in DEPENDENT table*/
SELECT *FROM DEPENDENT;

