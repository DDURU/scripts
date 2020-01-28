SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN TO_DATE('1982/01/01','YYYY/MM/DD') AND TO_DATE('1983/01/01', 'YYYY/MM/DD');

SELECT ename, hiredate
FROM emp
WHERE hiredate >= TO_DATE('1982/01/01','YYYY/MM/DD') 
AND   hiredate <= TO_DATE('1983/01/01','YYYY/MM/DD');

-- WHERE 절에 기술하는 조건에 순서는 조회 결과에 영향을 미치지 않는다.
--SQL은 집합의 개념을 갖고 있다.
-- 집합 : 키가  185cm 이상이고 몸무게가 70kg 이상인 사람들의 모임
-- -->  몸무게가 70kg 이상이고 키가  185cm 이상이고 사람들의 모임
-- 집합의 특징 : 집합에는 순서가 없다.
-- (1,5,10) --> (10,5,1) : 두 집합은 서로 동일하다.
-- 테이블에는 순서가 보장되지 않음
-- SELECT 결과가 순서가 다르더라도 값이 동일하면 정답
--> 정렬기능 제공(ORDER BY)
-- 잘생긴 사람의 모임 --> 집합x

--IN 연산자
--특정 집합에 포함되는지 여부를 확인
--부서번호가 10번 혹은(OR) 20번에 속하는 직원 조회

SELECT deptno,empno, ename
FROM emp
WHERE deptno IN(10,20);

--IN연산자를 사용하지 않고 OR 연산자 사용
SELECT deptno,empno, ename
FROM emp
WHERE deptno =10
OR    deptno =20;

SELECT deptno,empno, ename
FROM emp
WHERE deptno >=10
AND deptno <=20;--부서번호가 15

SELECT empno, ename, deptno
FROM emp;

--emp테이블에서 사원이름이 SMITH, JONES인 직원만 조회(empno, ename, deptno)
SELECT empno,ename, deptno
FROM emp
WHERE ename = SMITH
AND   ename = JONES; -- 내가 했는데 틀린것

SELECT empno,ename, deptno
FROM emp
WHERE ename = 'SMITH'
OR    ename = 'JONES'; 

SELECT deptno,empno, ename
FROM emp
WHERE ename IN ('SMITH','JONES');
SELECT userid
FROM users
WHERE userid IN ('brown','cony','sally');
SELECT deptno,empno, ename
FROM emp
WHERE ename IN ('SMITH','JONES');

--users테이블에서 userid가 'brown','cony','sally'인 데이터를 다음과 같이 조회하시오(IN연산자 사용)
SELECT *
FROM users
WHERE userid IN ('brown','cony','sally');

SELECT userid AS 아이디, usernm 이름, alias 별명
FROM users
WHERE userid = 'brown'
OR    userid = 'cony'
OR    userid = 'sally';

-- 문자열 매칭 연산자 :LIKE, %, _ 
-- 위에서 연습한 조건은 문자열 일치에 대해서 다룸
-- 이름이 BR로 시작하는 사람만 조회
-- 이름에 R 문자열이 들어가는 사람만 조회
-- 사원 이름이 s로 시작하는 사원 조회
-- % 어떤 문자열(한글자, 글자 없을수도 있고, 여러 문자열이 올수도 있다)
SELECT *
FROM emp;

SELECT *
FROM emp
WHERE ename LIKE 'S%';
-- 글자수를 제한한 매턴 매칭
-- _정확히 한문자
-- 직원 이름이 S로 시작하고 이름의 전체 길이가 5글자 인 직원
-- S____
SELECT *
FROM emp
WHERE ename LIKE 'S____';

--사원 이름에 S글자가 들어가는 사원 조회
-- ename LIKE '%S%'
SELECT *
FROM emp
WHERE ename LIKE '%S%';
SELECT *
FROM emp
WHERE ename LIKE 'S____';

-- member 테이블에서 회원의 성이 (신)씨인 사람의 mem_id, mem_name을 조회하는 쿼리를 작성하시오.
SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '신%';

SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '신__';

-- member 테이블에서 회원의 이름에 글자 (이)가 들어간느 모든사람의 mem_id, mem_name을 조회하는 쿼리를 작성하시오.(WHERE5)
SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '이%';


SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '이__';

--null 비교 연산 (IS)
-- comm 컬럼의 값이 null인 데이터를 조회 (WHERE comm = null)
SELECT *
FROM emp
WHERE comm = ''; -- 검색안됨

SELECT *
FROM emp
WHERE comm = null; -- 검색안됨

SELECT *
FROM emp
WHERE comm IS null; - IS연산자 사용해야됨

where6

SELECT *
FROM emp
WHERE comm IS NOT null;

