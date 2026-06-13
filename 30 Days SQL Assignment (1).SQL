--create Database
CREATE DATABASE Hospital_Data;

--switch to the database
\c Hospital_Data;


--create table
Drop Table if exists Hospital_Data;

CREATE TABLE Hospital_Data(
Hospital_Name VARCHAR(255),
Location VARCHAR(100),
Department VARCHAR(100),	
Doctors_Count INT,	
Patients_Count INT,	
Admission_Date DATE,	
Discharge_Date DATE,	
Medical_Expenses NUMERIC
);


SELECT * FROM Hospital_Data;

--Import Data into Hospital_Data Table
COPY Hospital_Data(Hospital_Name, Location,	Department,	Doctors_Count, Patients_Count, Admission_Date, Discharge_Date, Medical_Expenses)
FROM'C:\Hospital_Data.csv'
CSV HEADER;



SELECT * FROM Hospital_Data
WHERE Genre='Fiction';


--1) Total Number of Patients:
SELECT SUM(Patients_Count) AS Total_Patients
FROM Hospital_Data;


--2) Average Number of Doctors per Hospital:
SELECT Hospital_Name,
   AVG(Doctors_count) AS Avg_Doctors
 FROM Hospital_Data
 GROUP BY Hospital_Name;



--3) Top 3 Departments with Highest Number of Patients:
SELECT Department,
  SUM(Patients_Count) AS Total_Patients
FROM Hospital_Data
GROUP BY Department
ORDER BY Total_Patients DESC
LIMIT 3;


--4) Hospital with Maximum Medical Expenses:
SELECT Hospital_Name,
   Medical_Expenses
 FROM Hospital_Data
 ORDER BY Medical_Expenses DESC
 LIMIT 3;


--5) Daily Average Medical Expenses:
SELECT Hospital_Name,
   AVG(Medical_Expenses)AS
Daily_Avg_Expense
FROM Hospital_Data
GROUP BY Hospital_Name;


--6)Longest Hospital Stay:
SELECT Hospital_name,
(Admission_Date,Discharge_Date)
AS Stay_Days
FROM Hospital_Data
ORDER BY Stay_Days DESC
LIMIT 1;


--7)Total Patients Treated Per City:
SELECT Location,
   SUM(Patients_Count)AS Total_Patients
 FROM Hospital_Data
 GROUP BY Location;


--8)Average Length of Stay Per Department:
SELECT Department,
    AVG(Admission_Date-Discharge_Date)AS Avg_Stay_Days
	FROM Hospital_Data
	GROUP BY Department;



--9) Department with Lowest Number of Patients:
SELECT Department,
  SUM(Patients_Count)AS Total_Patients
 FROM Hospital_Data
 GROUP BY Department
 ORDER BY Total_Patients ASC
 LIMIT 1;



--10)Monthly Medical Expenses Report:
SELECT EXTRACT(YEAR FROM Admission_Date) AS Year,
  EXTRACT(MONTH FROM Admission_Date) AS Month,
  SUM(Medical_Expenses) AS Total_Expenses
FROM Hospital_Data
GROUP BY EXTRACT(YEAR FROM Admission_Date),
   EXTRACT(MONTH FROM Admission_Date)
 ORDER By Year, Month;  













	






































 



















