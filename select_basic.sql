select * from emp;
desc emp;

-- ��ȸ_�⺻_�⺻

select empno, ename
    from emp;
    
select empno as �����ȣ, ename as �̸�
    from emp;
    
    
   
select empno as "��� ��ȣ", ename as "emp_name"
    from emp;
    
select empno as "��� ��ȣ", ename as "emp_name",'text'
    from emp;

select * 
    from emp;

select sal||'+'||comm
    from emp;
    
select empno||'����� ���� �̸���'||ename||'�̴�'
    from emp;
    
select empno,'����� ���� �̸��� ',ename,'�̴�'
    from emp;
    
select *
    from emp;
    
select ename||'-'||job||'-'||SAL
    from emp;
    
-- ctrl+N, HR �������� ����> EMPLOYEES
select * from employees;

-- �ߺ� ���� ���   
select distinct department_id
    from employees;
    
select department_id
    from employees;
    
select distinct department_id, salary
    from employees;
    
-- �������� @scott
select * from dept;

����select deptno as �μ���, dname as "�μ���", loc as "��ġ"
    from dept;

�ߵ� select deptno as �μ�#, dname as "�μ���", loc as "��ġ"
    from dept;
    
select deptno as "�μ�#", dname as "�μ���", loc as "��ġ"
    from dept;
    
select * from emp;

select distinct deptno,job
    order deptno
    from emp;
    
    
-- select �� from ���̺� where ��_����
select * from employees; --HR

select *
    from EMPLOYEES
    where 101= employee_id;
    
select *
    from EMPLOYEES
    where 'neena'= first_name;

select *
    from EMPLOYEES
    where 'Neena'= first_name;

select *
    from EMPLOYEES
    where 'neena'= lower(first_name);
    
select *
    from EMPLOYEES
    where 'NEENA'= upper(first_name);
    
select *
    from EMPLOYEES
    where '2005/09/21'= hire_date;
    
-- between
select first_name, salary
    from EMPLOYEES
    where salary between 14000 and 17000;

select first_name, salary
    from EMPLOYEES
    where salary >14000
    and salary<= 17000;

-- in
select first_name, last_name, salary
    from EMPLOYEES
    where first_name in('Neena','Lex','John');

select first_name, last_name, salary
    from EMPLOYEES
    where 'Neena' =first_name
    or 'Lex'=first_name 
    or 'John'=first_name;
    
-- like
select first_name, last_name, salary
    from EMPLOYEES
    where first_name like 'L%';
    
select first_name, last_name, salary
    from EMPLOYEES
    where first_name like '_o%';
    
-- not null
���� select first_name, salary, commission_pct
    from EMPLOYEES
    where null= commission_pct;
    
select first_name, salary, commission_pct
    from EMPLOYEES
    where commission_pct is null;

select first_name, salary, commission_pct
    from EMPLOYEES
    where commission_pct is not null;


-- ����1
select * from emp;
select empno as �����ȣ, ename as ����, deptno as �μ���ȣ
    from EMP
    where 'manager'= lower(job);
    
-- ����2
select *
    from EMP
    where empno in(7902,7788,7566);
    
-- ����3
select ename as �̸�, job as ����
    from emp
    where upper(ename) like '_L%';
    
-- ����4
select *
    from emp
--    where hiredate like '1982%';
    where hiredate like '82%';

    
-- ��¥ ���ĺ�ȯ ?? ���� �� ������ ���µ�?
select *
    from emp
    where to_char(hiredate,'yyyy') = '82';
    

-- order by
--select * from emp;
select first_name, salary, department_id, hire_date
    from emp
    where salary > 9000
    and department_id= 90;
