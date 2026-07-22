/*================================================================================
 WITH 절과 CTE
 
 WITH절은 CTE(Common Table Expression)를 표현하기 위한 구문으로 MySQL8.0부터  사용할 수 있다.
 CTE는 기존의 뷰, 파생테이블, 임시 테이블 등으로 사용되던 것을 대신할 수 있다.
 CTE는 ANSI-SQL99 표준에서 나온 것이다. 기존의 SQL ANSI-SQL92를 기준으로 한다.
 최근의 DBMS(DataBase Management System)는 대개 ANSI-SQL99와 호환되므로  다른 DBMS에서도 같거나
 비슷한 방식으로 응용한다.
 CTE는 비재귀적(Non-Recursive) CTE와 재귀적(Recursive) CTE두 가지가 있다.
 
 <비재귀적(Non-Recursive) CTE>
 WITH CTE_테이블이름(열이름)
 AS
 (
   쿼리문;
 )
 SELECT 열이름 FROM CTE_테이블이름;
 ===================================================================================*/

WITH deptcnt(id, total)
AS 
(SELECT department_id, count(*)
FROM employees
GROUP BY department_id)
SELECT id, total FROM deptcnt;




/*==========================================================
SQL의 분류

1 DML(Data Manipulation Language 데이터 조작어) : 
  데이터는 검색, 추가, 수정, 삭제,병합해주는 명령어들이다.
  (select, insert, update, delete,merge)
2 DDL(Data Definition Language 데이터 정의어 ) : 
  테이블의 구조를 정의, 변경해주는 명령어들이다.
  (create, drop, alter, truncate)
3 DCL(Data Control Language 데이터 제어어) : 
  사용자의 권한을 부여,제거해주는 명령어들이다.(grant ,revoke)
4 TCL(Transaction Control Language 트랜잭션 처리어) : 
  트랜잭션 설정,취소을 처리해주는 명령어들이다
  (commit, rollback, savepoint)
==========================================================*/


/*===============================
https://dev.mysql.com/doc/refman/8.4/en/data-types.html
테이블 구조 정의
CREATE TABLE table_name(
  column_name datatype,
  column_name datatype
);

자료형(datatype)
varchar - 가변길이 문자를 저장
char - 고정길이 문자를 저장
int-정수저장
decimal(m,n)- 실수저장
date - 날짜 저장
===============================*/




SELECT DATABASE();

CREATE TABLE student(
  name varchar(20),
  age int,
  avg decimal(5,2),
  hire date
);

SELECT * FROM student;

-- 테이블 구조 학인(Describe)
DESC student;



 -- 1) 데이터 삽입 (VALUES 키워드와 괄호 구문 정확히 명시)
INSERT INTO student (name, age, avg, hire)
VALUES ('홍길동', 30, 97.85, CURDATE());
SELECT * FROM student;


INSERT INTO student (name, age, avg, hire)
VALUES ('김민재', 28, 80.2, sysdate());
SELECT * FROM student;

INSERT INTO student 
VALUES ('이수리', 18, 75.3, sysdate());
SELECT * FROM student;

DELETE FROM student 
WHERE name = '이수리';

-- 삭제 후 결과 확인
SELECT * FROM student;

INSERT INTO student (name, age)
VALUES ('세기둥', 10);
SELECT * FROM student;


INSERT INTO student (name, age, avg, hire)
VALUES ('흰둥이', 15, NULL,NULL);
SELECT * FROM student;


INSERT INTO student (name, age, avg, hire)
VALUES ('qkckradaihdadkaskldasdklasdhiasd', 15, NULL,NULL);
SELECT * FROM student;

INSERT INTO student (name, age, avg, hire)
VALUES ('이정재', 15, 1525.98, CURDATE());
SELECT * FROM student;

INSERT INTO student (name, age, avg, hire)
VALUES ('차영주', 15, 15.2598, CURDATE());
SELECT * FROM student;

/*====================================
ALTER 
 객체(테이블)의 구조를 변경해주는 명령어이다.
======================================*/
-- 생성 : CREATE TABLE,  CREATE VIEW, CREATE INDEX
-- 수정 : ALTER TABLE, ALTER VIEW, ALTER INDEX, ALTER USER


-- 테이블에 컬럼을 추가한다
ALTER TABLE student
ADD loc varchar(30);

DESC student;

-- 테이블의 컬럼명을 수정한다

-- [방법 1] MySQL 8.0 이상 표준 구문 (세미콜론으로 문장 구분)
ALTER TABLE student 
RENAME COLUMN avg TO jumsu;

-- 변경된 테이블 구조 확인
DESC student;


