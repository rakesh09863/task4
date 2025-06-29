----- aggregate functions
SELECT SUM(SAL) TS FROM EMP;
SELECT SUM(DISTINCT SAL) TS FROM EMP;
SELECT AVG(SAL) R1, AVG(DISTINCT SAL) R2 FROM EMP;
SELECT SUM(COMM) R1, COUNT(COMM) R2, AVG(COMM) R3 FROM EMP;
SELECT COUNT(JOB) R1, COUNT(DISTINCT JOB) R2, COUNT(SAL) R3, COUNT(DISTINCT SAL) R4 FROM EMP;
SELECT COUNT(DEPTNO) R1, COUNT(DISTINCT DEPTNO) R2 FROM EMP;
SELECT SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(SAL) R5 FROM EMP;
SELECT SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(SAL) R5 FROM EMP WHERE JOB='CLERK';
SELECT SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(SAL) R5 FROM EMP WHERE DEPTNO=10;
SELECT SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(SAL) R5 FROM EMP  WHERE TO_CHAR(HIREDATE,'YYYY')=1981;
SELECT COUNT(*) NOE FROM EMP;
SELECT COUNT(1) NOE FROM EMP;

------group by
SELECT DEPTNO, SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(SAL) R5 FROM EMP GROUP BY DEPTNO;
SELECT SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(*) R5 FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(*) R5 FROM EMP GROUP BY DEPTNO;
SELECT JOB, SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(*) R5 FROM EMP GROUP BY JOB;
SELECT TO_CHAR(HIREDATE,'YYYY') AS YEAR, SUM(SAL) R1, AVG(SAL) R2, MAX(SAL) R3, MIN(SAL) R4, COUNT(*) R5 FROM EMP GROUP BY TO_CHAR(HIREDATE,'YYYY');
SELECT DEPTNO, JOB, SUM(SAL) TOTSAL, COUNT(*) NOE  FROM EMP GROUP BY DEPTNO, JOB ORDER BY DEPTNO, JOB;
SELECT JOB, DEPTNO, SUM(SAL) TS, COUNT(*) NOE FROM EMP GROUP BY JOB, DEPTNO ORDER BY JOB, DEPTNO;
--------HAVING
SELECT DEPTNO, SUM(SAL) TOTSAL FROM EMP GROUP BY DEPTNO HAVING SUM(SAL)>9000;
SELECT DEPTNO, SUM(SAL) TOTSAL FROM EMP GROUP BY DEPTNO HAVING SUM(SAL)>9000 AND DEPTNO=20;
SELECT DEPTNO,ROUND(AVG(SAL)) AVGSAL FROM EMP GROUP BY DEPTNO HAVING ROUND(AVG(SAL))>1000; 
SELECT DEPTNO,COUNT(*) FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>2;
