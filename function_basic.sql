---- �Լ�
-- initcap
select first_name, initcap(first_name)
    from employees
    where 100= department_id;
    
---- ����

select first_name, length(first_name), lengthb(first_name)
    from EMPLOYEES
    where 100= department_id;
    
select initcap('aBcde'), lower('aBcde'), upper('aBcde')
    from dual;
    
select initcap(ename), lower(ename), upper(ename)
    from emp;


-- 
select substr(2010123000000,7,1)
    from dual;

select substr(2010123987654,-1,1)
    from dual;
    
select substr(2010123987654,7)
    from dual;

select hiredate, substr(hiredate,1,2)
    from emp;
    
--
alter session set nls_date_format= 'yyyy/mm/dd';

select sysdate from dual;

select substr(sysdate,1,4) as year from dual;
select substr(sysdate,6,5) as "month/day" from dual;
select substr(sysdate,-2,2) as day from dual;
select substr(sysdate,-2) as day from dual;



---- teacher_chapter2.sql > F5
select *
    from student;
    
-- �ֹι�ȣ ���κ��� ���� �˾Ƴ���, �ش��ϴ� �ุ
select *
    from student
    where 2= substr(jumin,7,1);
    
desc student;

-- birthday
select name, substr(jumin,1,6) as yearMday
    from student;
    
--75�� 10�� 23��
select name,
    substr(jumin,1,2)||'�� '||substr(jumin,3,2)||'��'||substr(jumin,5,2)||'��'
    as �������
    from student
    where '������' =name
    ;
    
    
    
-- instr
select * from emp;
select instr(empno,'l') as return from emp; -- ????

select * from student;
select tel, instr(tel,')',1,1) as ")�� ��ġ"
    from student;
    
--    ������ȣ�� �����ϱ�
select tel, substr(tel,1,instr(tel,')')-1) as "������ȣ"
    from student;
    
--    ã�� a�� �ǳ��� �ƴ϶�, �ڿ��� 3��°�� 5
select 'ababada', instr('ababada','a',-2,1)
    from dual;
    
----    �ǽ�����: instr
select * from emp;
select  empno, ename, lower(job), initcap(job)
    from emp;
   
--   emp���̺��� �̸��� ù ���ڰ� 'K'���� ū ����� �����ȣ, �̸�, ���� ��ȸ
select empno, ename, job
    from emp
    where 'K' < substr(ename,1,1);
    
--    emp���� �̸��� 6�ڸ� �̻��� ����� �̸�,����
select ename,job
    from emp
    where ename like '______%'; -- % �ƹ��ų� ���� ���鵵 ����
    
    --�ٸ� ���
select ename,job
    from emp
    where 6<= length(ename);
--    
select ename, instr(ename,'L',1,1) as "�̸��� L�� ù ��ġ"
    from emp;
    
    
-- lpad
select lpad('123456789',10,'*') as return from dual;
select lpad('123456',3,'*') as return from dual;
select lpad('123456',8) as return from dual;

select length(lpad('123456',8)) as return from dual;

select rpad('123456',8,'*') as return from dual;

-- trim
select ltrim('aababa','a'),
        rtrim('aababa','a')
    from dual;
    
select trim('   abdef  d   ')
    from dual;
    
create table test_trim
(
    col1    char(5),
    col2    varchar2(5)
);

insert into test_trim values('test','test');
commit;

select *
    from test_trim
    where col1= col2;
    
select * from test_trim;
select length(col1), length(col2) from test_trim;

select *
    from test_trim
    where trim(col1)= trim(col2);
    
desc test_trim;

-- replace
select replace ('1234','12','ab') as return from dual;
select replace('123412','12','ab') as return from dual; -- �� �ٲ�

select * from student;
-- �ι�° ���ڸ� #���� �ٲٱ�
select replace(name, substr(name,2,1) ,'#')
    from student
    ;

    -- �� 7�ڸ��� ���� *�� �ٲٰ� ������..
select replace(jumin, substr(jumin,7,7) ,'*******')
    from student
    ;
    -- �ڿ� ���°� 7�ڸ����� �𸦶�? ex_�ּ�
nope> select replace(jumin, rpad(substr(jumin,7),13,'*')) --�����״�� ����
    from student
    ;

nope> select replace(jumin, *, '*')
    from student
    where jumin like '_______%';
    