INSERT INTO student(name, age, avg, hire)
VALUES('박차고 나온 세상에', 30, 97.2, curdate());
SELECT * FROM student;


ALTER TABLE student 
MODIFY name varchar(10);
 
DESC student;

-- 1. 테이블에 새로운 컬럼(loc) 추가
ALTER TABLE student
ADD loc varchar(30);

DESC student;



-- 변경된 테이블 구조 확인
DESC student;


-- 3. 데이터 삽입 (변경한 컬럼명 'jumsu' 적용)
INSERT INTO student(name, age, jumsu, hire)
VALUES('박차고 나온 세상에', 30, 97.2, curdate());

-- 데이터 입력 결과 확인
SELECT * FROM student;


-- 4. 컬럼 속성 변경 (이름 길이를 고려하여 varchar(20)으로 설정)
ALTER TABLE student 
MODIFY name varchar(30);
 
-- 최종 테이블 구조 확인
DESC student;

-- 1. 원하는 테이블 작업 실행 (예: 컬럼 추가)
ALTER TABLE student 
ADD loc varchar(30);  -- 반드시 문장 끝에 세미콜론(;)을 붙여줍니다!

-- 2. 테이블 구조 확인
DESC student;




-- 1. student 테이블 신규 생성 (기존에 작성하셨던 구조 반영)
CREATE TABLE student (
    name VARCHAR(20),
    age INT,
    jumsu DOUBLE,
    hire DATE,
    loc VARCHAR(30)
);

-- 2. 데이터 입력 테스트
INSERT INTO student(name, age, jumsu, hire)
VALUES('박차고 나온 세상에', 30, 97.2, CURDATE());

-- 3. 테이블 구조 및 데이터 확인
DESC student;
SELECT * FROM student;

-- 1. 원하는 테이블 작업 실행 (예: 컬럼 추가)
ALTER TABLE student 
ADD loc varchar(30);  -- 반드시 문장 끝에 세미콜론(;)을 붙여줍니다!

-- 2. 테이블 구조 확인
DESC student;

-- 1. 컬럼명 변경 (avg -> jumsu)
ALTER TABLE student 
RENAME COLUMN avg TO jumsu;

-- 2. 변경된 구조 확인 (loc 컬럼이 잘 들어있는지 확인)
DESC student;

-- 3. 데이터 삽입 (새로 추가했던 loc 컬럼에도 데이터 입력 가능!)
INSERT INTO student(name, age, jumsu, hire, loc)
VALUES('박차고 나온 세상에', 30, 97.2, CURDATE(), '서울');

-- 4. 전체 데이터 조회
SELECT * FROM student;


-- [1단계] 데이터 삽입하기
-- 주의: 'avg' 대신 바뀐 컬럼명인 'jumsu'를 사용합니다.
INSERT INTO student (name, age, jumsu, hire, loc)
VALUES ('박차고 나온 세상에', 30, 97.2, CURDATE(), '서울');

-- [2단계] 결과 확인하기
-- 전체 데이터 조회
SELECT * FROM student;

-- 테이블 구조 재확인 (컬럼 목록 및 데이터 타입 확인)
DESC student;

UPDATE members
SET age=
-- [1단계] 데이터 삽입하기
-- 주의: 'avg' 대신 바뀐 컬럼명인 'jumsu'를 사용합니다.
INSERT INTO student (name, age, jumsu, hire, loc)
VALUES ('박차고 나온 세상에', 30, 97.2, CURDATE(), '서울');

-- [2단계] 결과 확인하기
-- 전체 데이터 조회
SELECT * FROM student;

-- 테이블 구조 재확인 (컬럼 목록 및 데이터 타입 확인)
DESC student;-- [1단계] 데이터 삽입하기
-- 주의: 'avg' 대신 바뀐 컬럼명인 'jumsu'를 사용합니다.
INSERT INTO student (name, age, jumsu, hire, loc)
VALUES ('박차고 나온 세상에', 30, 97.2, CURDATE(), '서울');

-- [2단계] 결과 확인하기
-- 전체 데이터 조회
SELECT * FROM student;

-- 테이블 구조 재확인 (컬럼 목록 및 데이터 타입 확인)
DESC student;-- [1단계] 데이터 삽입하기
-- 주의: 'avg' 대신 바뀐 컬럼명인 'jumsu'를 사용합니다.
INSERT INTO student (name, age, jumsu, hire, loc)
VALUES ('박차고 나온 세상에', 30, 97.2, CURDATE(), '서울');

-- [2단계] 결과 확인하기
-- 전체 데이터 조회
SELECT * FROM student;

