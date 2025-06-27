# Task 4: Aggregate Functions and Grouping
SQL Aggregate Functions, Grouping, and HAVING Clause

This collection of SQL queries demonstrates the use of aggregate functions, grouping techniques, and the `HAVING` clause to summarize and analyze data from an `EMP` table.

These queries use SQL aggregate functions like `SUM`, `AVG`, `COUNT`, `MAX`, and `MIN`.

-- Total salary
SELECT SUM(SAL) TS FROM EMP;

-- Total of distinct salaries
SELECT SUM(DISTINCT SAL) TS FROM EMP;

-- Average salary (with and without duplicates)
SELECT AVG(SAL) R1, AVG(DISTINCT SAL) R2 FROM EMP;

-- Commission analysis
SELECT SUM(COMM) R1, COUNT(COMM) R2, AVG(COMM) R3 FROM EMP;

-- Count variations
SELECT COUNT(JOB) R1, COUNT(DISTINCT JOB) R2, COUNT(SAL) R3, COUNT(DISTINCT SAL) R4 FROM EMP;
SELECT COUNT(DEPTNO) R1, COUNT(DISTINCT DEPTNO) R2 FROM EMP;

-- Combined aggregations
SELECT SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(SAL) R5 FROM EMP;
-- Aggregates with filters
SELECT SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(SAL) R5 FROM EMP WHERE JOB='CLERK';
SELECT SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(SAL) R5 FROM EMP WHERE DEPTNO=10;
SELECT SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(SAL) R5 FROM EMP WHERE TO_CHAR(HIREDATE,'YYYY')='1981';

-- Total employee count
SELECT COUNT(*) NOE FROM EMP;
SELECT COUNT(1) NOE FROM EMP;

--GROUP BY Queries
Group data by DEPTNO, JOB, or HIREDATE and apply aggregate functions.
-- Group by department
SELECT DEPTNO, SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(SAL) R5 FROM EMP GROUP BY DEPTNO;
-- Group by department with all rows
SELECT SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(*) R5 FROM EMP GROUP BY DEPTNO;

--HAVING Clause
Use the HAVING clause to filter grouped data based on aggregate results.
-- Departments with total salary over 9000
SELECT DEPTNO, SUM(SAL) TOTSAL FROM EMP GROUP BY DEPTNO HAVING SUM(SAL) > 9000;
-- Filter by total salary and department
SELECT DEPTNO, SUM(SAL) TOTSAL FROM EMP GROUP BY DEPTNO HAVING SUM(SAL) > 9000 AND DEPTNO = 20;
