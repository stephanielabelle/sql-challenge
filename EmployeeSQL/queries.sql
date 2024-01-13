-- 1. List the employee number, last name, first name, sex, and salary of each employee

SELECT E.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	E.SEX,
	S.SALARY
FROM EMPLOYEES E
JOIN SALARIES S ON E.EMP_NO = S.EMP_NO;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986

SELECT FIRST_NAME,
	LAST_NAME,
	HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '%1986'

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT MAN.DEPT_NO,
	DEP.DEPT_NAME,
	MAN.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME
FROM DEPT_MANAGER AS MAN
JOIN DEPARTMENTS AS DEP ON DEP.DEPT_NO = MAN.DEPT_NO
JOIN EMPLOYEES AS E ON MAN.EMP_NO = E.EMP_NO;
	
-- 4. List the department number of each employee along with that employee number, last name, first name, and department name

SELECT DEMP.DEPT_NO,
	DEMP.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	DEP.DEPT_NAME
FROM DEPT_EMP AS DEMP
JOIN DEPARTMENTS AS DEP ON DEP.DEPT_NO = DEMP.DEPT_NO
JOIN EMPLOYEES AS E ON E.EMP_NO = DEMP.EMP_NO
ORDER BY E.EMP_NO;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT FIRST_NAME,
	LAST_NAME,
	SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules'
	AND LAST_NAME like 'B%';
	
-- 6. List each employee in the Sales department, including employee number, last name, and first name.

SELECT DEMP.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME
FROM DEPT_EMP AS DEMP
JOIN DEPARTMENTS AS DEP ON DEP.DEPT_NO = DEMP.DEPT_NO
JOIN EMPLOYEES AS E ON E.EMP_NO = DEMP.EMP_NO
WHERE DEP.DEPT_NAME = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT DEMP.EMP_NO,
	E.LAST_NAME,
	E.FIRST_NAME,
	DEP.DEPT_NAME
FROM DEPT_EMP AS DEMP
JOIN DEPARTMENTS AS DEP ON DEP.DEPT_NO = DEMP.DEPT_NO
JOIN EMPLOYEES AS E ON E.EMP_NO = DEMP.EMP_NO
WHERE DEP.DEPT_NAME = 'Sales'
	OR DEP.DEPT_NAME = 'Development';

-- 8. List the frequency counts, in desc, of all employee last names

SELECT LAST_NAME,
	COUNT(LAST_NAME) AS NUM
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY NUM DESC;