SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN TO_DATE('1982/01/01','YYYY/MM/DD') AND TO_DATE('1983/01/01', 'YYYY/MM/DD');

SELECT ename, hiredate
FROM emp
WHERE hiredate >= TO_DATE('1982/01/01','YYYY/MM/DD') 
AND   hiredate <= TO_DATE('1983/01/01','YYYY/MM/DD');

-- WHERE ���� ����ϴ� ���ǿ� ������ ��ȸ ����� ������ ��ġ�� �ʴ´�.
--SQL�� ������ ������ ���� �ִ�.
-- ���� : Ű��  185cm �̻��̰� �����԰� 70kg �̻��� ������� ����
-- -->  �����԰� 70kg �̻��̰� Ű��  185cm �̻��̰� ������� ����
-- ������ Ư¡ : ���տ��� ������ ����.
-- (1,5,10) --> (10,5,1) : �� ������ ���� �����ϴ�.
-- ���̺��� ������ ������� ����
-- SELECT ����� ������ �ٸ����� ���� �����ϸ� ����
--> ���ı�� ����(ORDER BY)
-- �߻��� ����� ���� --> ����x

--IN ������
--Ư�� ���տ� ���ԵǴ��� ���θ� Ȯ��
--�μ���ȣ�� 10�� Ȥ��(OR) 20���� ���ϴ� ���� ��ȸ

SELECT deptno,empno, ename
FROM emp
WHERE deptno IN(10,20);

--IN�����ڸ� ������� �ʰ� OR ������ ���
SELECT deptno,empno, ename
FROM emp
WHERE deptno =10
OR    deptno =20;

SELECT deptno,empno, ename
FROM emp
WHERE deptno >=10
AND deptno <=20;--�μ���ȣ�� 15

SELECT empno, ename, deptno
FROM emp;

--emp���̺��� ����̸��� SMITH, JONES�� ������ ��ȸ(empno, ename, deptno)
SELECT empno,ename, deptno
FROM emp
WHERE ename = SMITH
AND   ename = JONES; -- ���� �ߴµ� Ʋ����

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

--users���̺��� userid�� 'brown','cony','sally'�� �����͸� ������ ���� ��ȸ�Ͻÿ�(IN������ ���)
SELECT *
FROM users
WHERE userid IN ('brown','cony','sally');

SELECT userid AS ���̵�, usernm �̸�, alias ����
FROM users
WHERE userid = 'brown'
OR    userid = 'cony'
OR    userid = 'sally';

-- ���ڿ� ��Ī ������ :LIKE, %, _ 
-- ������ ������ ������ ���ڿ� ��ġ�� ���ؼ� �ٷ�
-- �̸��� BR�� �����ϴ� ����� ��ȸ
-- �̸��� R ���ڿ��� ���� ����� ��ȸ
-- ��� �̸��� s�� �����ϴ� ��� ��ȸ
-- % � ���ڿ�(�ѱ���, ���� �������� �ְ�, ���� ���ڿ��� �ü��� �ִ�)
SELECT *
FROM emp;

SELECT *
FROM emp
WHERE ename LIKE 'S%';
-- ���ڼ��� ������ ���� ��Ī
-- _��Ȯ�� �ѹ���
-- ���� �̸��� S�� �����ϰ� �̸��� ��ü ���̰� 5���� �� ����
-- S____
SELECT *
FROM emp
WHERE ename LIKE 'S____';

--��� �̸��� S���ڰ� ���� ��� ��ȸ
-- ename LIKE '%S%'
SELECT *
FROM emp
WHERE ename LIKE '%S%';
SELECT *
FROM emp
WHERE ename LIKE 'S____';

-- member ���̺��� ȸ���� ���� (��)���� ����� mem_id, mem_name�� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�.
SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '��%';

SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '��__';

-- member ���̺��� ȸ���� �̸��� ���� (��)�� ���� ������� mem_id, mem_name�� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�.(WHERE5)
SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '��%';


SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '��__';

--null �� ���� (IS)
-- comm �÷��� ���� null�� �����͸� ��ȸ (WHERE comm = null)
SELECT *
FROM emp
WHERE comm = ''; -- �˻��ȵ�

SELECT *
FROM emp
WHERE comm = null; -- �˻��ȵ�

SELECT *
FROM emp
WHERE comm IS null; - IS������ ����ؾߵ�

where6

SELECT *
FROM emp
WHERE comm IS NOT null;

SELECT *
FROM emp
WHERE comm >=0;

--����� �����ڰ� 7698, 7839, �׸��� null�� �ƴ� ������ ��ȸ
--NOT IN �����ڿ����� NULL ���� ���� ��Ű�� �ȵȴ�.
SELECT *
FROM emp
WHERE mgr NOT IN (7698, 7839,NULL); -- �̷��� �ϸ� �ȵǿ�
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

-- ������ �켱����
-- *,/�����ڰ� +.-���� �켱������ ����.
-- �켱���� ���� : ()
-- AND > OR 

--emp ���̺��� ��� �̸��� SMITH �̰ų� ��� �̸��� ALLEN�̸鼭 �������� SALESMAN �� ��� ��ȸ

SELECT *
FROM emp
WHERE ENAME = 'SMITH'
OR (ENAME = 'ALLEN' AND JOB = 'SALESMAN');

-- ��� �̸��� SMITH �̰ų� ALLEN �̸�
-- ��� ������ SALESMAN�� ��� ��ȸ
SELECT*
FROM emp
WHERE (ENAME = 'SMITH' OR ENAME = 'ALLEN')
AND JOB ='SALESMAN';

--WHERE14
SELECT *
FROM emp
WHERE (job = 'SALESMAN' OR EMPNO LIKE '78%')
AND HIREDATE >= TO_DATE ('1981/06/01','YYYY/DD/MM');

--����
-- SLECT*
-- FROM table
-- (WHERE)
-- ORDER BY {�÷�|��Ī|�÷��ε��� {ASC/DESC},......}

--emp ���̺��� ��� ����� ename �÷� ���� �������� ���� ���� ������ ����� ��ȸ �ϼ���.
SELECT*
FROM emp
ORDER BY ename ASC;

--emp ���̺��� ��� ����� ename �÷� ���� �������� ���� ���� ������ ����� ��ȸ �ϼ���.
SELECT*
FROM emp
ORDER BY ename DESC;

--DESC ���̺�� ��ȸ

DESC emp; -- DESC : DESCRIBE (�����ϴ�)
0RDER BY ename DESC -- DESC : DESCEMDING (����)


-- emp ���̺��� ��� ������ ename�÷����� �������� 
-- ename ���� ���� ��� mrg�÷����� �������� �����ϴ� ������ �ۼ��ϼ���
SELECT *
FROM emp
ORDER BY ename DESC, mgr;

--���Ľ� ��Ī�� ���
SELECT empno,ename nm, sal *12 year_sal
FROM emp
ORDER BY year_sal;

--�÷� �ε����� ����
-- java array(0)
-- SQL COLUMN INDEX : 1���� ����
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