-- 테이블 구조 재확인 (컬럼 목록 및 데이터 타입 확인)
DESC student;
/*=======================================
테이블의 내용을 수정하는 명령어이다.
UPDATE 테이블명 
SET 컬럼1=값1, 컬럼2=값2 
WHERE 컬럼=값;
=========================================*/


UPDATE members
SET age=50
WHERE name='홍길동';
SELECT * FROM  members;






/*=============================================
테이블의 내용을 삭제하는 명령어이다.
DELETE
DELETE FROM table_name WHERE column_name = value;
===============================================*/

-- [1단계] '휜둥이' 학생 데이터 삭제 (문장 끝에 세미콜론 필수!)
DELETE FROM members
WHERE name = '휜둥이';

-- [2단계] 삭제 결과 확인 (전체 데이터 조회)
SELECT * FROM members;



/*===============================================
무결성 제약조건
   무결성이 데이터베이스 내에 있는 데이터의 정확성 유지를 의미한다면
   제약조건은 바람직하지 않는 데이터가 저장되는 것을 방지하는 것을 말한다.
   무결성 제약조건 6종류 : not null, unique, primary key, foreign key, check, default
    not null : null를 허용하지 않는다.
    unique : 중복된 값을 허용하지 않는다. 항상 유일한값이다.
    primary key : not null + unique
    foreign key : 참조되는 테이블의 컬럼의 값이 존재하면 허용된다.
    check : 저장 가능한 데이터값의 범위나 조건을 지정하여 설정한 값만을 허용한다.
	default : 기본값을 설정한다.
    =====================================================*/


CREATE TABLE dept1(
	code varchar(10) PRIMARY KEY);

CREATE TABLE emp1(
	code varchar(10) PRIMARY KEY,
	namme varchar(20) NOT NULL,
	loc varchar(10),
	salary int DEFAULT 3000
);

SHOW tables;


-- myxedb 데이터베이스에 생성된 table 확인
SELECT * FROM INFORMATION_SCHEMA.tables
WHERE TABLE_SCHEMA='myexdb';

-- myxedb 데이터베이스에 생성된 constraint 확인
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA='myexdb';

SELECT * FROM emp1;

INSERT INTO emp1
VALUES('a001','홍길동','지역',5000);

SELECT * FROM emp1;

INSERT INTO emp1(code, name, loc)
VALUES('a002','김민재','서울');
SELECT * FROM emp1;

-- myxedb 데이터베이스에 생성된 constraint 확인
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA='myxedb';



  CREATE TABLE emp2(
      id varchar(10),
      name varchar(20) not null,
      loc varchar(10) ,
      salary int default 3000,
      code varchar(10), 
      constraint emp2_id_pk primary key(id),
      constraint emp2_code_fk  foreign key(code)  references dept1(code)
    );
  
  -- myxedb 데이터베이스에 생성된 constraint 확인
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA='myxedb';


INSERT INTO dept1
VALUES ('p001');
SELECT * FROM dept1;


SELECT  * FROM emp2;



INSERT INTO emp2 
VALUES ('a001', '김연아', '서울', 5000, 'p001');
SELECT * FROM emp2;


 INSERT INTO emp2(id, name, loc,salary)
     VALUES('a002', '이수영', '경기', 8000);
 SELECT  * FROM emp2;

-- code는 foreign key로 제약조건이 설정되여 있으므로 null이 가능하다.
  INSERT INTO emp2(id, name, loc,salary, code)
     VALUES('a003', '진영구', '제주', 6000, 'k001');
 SELECT  * FROM emp2;

  INSERT INTO emp2(id, name, loc)
  VALUES('a002', '마이상', '대전');
SELECT  * FROM emp2;


INSERT INTO emp2(id, name, loc)
  VALUES('a004', '홍길도', '대구');
SELECT  * FROM emp2;

-- name 컬럼의 제약조건 not null 이기 때문에 중복되어도 가능하다
INSERT INTO emp2(id, name, loc)
  VALUES('a005', '홍길도', '부산');
SELECT  * FROM emp2;



--  name 컬럼의 제약조건은 not null 이기 때문에 null값을 저장할 수 없다.
-- SQL Error [1364] [HY000]: Field 'name' doesn't have a default value
INSERT INTO emp2(id, loc)
  VALUES('a006', '전주');


-- emp2 테이블에 gen컬럼을 추가한다.
ALTER TABLE emp2
ADD gen char(1) check(gen IN('m','w'));
SELECT  * FROM emp2;

INSERT INTO emp2
VALUES('a006', '전진구', '수원', 5000, 'p001', 'm');
SELECT  * FROM emp2;