select replace(jumin, substr(jumin,8,6) ,'******')
    from student
    ;
    
--    translate
select translate('1234','12','ab') as return from dual;
select translate('123421','123','ab') as return from dual;

select replace('abcba','abc','AB'), translate('abcba','abc','AB') from dual;

select * from professor;

select id, replace(id,'-','')
    from professor
    where id like '%-%';

select id, translate(id,'-','')  -- �� �� �� ����??
    from professor
    where id like '%-%';

select id, translate(id,'any-','any')
    from professor
    where id like '%-%';
    
    
--    sysdate
select sysdate+10
    from dual;
    
select floor(months_between(sysdate, '2016/10/22'))
    from dual;
    
select sysdate, hiredate, trunc(months_between(sysdate, hiredate))
    from emp;
    
select add_months(sysdate,3) as "3������"
    , add_months(sysdate,-3) as "3������"
    from dual;
    
select sysdate, next_day(sysdate,'��') as "���� ����"
    from dual;
    
    -- �׳��� �� ��
select next_day(sysdate,'FRI') as "���� ����"
    from dual;
    -- ����� ã������ ������ ��¥ �����ϴ� ����� ����� �ٲ��
alter session set nls_date_language= american;
select next_day(sysdate,'FRI') as "���� ����"
    from dual;
    -- ��� ���� X
select next_day(sysdate,'fri') as "���� ����" 
    from dual;
    
    -- ���� ������? ���� system
select *
    from v$parameter
    where name='nls_date_language';
    
alter session set nls_date_language= korean;

---------- to_char�� ���� ���Ƽ� ���� �и�

---- null . p50
-- nvl
select sal, comm, nvl(comm,0)
    from emp;
    
select sal, comm, sal+comm, nvl(comm,0)
    from emp;

    -- �ٶ���
select sal, comm, sal+nvl(comm,0)
    from emp;
    
select hpage, nvl(hpage,'1')
    from prefessor;
    
select hpage, nvl(hpage,1) -- ����
    from prefessor;
    
-- nvl2
select sal, comm, nvl2(comm, '�� �Ƴ�','���ȿ� ���־�')
    from emp;
    
select sal, comm, nvl2(comm, comm*1.2, 0)
    from emp;
    
-- decode. ����  ? T : F
select decode('10','10','��','���')
    from dual;
    
    --    jumin 1�� 2��
select * from student;
select substr(jumin,7,1)
        , decode(substr(jumin,7,1),1, '��','��')
    from student;
    
    
    -- �μ���ȣ 10�ѹ� 2�繫 3�λ�
select * from emp;
select decode(deptno,10,'�ѹ�',   20,'�繫',   30,'�λ�')
    from emp;
    
select * from emp;
select decode(deptno,10,'�ѹ�',   20,'�繫',   30,'�λ�', 'NA')
    from emp;
    
   
select * from emp;

