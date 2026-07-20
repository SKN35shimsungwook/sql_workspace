


/*
 VARCHAR, TEXT타입의 데이터 대소문자 구분을 안한다.
 대소문자를 구분할려면 VARBINARY타입을 사용해야 한다.
*/

-- SELECT 입력순서
/*
SELECT column_name, column_name, column_name
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
ORDER BY column_name ASC(DESC);
*/

-- SELECT 해석순서
/*
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
SELECT column_name, column_name, column_name
ORDER BY column_name ASC(DESC);
*/



-- employees테이블에서 salary이 3000미만일때
-- first_name, salary을 출력하라.

show databases;
SELECT first_name, salary
FROM EMPLOYEES
WHERE  salary < 3000;

-- employees테이블에서 first_컬럼의 값이 'david'일 때
-- first_name, salary을 출력하라.

SELECT first_name, salary
FROM EMPLOYEES
WHERE  first_name = 'David';




-- employees테이블에서 first_name컬럼의 값이 'David' 아닐때의
-- first_name, salary을 출력하라.

SELECT first_name, salary
FROM EMPLOYEES
WHERE  first_name != 'David';


SELECT first_name, salary
FROM EMPLOYEES
WHERE  first_name <> 'David';




-- &&(AND), ||(OR)
-- employees테이블에서 salary이 3000, 9000, 17000일때
-- first_name, hire_date, salary을 출력하라.
SELECT first_name, salary
FROM EMPLOYEES
WHERE  salary = 3000 OR salary = 9000 OR salary = 17000;

SELECT first_name, salary
FROM EMPLOYEES
WHERE salary IN (3000,9000,17000);




-- employees테이블에서 salary이 3000이상 5000이하일때
-- first_name, hire_date, salary을 출력하라.
SELECT first_name, salary
FROM EMPLOYEES
WHERE  salary >= 3000 AND salary <= 5000;

SELECT first_name, salary
FROM EMPLOYEES
WHERE salary BETWEEN 3000 AND 5000;

-- 현재 사용 중인 데이터 베이스 확인
SELECT DATABASE();


-- employees테이블에서 job_id가 'IT_PROG'이 아닐때
-- first_name, hire_date, salary, job_id을 출력하라.
SELECT first_name, hire_date, salary, job_id
FROM employees
WHERE job_id != 'IT_PROG';
SELECT first_name, hire_date, salary, job_id
FROM employees
WHERE job_id <> 'IT_PROG';
SELECT first_name, hire_date, salary, job_id
FROM employees
WHERE NOT(job_id = 'IT_PROG');

-- employees테이블에서 salary이 3000, 9000, 17000 아닐때
-- first_name, hire_date, salary을 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT(salary=3000 OR salary=9000 OR salary=17000);
SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT IN(3000, 9000, 17000);


-- employees테이블에서 salary이 3000이상 5000이하가 아닐때
-- first_name, hire_date, salary을 출력하라.
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT(salary >= 3000 AND salary <= 5000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 5000;


-- employees테이블에서 commission_pct이 null일때
-- first_name, salary, commission_pct을 출력하라.


SELECT first_name, salary, email
FROM employees
WHERE COMMISSION_PCt  IS NOT NULL;

SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE '%DER%';


-- employees테이블에서 first_name의 값중 'A'로 시작하고 
-- 두번째 문자는 임의 문자이며 'exander'로 끝날때
-- first_name, salary, email을 출력하라.
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exande';


 /*
 WHERE절에서 사용된 연산자 3가지 종류
 1 비교연산자 : = > >= < <= != <> 
 2 SQL연산자 : BETWEEN a AND b,  IN, LIKE, IS NULL
 3 논리연산자 : AND, OR, NOT
 
 우선순위
 1 괄호()
 2 NOT연산자
 3 비교연산자, SQL연산자
 4 AND
 5 OR
  */

  -- employees테이블에서 job_id을 오름차순으로 
  -- first_name, email, job_id을 출력하시오. 

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id ASC;

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id ;

 -- employees테이블에서 가장 최근 입사 순으로 
  -- first_name, salary, hire_date을 출력하시오. 

SELECT first_name, salary, HIRE_DATE 
FROM employees
ORDER BY HIRE_DATE  DESC;


-- employees테이블에서 가장 최근 입사 순, 급여는 낮은순 으로
-- first_name, salary, hire_date을 출력하시오.
SELECT first_name, salary, HIRE_DATE 
FROM employees
ORDER BY HIRE_DATE  DESC, salary ASC;

-- employees테이블에서 업무(job_id)이 'FI_ACCOUNT'인 사원들의 
-- 급여(salary)가 높은순으로 first_name, job_id, salary을 출력하시오. 
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'FI_ACCOUNT'
ORDER BY salary DESC;





















