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
    
    