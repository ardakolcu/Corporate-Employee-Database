CREATE DATABASE db_ArdaKolcu 
GO 
ALTER DATABASE db_ArdaKolcu SET COMPATIBILITY_LEVEL = 160 
GO 
USE db_ArdaKolcu 
GO 
CREATE TABLE tbl_Users ( 
User_ID INT PRIMARY KEY IDENTITY(1,1), 
User_Name VARCHAR(50) NOT NULL, 
User_Password VARCHAR(50) NOT NULL, 
Role_ID INT) 
GO 
CREATE TABLE tbl_Categories ( 
C_ID INT PRIMARY KEY IDENTITY(1,1), 
Gender VARCHAR(10), 
Title VARCHAR(50), 
District_Name VARCHAR(50), 
City_Name VARCHAR(50), 
Country VARCHAR(50), 
Month_Name VARCHAR(20), 
Role_Type VARCHAR(50)) 
GO 
7 
CREATE TABLE tbl_Departments ( 
Dept_ID INT PRIMARY KEY IDENTITY(1,1), 
Dept_Name VARCHAR(50) NOT NULL, 
Dept_Phone VARCHAR(20), 
Manager_ID INT) 
GO 
CREATE TABLE tbl_Employees ( 
Emp_ID INT PRIMARY KEY IDENTITY(1,1), 
Emp_FirstName VARCHAR(50) NOT NULL, 
Emp_LastName VARCHAR(50) NOT NULL, 
Emp_BirthDate DATE, 
Emp_HireDate DATE, 
Emp_ExitDate DATE, 
Emp_Address VARCHAR(255), 
Emp_District VARCHAR(50), 
Emp_City VARCHAR(50), 
Emp_City_Code VARCHAR(10), 
Emp_Phone VARCHAR(20), 
Emp_Mobile VARCHAR(20), 
Emp_Email VARCHAR(100), 
Dept_ID INT, 
Gender_ID INT, 
Title_ID INT, 
Emp_Base_Salary DECIMAL(18,2), 
Emp_Comm_Perc DECIMAL(5,2), 
Emp_Photo VARCHAR(255), 
Emp_CV VARCHAR(MAX), 
Emp_CV_File VARCHAR(255), 
Emp_CV_Web VARCHAR(255), 
Emp_Is_Active BIT, 
RecordedBy_ID INT, 
Record_Date DATETIME) 
GO 
CREATE TABLE tbl_Salaries ( 
Salary_ID INT PRIMARY KEY IDENTITY(1,1), 
Emp_ID INT NOT NULL, 
Salary_Date DATE, 
Salary_Amount DECIMAL(18,2) NOT NULL, 
Salary_Commission DECIMAL(18,2), 
Month_ID INT) 
GO 
INSERT INTO tbl_Categories (Gender, Title, District_Name, City_Name, Country, Month_Name, Role_Type) 
VALUES  
('Male', 'Data Analyst', 'Sisli', 'Istanbul', 'Turkey', 'January', 'Full-Time'), 
('Female', 'HR Manager', 'Kadikoy', 'Istanbul', 'Turkey', 'February', 'Contract'), 
('Male', 'Software Specialist', 'Besiktas', 'Istanbul', 'Turkey', 'March', 'Part-Time'), 
('Female', 'Finance Manager', 'Sariyer', 'Istanbul', 'Turkey', 'April', 'Full-Time'), 
('Male', 'Intern', 'Uskudar', 'Istanbul', 'Turkey', 'May', 'Intern'); 
GO 
INSERT INTO tbl_Departments (Dept_Name, Dept_Phone, Manager_ID) 
VALUES  
('Information Technology (IT)', '02125551001', 1), 
('Human Resources', '02125551002', 2), 
('Marketing', '02125551003', 3), 
('Finance and Accounting', '02125551004', 4), 
('Management', '02125551005', 5); 
GO 
8 
INSERT INTO tbl_Employees (Emp_FirstName, Emp_LastName, Emp_BirthDate, Emp_HireDate, Emp_ExitDate, 
Emp_Address, Emp_District, Emp_City, Emp_City_Code, Emp_Phone, Emp_Mobile, Emp_Email, Dept_ID, Gender_ID, 
Title_ID, Emp_Base_Salary, Emp_Comm_Perc, Emp_Photo, Emp_CV, Emp_CV_File, Emp_CV_Web, Emp_Is_Active, 
RecordedBy_ID, Record_Date) 
VALUES  
('Ali', 'Yilmaz', '1990-05-15', '2020-01-10', NULL, 'Ataturk Ave. No:1', 'Sisli', 'Istanbul', '34', '02125550001', 
'05325550001', 'ali.yilmaz@company.com', 1, 1, 1, 35000.00, 0.00, NULL, NULL, NULL, NULL, 1, 1, GETDATE()), 
('Ayse', 'Demir', '1992-08-22', '2021-03-15', NULL, 'Cumhuriyet St. No:2', 'Kadikoy', 'Istanbul', '34', '02125550002', 
'05325550002', 'ayse.demir@company.com', 2, 2, 2, 40000.00, 5.00, NULL, NULL, NULL, NULL, 1, 1, GETDATE()), 
('Mehmet', 'Kaya', '1988-11-30', '2019-06-01', NULL, 'Baris St. No:3', 'Besiktas', 'Istanbul', '34', '02125550003', 
'05325550003', 'mehmet.kaya@company.com', 3, 1, 3, 38000.00, 10.50, NULL, NULL, NULL, NULL, 1, 2, GETDATE()), 
('Fatma', 'Celik', '1995-02-14', '2022-09-01', NULL, 'Gunes Blvd. No:4', 'Sariyer', 'Istanbul', '34', '02125550004', 
'05325550004', 'fatma.celik@company.com', 4, 2, 4, 45000.00, 0.00, NULL, NULL, NULL, NULL, 1, 2, GETDATE()), 
('Can', 'Ozturk', '1998-07-07', '2023-01-20', NULL, 'Yildiz Ave. No:5', 'Uskudar', 'Istanbul', '34', '02125550005', 
'05325550005', 'can.ozturk@company.com', 5, 1, 5, 25000.00, NULL, NULL, NULL, NULL, NULL, 1, 1, GETDATE()); 
GO 
INSERT INTO tbl_Salaries (Emp_ID, Salary_Date, Salary_Amount, Salary_Commission, Month_ID) 
VALUES  
(1, '2026-05-15', 35000.00, 0.00, 5), 
(2, '2026-05-15', 40000.00, 2000.00, 5), 
(3, '2026-05-15', 38000.00, 3990.00, 5), 
(4, '2026-05-15', 45000.00, 0.00, 5), 
(5, '2026-05-15', 25000.00, 500.00, 5); 
GO 
INSERT INTO tbl_Users (User_Name, User_Password, Role_ID) 
VALUES  
('admin_arda', 'Arda1234!', 1), 
('hr_merve', 'MerveHR_456', 2), 
('user_ahmet', 'Ahmet789?', 3), 
('user_ayse', 'AysePass321', 3), 
('it_mehmet', 'ITMehmet_00', 4); 
GO 
ALTER TABLE tbl_Employees ADD CONSTRAINT FK_Emp_Dept FOREIGN KEY (Dept_ID) REFERENCES 
tbl_Departments(Dept_ID); 
ALTER TABLE tbl_Employees ADD CONSTRAINT FK_Emp_Gender FOREIGN KEY (Gender_ID) REFERENCES 
tbl_Categories(C_ID); 
ALTER TABLE tbl_Employees ADD CONSTRAINT FK_Emp_Title FOREIGN KEY (Title_ID) REFERENCES 
tbl_Categories(C_ID); 
ALTER TABLE tbl_Employees ADD CONSTRAINT FK_Emp_RecordedBy FOREIGN KEY (RecordedBy_ID) REFERENCES 
tbl_Users(User_ID); 
GO 
ALTER TABLE tbl_Salaries ADD CONSTRAINT FK_Sal_Emp FOREIGN KEY (Emp_ID) REFERENCES 
tbl_Employees(Emp_ID); 
ALTER TABLE tbl_Salaries ADD CONSTRAINT FK_Sal_Month FOREIGN KEY (Month_ID) REFERENCES 
tbl_Categories(C_ID); 
GO 
ALTER TABLE tbl_Users ADD CONSTRAINT FK_User_Role FOREIGN KEY (Role_ID) REFERENCES tbl_Categories(C_ID); 
ALTER TABLE tbl_Departments ADD CONSTRAINT FK_Dept_Manager FOREIGN KEY (Manager_ID) REFERENCES 
tbl_Employees(Emp_ID); 
GO 
SELECT * FROM tbl_Categories; 
SELECT * FROM tbl_Departments; 
SELECT * FROM tbl_Employees; 
SELECT * FROM tbl_Salaries; 
SELECT * FROM tbl_Users; 
GO