CREATE DATABASE EMP_DETAILS;
USE EMP_DETAILS;
CREATE OR REPLACE TABLE EMPLOYEE (
					EMP_ID INT NOT NULL,
                    NAME VARCHAR(40) NOT NULL,
                    BIRTHDATE DATE NOT NULL,
                    GENDER VARCHAR(10) NOT NULL,
                    HIRE_DATE DATE NOT NULL,
                    PRIMARY KEY (EMP_ID)
				    );
                    
INSERT INTO EMPLOYEE 
VALUES  (101, 'Bryan', '1988-08-12', 'M', '2015-08-26'),
		(102, 'Joseph', '1978-05-12', 'M', '2014-10-21'),
		(103, 'Mike', '1984-10-13', 'M', '2017-10-28'),
        (104, 'Daren', '1979-04-11', 'M', '2006-11-01'),
        (105, 'Marie', '1990-02-11', 'F', '2018-10-12');
        
        
CREATE OR REPLACE TABLE PAYMENT (
                      PAYMENT_ID INT PRIMARY KEY,
                      EMP_ID INT NOT NULL,
                      AMOUNT FLOAT NOT NULL,
                      PAYMENT_DATE DATE NOT NULL,
                      FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID) ON DELETE CASCADE );

INSERT INTO Payment  
VALUES	(301, 101, 1200, '2015-09-15'),
		(302, 101, 1200, '2015-09-30'),
		(303, 101, 1500, '2015-10-15'),
		(304, 101, 1500, '2015-10-30'),
		(305, 102, 1800, '2015-09-15'),
		(306, 102, 1800, '2015-09-30');               
                      
                      
CREATE TABLE PK_EMP_PAY_DETAILS AS 
SELECT EMP.*,PAY.PAYMENT_ID,PAY.AMOUNT,PAY.PAYMENT_DATE
FROM EMPLOYEE AS EMP
LEFT OUTER JOIN PAYMENT AS PAY ON EMP.EMP_ID = PAY.EMP_ID ;
                      
SELECT * FROM PK_EMP_PAY_DETAILS;

SELECT * FROM EMPLOYEE;
SELECT * FROM PAYMENT;
DELETE FROM EMPLOYEE WHERE EMP_ID = 102;