/*=================================================
제약조건 삭제
 ALTER TABLE table_name
  DROP constraint constraint_name
======================================================*/ 

-- Foreign key 제약조건 삭제
ALTER TABLE emp2
DROP CONSTRAINT emp2_code_fk;

-- myxedb 데이터베이스에 생성된 constraint 확인
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA='myxedb' AND table_name='emp2';


-- check제약조건 삭제
ALTER TABLE emp2
DROP CONSTRAINT emp2_chk_1;

-- myxedb 데이터베이스에 생성된 constraint 확인
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA='myxedb' AND table_name='emp2';


-- primary key 제약조건 삭제
ALTER TABLE emp2
DROP PRIMARY KEY;

-- myxedb 데이터베이스에 생성된 constraint 확인
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA='myxedb' AND table_name='emp2';

-- salary 컬럼에 설정된 default를 확인한다.
DESC emp2;

-- default 제약 조건 삭제 (salary int default 3000)
ALTER TABLE  emp2
ALTER salary DROP DEFAULT;

DESC emp2;

-- name 컬럼에 not null 삭제
ALTER TABLE emp2
MODIFY COLUMN name varchar(20);
DESC emp2;

 /*=======================================================================
제약조건 추가
  ALTER TABLE table_name
       ADD constraint constraint_name constraint_type(column_name)
=========================================================================*/


-- emp2 테이블의 code컬럼에  foreign key 제약조건 추가
ALTER TABLE emp2
ADD CONSTRAINT emp2_code_fk FOREIGN KEY(code) REFERENCES dept1(code);

-- myxedb 데이터베이스에 생성된 constraint 확인
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA='myxedb'AND table_name='emp2';

-- emp2테이블의 gen컬럼에 check 제약조건 추가
ALTER TABLE emp2
ADD CONSTRAINT emp2_gen_chk check(gen IN('m','w'));
-- myxedb 데이터베이스에 생성된 constraint 확인
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA='myxedb'AND table_name='emp2';

 -- emp2테이블의 id컬럼에 primary key 제약조건 추가 
  ALTER TABLE emp2
  ADD CONSTRAINT emp2_id_pk primary key(id);
 -- myxedb 데이터베이스에 생성된 constraint 확인
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA='myxedb'AND table_name='emp2';



-- emp2테이블의 name컬럼에 not null 제약조건 추가 
 ALTER TABLE emp2
 MODIFY COLUMN name varchar(20) not null;
DESC emp2;

 /*=========================================================
부모키가 수정,삭제가 되면 참조되는 키도 수정,삭제가 되도록 cascade을 설정한다.
수정 : ON UPDATE CASCADE
삭제 : ON DELETE CASCADE
==========================================================*/ 


CREATE TABLE dept2(
  code varchar(10),
  dname varchar(20)
  );

INSERT INTO dept2
VALUES('p001', 'visit');

INSERT INTO dept2
VALUES('p002','hello');

ALTER TABLE dept2
ADD CONSTRAINT primary key(code);

SELECT * FROM dept2;


DROP  TABLE IF EXISTS emp3; 
 CREATE TABLE emp3(
  id varchar(10) primary key,
  name varchar(20) not  null,
  code varchar(10),
  constraint emp3_code_fk foreign key(code) references dept2(code)
   ON DELETE CASCADE   
   ON UPDATE CASCADE);

SELECT * FROM emp3;
SELECT * FROM dept2;

INSERT  INTO emp3
 VALUES('a001', '홍길동', 'p001');
 
  SELECT * FROM emp3;
  
  INSERT INTO emp3
  VALUES('a002','김민재', null);
  
  SELECT * FROM emp3;
  
  INSERT INTO emp3
  VALUES('a003', '진영구', 'p002');
  
  SELECT * FROM emp3;
  
  
  UPDATE  dept2
  SET code = 'm001'
  WHERE code='p001';

SELECT * FROM dept2;
  SELECT * FROM emp3;
  
DELETE FROM dept2
WHERE code='p002';
SELECT * FROM dept2;
  SELECT * FROM emp3;
  

INSERT INTO DEPT2 
VALUES('p002','hello');

SELECT * FROM dept2;

COMMIT;


INSERT INTO DEPT2 
VALUES('p003','hello3');

SAVEPOINT t1;


INSERT INTO DEPT2 
VALUES('p004','hello4');

SAVEPOINT t2;

INSERT INTO DEPT2 
VALUES('p005','hello5');

SELECT * FROM dept2;

ROLLBACK TO t2;

SELECT * FROM dept2;

COMMIT;


SELECT * FROM dept2;
