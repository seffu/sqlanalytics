CREATE DATABASE Classroom;
use Classroom;
CREATE TABLE science_class (
    Enrollment_no INT,
    Name VARCHAR,
    Science_Marks INT
);

INSERT INTO science_class 
VALUES 
    (1, 'Popeye', 22), 
    (2, 'Olive', 54), 
    (3, 'Brutus', 98);

COPY science_class FROM '/home/skn/Desktop/Projects/DE/SQL/SQL_Analytics/Data/Student.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM science_class;

SELECT name
FROM science_class
WHERE science_marks > 60;

SELECT enrollment_no,name,science_marks
FROM science_class
WHERE science_marks > 35 AND science_marks < 60;

SELECT * 
FROM science_class 
WHERE science_marks BETWEEN 35 AND 60;

SELECT enrollment_no,name,science_marks
FROM science_class
WHERE science_marks <= 35 OR science_marks >= 60;

SELECT * 
FROM science_class 
WHERE science_marks NOT BETWEEN 35 AND 60;

UPDATE science_class
SET science_marks = 45
WHERE name="Popeye";

DELETE FROM science_class
WHERE name = 'Robb';

ALTER TABLE science_class
RENAME name TO student_name;

DROP TABLE science_class;

SELECT DISTINCT(city) 
FROM customer
WHERE region IN ('East','South');

SELECT *
FROM sales
WHERE sales BETWEEN 100 AND 500;

SELECT * 
FROM customer 
WHERE customer_name LIKE '____';

SELECT * 
FROM sales
WHERE discount > 0
ORDER BY discount DESC; 

SELECT * 
FROM sales
WHERE discount > 0
ORDER BY discount DESC
LIMIT 10; 


SELECT SUM(sales) AS Total_Sales
FROM sales;

SELECT count(0)
FROM customer
WHERE region = 'North' AND age BETWEEN 20 AND 30;

SELECT AVG(age) AS Average_Age
FROM customer
WHERE region = 'East';

SELECT MIN(age) AS Minimum_Age, MAX(age) AS Maximum_Age
FROM customer
WHERE city = 'Philadelphia';