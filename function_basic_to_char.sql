-- ������ ����ȯ. to_char

���̤���> SELECT ASCII('A') AS A, ASCII('B') AS B
    from dual;
    
desc emp2;
select pay, to_char(pay)
    from emp2;

select pay, '\'||to_char(pay,'999,999,999,999.999')
    from emp2;
    

select hiredate,
        substr(hiredate,1,4) as "�߸��� �⵵ ǥ��",
        to_char(hiredate,'yyyy') as "�ùٸ� �⵵ ǥ��"
    from emp;
    
select hiredate,
        substr(hiredate,1,4) as "�߸��� �⵵ ǥ��",
        to_char(hiredate,'yyyy-mm-dd') as "�ùٸ� �⵵ ǥ��"
    from emp;
    
select *
    from emp
    where to_char(hiredate, 'yyyy')= 1980;
    
select *
    from emp
    where to_char(hiredate, 'yy')= '80';
    
select * 
    from emp
    where to_number(to_char(hiredate,'yy'))= 80;
    
select * from emp;

-- date
select to_date('01012018','mmddyyyy')
    from dual;

select to_char(to_date('01012018','mmddyyyy'),'yyyymmdd')
    from dual;

select to_char(hiredate,'mmdd/yyyy')
    from emp;
   
   
--emp���̺��� 10�� �μ����� �Ի� ���ڸ� '1 MAY 1981'�� '1988�� 1�� 1��'
--�� ���·� ���� ���
select * from emp;
desc emp;

alter session set nls_date_language= american;
alter session set nls_date_language= korean;
select ltrim(to_char(hiredate,'dd'),'0')||'�� '||to_char(hiredate,'mon yyyy')
    , to_char(hiredate,'yyyy')||'��'||to_char(hiredate,' mon')||' '||ltrim(to_char(hiredate,'dd'),'0')||'��'
    from emp;
    
    --  ����
select hiredate, to_char(hiredate,'yyyy"�� "mm"�� "dd"��"')
    from emp
    where 10= deptno
    ;

--
create table test1111
(   name varchar2(20)
    , gender varchar2(5)
);


-- EMP���̺��� 20�� �μ����� �޿� �տ� $�� �����ϰ� 3�ڸ����� , �� ���
select trim(to_char(sal, '$999,999,999'))
    from emp;
    
    
-- february 22, 1981�� �Ի��� ����� �̸�, ����, �Ի����ڸ� ���
alter session set nls_date_language= american;
select * from emp;

select ename, job, replace(translate(to_char(hiredate,'day dd, yyyy'),'y ','y'),'y','y ')
    from emp;
    
-- ��ȭ����: jumin���� yyyy-mm-dd ���ĺ�ȯ
select * from student;

select to_char(to_date(substr(jumin,1,6)),'yyyy-mm-dd')
    from student;
    
--emp���� �Ի����ڰ� 1981�� 01�� 01�� ���Ŀ� �Ի��� ����� ���� ���� ���
select * from emp;
desc emp; --hiredate: date

select *
    from emp
    where hiredate > '01/01/1981';      -- error!

    --    hiredate date ������ ���ڷ�
select *
    from emp
    where '01/01/1981' < to_char(hiredate,'mm/dd/yyyy');
    
select *
    from emp
    where to_date('01/01/1981','mm/dd/yyyy') < hiredate;
    