-- decode( decode( ... / if�� �����. �ٵ� ��Һ� �ȵ� > �� �� ���� if, case
select decode ('1234','12',decode('34','56',1,2),3)
    from dual;

-- if
if a=b
    then
        if c=d
        then 1
        else 2
    else 3;
    

-- case
select deptno, case  when deptno=10 then '�ѹ���'
                     when deptno=20 then '�繫��'
                     when deptno=30 then '�λ��'
                     else '��Ÿ'
               end as �μ���
    from emp;
    
    -- �񱳴���� ����& ����� '='

select deptno, case deptno when 10 then '�ѹ���'
                         when 20 then '�繫��'
                         when 30 then '�λ��'
                         else '��Ÿ'
               end as �μ���
    from emp;
    
    -- professor���� deptno�� 101 ������ ������ǥ, 101 ������x �����ĺ� ������ ��Ÿ
select *
    from professor;

select deptno, case when deptno=101 and position='������' then '������ǥ'
                    when deptno=101 and position!='������' then '�����ĺ�'
                    else '��Ÿ'
               end as ����xx
    from professor;

    -- ?? �� ���̷���?
desc PROFESSOR;
select deptno, case when deptno=101 and position='������' then '������ǥ'
                    when deptno=101 and position!='������' then '�����ĺ�'
                    else '��Ÿ'
               end as ����xx
    from professor;

-- ! sql���� if�� ����!
���� select deptno
    , if deptno=101
      then
        if position='������'
        then '������ǥ'
        else '�����ĺ�'
        end if
      else '��Ÿ'
      end if
    from professor;

select deptno, position, decode(deptno, 101
                                      , decode(position,'������','������ǥ','�����ĺ�')
                                      ,'��Ÿ')
    from professor;
    
--����3) EMP ���̺��� ����̸�, �Ŵ�����ȣ(MGR)�� ����ϰ�, �Ŵ�����ȣ�� null�̸� �����������ڡ��� ǥ���ϰ�, �Ŵ�����ȣ�� ������ ��7869��确���� ǥ���Ͽ���.
-- �� �ึ�� �ٸ� ��
select * from emp;
select ename, mgr, decode(mgr, null, '����������', mgr||'���')
    from emp;
    
    , count(commission_pct);
--  count
select count(*), count(employee_id)
    from employees;
    
desc EMPLOYEES;

select count(*), count(empno), count(comm), sum(comm)
    from emp;
    
select median(comm), round(variance(comm),7)
       , round(stddev(comm),7), round(stddev(comm),1), avg(comm), round(sum(comm)/count(empno), 7) "null���� ���"
    from emp;
    
select avg(comm), round(avg(nvl(comm,0)),7), round(avg(nvl(comm,0)),1), round(sum(comm)/count(empno), 7) "null���� ���"
    from emp;
    
    
-- group by

    -- �μ��� ��տ���
desc emp; -- sal null ����. �������� ����� ����
select deptno, round(avg(nvl(sal,0))), round(avg(sal))
    from emp
    group by deptno;
    
nope> select deptno, ename
    from emp
    group by deptno;
    
desc emp;
select count(empno) from emp;
select deptno, job
    from emp
    group by deptno, job;
    
select * from employees;

    
select department_id, job_id, count(*), sum(salary) -- 1,2,3,4
    from employees
    group by department_id, job_id
    order by 1; --5�� ����
    
select decode(substr(jumin,7,1),1,'����', 2,'����','2000�������') ����
       , round(avg(height)) ���Ű
       , round(avg(weight)) ��ո�����
    from student
    group by substr(jumin,7,1);
    
-- having

select *
    from emp2
    ;
    
select deptno, avg(pay)/10000 ��տ���_����
    from emp2
    group by deptno
    ;
    
select deptno, avg(pay)/10000 ��տ���_����
    from emp2
    group by deptno
    having avg(pay)/10000 between 3000 and 10000
    ;
    
--����3) emp ���̺��� �̿��Ͽ� ������(JOB), �μ���(DEPTNO)�� �׷�ȭ�Ͽ� ������ �ο����� �޿������ ���ϰ� �޿������ ���� ������ �����Ͽ���.
desc emp;
select * from emp;
select count(empno)�ο���, avg(sal)�޿����
    from emp
    group by job, deptno
--    order by 2 desc;
    order by �޿���� desc;


--����4) EMP ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ����Ͽ���.
select deptno �μ���ȣ, count(empno)�ο���, sum(sal)�޿���
    from emp
    group by deptno
    having 4< count(empno)
    ;
    
-- ���� ������
    -- union: ���η� ��ħ. �ߺ� ����. 18��
    -- ���δϱ� ���� �ǹ�, ���� Ÿ������
select department_id, salary
    from employees
    where salary >10000
    and DEPARTMENT_id= 90
union
    select department_id, salary
    from employees
    where salary< 10000
    and department_id = 80;
    
    -- union all. 26��
select department_id, salary
    from employees
    where salary >10000
    and DEPARTMENT_id= 90
union all
    select department_id, salary
    from employees
    where salary< 10000
    and department_id = 80;
    
    --
desc emp;
    --ENAME		VARCHAR2(10)
    --DEPTNO		NUMBER(2)
desc emp2;
    --NAME	NOT NULL	VARCHAR2(20)
    --DEPTNO	NOT NULL	VARCHAR2(6)
desc emp, emp2; -- ????

    -- Ÿ�Ը�= ����. ���̴� �޶� ��
select empno, ename
    from emp
    union all
    select empno, name
    from emp2;
    
select empno, ename, to_char(deptno)
    from emp
    union all
    select empno, name, deptno
    from emp2;
    
    -- sign
select sign(1)
        ,sign(-1)
        ,sign(0)
    from dual;