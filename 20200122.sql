SELECT *
FROM lprod;

SELECT buyer_id, buyer_name
FROM buyer;

SELECT * 
FROM cart;

SELECT *
FROM member;

SELECT mem_id, mem_pass, mem_name
FROM member;

--users ���̺� ��ȸ
SELECT *
FROM users;

--���̺��� � �÷��� �ִ��� Ȯ���ϴ� ���
--1. SELECT *
--2. TOOL�� ��� (����� -TABLES)
--3. DESC ���̺�� (DESC-DESCRIBE)
DESC users;

--users ���̺��� userid, usernm, reg_dt�÷��� ��ȸ�ϴ� sql�� �ۼ��ϼ���.
--reg_dt �÷��� ��ȸ�ϴ� sql�� �ۼ��ϼ���
--��¥ ����(reg_dt �÷��� data������ ������ �ִ� Ÿ��)
--SQL ��¥ �÷� + (���ϱ� ����)
--�������� ��Ģ������ �ƴѰ͵�(5+5)
--String h = "hello"
--String w = "world";
--String hw = h+w; --�ڹٿ����� �� ���ڿ��� ����
--SQL���� ���ǵ� ��¥ ���� : ��¥ + ���� = ��¥���� ������ ���ڷ� ����Ͽ� ���� ��¥�� �ȴ�.(2019/01/28+5 = 2019/02/2)
--reg_dt : ������� �÷�
--null : ���� �𸣴� ����
--null�� ���� ���� ����� �׻� null

SELECT  userid u_id, usernm, reg_dt, reg_dt+5 AS reg_dt_after_5day
FROM users;
DESC users;

String msg = "";// ���鹫��;

SELECT prod_id AS id, prod_name AS name
FROM prod;

SELECT lprod_gu AS gu, lprod_nm AS nm
FROM lprod;

SELECT buyer_id ���̾���̵�, buyer_name �̸� --AS ��� ��
FROM buyer; 

--���ڿ� ����
-- �ڹ� ���� ���ڿ� ���� : + ("hello"+"world")
--sql������ : || ('hello'||'world')
--sql������ : concat ('hello','world')
--userid,usernm Į���� ����, ��Ī�� id_name

SELECT userid || usernm id_name,
CONCAT(userid,usernm) concat_id_name
FROM users;

--����, ���
-- int a = 5; String msg = "Hello,World";
--Systenm.out.println(msg);//������ �̿��� ���
--//����� �̿��� ���
--System.out.println("Hello,World");

-- SQL������ ������ ����(�÷��� ����� ����, pl/sql ���� ������ ����)
--SQL���� ���ڿ� ����� �̱� �����̼����� ǥ��
--"hello.world" -->'Hello,World'

--���ڿ� ����� �÷����� ����
--user id : brown
--user id : cony
SELECT 'user id : '|| userid AS "use rid" --��Ī���� ������ ���� ����. ""(double quotation)�̰� ���� ����ǿ�.
FROM users;

SELECT TABLE_NAME
FROM USER_TABLES;

SELECT 'SELECT * FROM ' || TABLE_NAME  ||  ';' AS QUERY
FROM USER_TABLES;

-- || --> CONCAT
-- CONCAT(arg1,arg2) 2���� ���� �ִ�.SELECT CONCAT (CONCAT('SELECT * FROM ' , TABLE_NAME), ';') AS QUERY
FROM USER_TABLES;
SELECT CONCAT (CONCAT('SELECT * FROM' , TABLE_NAME), ';') AS QUERY
FROM USER_TABLES;


SELECT CONCAT (CONCAT('SELECT * FROM ' , TABLE_NAME), ';') AS QUERY
FROM USER_TABLES;

DESC users;

-- int a = 5; // �Ҵ�, ���� ������
-- if(a==5)(a�� ���� 5���� ��)
-- sql������ ������ ������ ����(PL/SQL)
-- sql = --> equal
--users�� ���̺��� ��� �࿡ ���ؼ� ��ȸ
--users���� 5���� �����Ͱ� ����

--WHERE �� : ���̺��� �����͸� ��ȸ�� �� 
--           ���ǿ� �´� �ุ ��ȸ
--ex : userid �÷��� ���� brown�� �ุ ��ȸ
-- brown, 'brown'�� ����
-- �÷�, ���ڿ��� ���

SELECT *
FROM users
WHERE userid = 'brown';

--userid�� bronw�� �ƴ� �ุ ��ȸ
-- =������, �ٸ��� :<> , !=
SELECT *
FROM users
WHERE userid != 'brown';

-- emp ���̺� �����ϴ� �÷��� Ȯ�� �غ�����

SELECT *
FROM emp;

--emp ���̺��� ename �÷� ���� JONES�� �ุ ��ȸ
-- * SQL KEY WORD�� ��ҹ��ڸ� ������ ������
-- �÷��� ���̳�, ���ڿ� ����� ��ҹ��ڸ� ������.
-- 'JONES', 'Jones'�� ���� �ٸ� ���
SELECT ename
FROM emp
WHERE ename = 'JONES';

SELECT *
FROM emp;--employee�� ����
DESC emp; -- ���̺���ȸ ��ɾ�

5 > 10 --FALSE
5>5 -- FALSE
5>=5 --TRUE

-- emp ���̺��� deptono(�μ���ȣ)��
--30���� ũ�ų� ���� ����鸸 ��ȸ

SELECT *
FROM emp
WHERE deptno >= 30;

-- ���ڿ� : '���ڿ�'
--���� : 50
--��¥ : ????--->> �Լ��� ���ڿ��� �����Ͽ� ǥ��
-- ���ڿ��� �̿��Ͽ� ǥ�� ����(�������� ����)
-- �������� ��¥ ǥ�� ���
-- �ѱ�: �⵵ 4�ڸ�-�� 2�ڸ�-����2�ڸ�
-- �̱�: ��2�ڸ�-����2�ڸ�-�⵵4�ڸ�
--�Ի����ڰ� 1980�� 12�� 17�� ������ ��ȸ
SELECT *
FROM emp
WHERE hiredate = '80/12/17'; --�̰� ������.. ���󸶴� ��¥ ǥ������ �ٸ��� ������

--TO_DATE : ���ڿ��� dateŸ������ �����ϴ� �Լ�
--TO_DATE(��¥���� ���ڿ�, ù��° ������ ����)
SELECT *
FROM emp
WHERE hiredate = TO_DATE('19801217','YYYYMMDD');

SELECT *
FROM emp
WHERE hiredate = TO_DATE('1980/12/17','YYYY/MM/DD');

--���� ����
--Sal �÷��� ���� 1000���� 2000 ������ ���
-- sal >= 1000
-- sal <= 2000

SELECT *
FROM emp
WHERE sal >=1000
AND sal <=2000;

--���������ڸ� �ε�ȣ ��ſ� BETWEEN AND �����ڷ� ��ü

SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000; 

SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN TO_DATE('19820101','YYYYMMDD') AND TO_DATE('19830101','YYYYMMDD');