SELECT *
FROM emp
WHERE comm >=0;

--사원의 관리자가 7698, 7839, 그리고 null이 아닌 직원만 조회
--NOT IN 연산자에서는 NULL 값을 포함 시키면 안된다.
SELECT *
FROM emp
WHERE mgr NOT IN (7698, 7839,NULL); -- 이렇게 하면 안되용
--->
SELECT *
FROM emp
WHERE mgr NOT IN (7698, 7839)
AND mgr IS NOT NULL;
--WHERE7
SELECT JOB, HIREDATE
FROM emp
WHERE HIREDATE >= TO_DATE('1981/06/01','YYYY/MM/DD')
AND JOB = 'SALESMAN';

--WHERE8
SELECT HIREDATE, DEPTNO
FROM emp
WHERE HIREDATE >=TO_DATE('19810601','YYYYMMDD')
AND DEPTNO <>10;
--WHERE9
SELECT HIREDATE, DEPTNO
FROM emp
WHERE HIREDATE >= TO_DATE('19810601','YYYYMMDD')
AND DEPTNO NOT IN 10;
--WHERE10
SELECT HIREDATE, DEPTNO
FROM emp
WHERE HIREDATE >= TO_DATE('19810601','YYYYMMDD')
AND DEPTNO IN ('20','30');
--WHERE11
SELECT HIREDATE, JOB
FROM emp
WHERE HIREDATE >= TO_DATE('19810601','YYYYMMDD')
OR JOB = 'SALESMAN' ;
--WHERE12
SELECT EMPNO, JOB
FROM emp
WHERE JOB = 'SALESMAN'
OR EMPNO LIKE '78%';
--WHERE13
SELECT EMPNO, JOB
FROM emp
WHERE JOB = 'SALESMAN'
OR EMPNO >= 7800;

-- 연산자 우선순위
-- *,/연산자가 +.-보다 우선순위가 높다.
-- 우선순위 변경 : ()
-- AND > OR 

--emp 테이블에서 사원 이름이 SMITH 이거나 사원 이름이 ALLEN이면서 담당업무가 SALESMAN 인 사원 조회

SELECT *
FROM emp
WHERE ENAME = 'SMITH'
OR (ENAME = 'ALLEN' AND JOB = 'SALESMAN');

-- 사원 이름이 SMITH 이거나 ALLEN 이면
-- 담당 업무가 SALESMAN인 사원 조회
SELECT*
FROM emp
WHERE (ENAME = 'SMITH' OR ENAME = 'ALLEN')
AND JOB ='SALESMAN';

--WHERE14
SELECT *
FROM emp
WHERE (job = 'SALESMAN' OR EMPNO LIKE '78%')
AND HIREDATE >= TO_DATE ('1981/06/01','YYYY/DD/MM');

--정렬
-- SLECT*
-- FROM table
-- (WHERE)
-- ORDER BY {컬럼|별칭|컬럼인덱스 {ASC/DESC},......}

--emp 테이블의 모든 사원을 ename 컬럼 값을 기준으로 오름 차순 정렬한 결과를 조회 하세요.
SELECT*
FROM emp
ORDER BY ename ASC;

--emp 테이블의 모든 사원을 ename 컬럼 값을 기준으로 내림 차순 정렬한 결과를 조회 하세요.
SELECT*
FROM emp
ORDER BY ename DESC;

--DESC 테이블명 조회

DESC emp; -- DESC : DESCRIBE (설명하다)
0RDER BY ename DESC -- DESC : DESCEMDING (내림)


-- emp 테이블에서 사원 정보를 ename컬럼으로 내림차순 
-- ename 값이 같은 경우 mrg컬럼으로 오름차순 정렬하는 쿼리를 작성하세요
SELECT *
FROM emp
ORDER BY ename DESC, mgr;

--정렬시 별칭을 사용
SELECT empno,ename nm, sal *12 year_sal
FROM emp
ORDER BY year_sal;

--컬럼 인덱스로 정렬
-- java array(0)
-- SQL COLUMN INDEX : 1부터 시작
SELECT empno,ename nm, sal *12 year_sal
FROM emp
ORDER BY 3;

--ORDERBY 1
SELECT *
FROM dept
ORDER BY DNAME ASC;

SELECT *
FROM dept
ORDER BY DNAME DESC;

--0RDER BY2
SELECT *
FROM emp
WHERE COMM IS NOT NULL AND COMM NOT IN '0'
ORDER BY COMM DESC,EMPNO;

SELECT *
FROM emp
WHERE COMM > 0
ORDER BY COMM DESC, EMPNO ASC;

--ORDER BY3
SELECT *
FROM EMP
WHERE mgr IS NOT NULL
ORDER BY JOB ASC, EMPNO DESC;

