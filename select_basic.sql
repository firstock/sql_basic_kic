select * from emp;
desc emp;

-- 조회_기본_기본

select empno, ename
    from emp;
    
select empno as 사원번호, ename as 이름
    from emp;
    
    
   
select empno as "사원 번호", ename as "emp_name"
    from emp;
    
select empno as "사원 번호", ename as "emp_name",'text'
    from emp;

select * 
    from emp;

select sal||'+'||comm
    from emp;
    
select empno||'사번의 직원 이름은'||ename||'이다'
    from emp;
    
select empno,'사번의 직원 이름은 ',ename,'이다'
    from emp;
    
select *
    from emp;
    
select ename||'-'||job||'-'||SAL
    from emp;
    
-- ctrl+N, HR 계정으로 접속> EMPLOYEES
select * from employees;

-- 중복 빼고 출력   
select distinct department_id
    from employees;
    
select department_id
    from employees;
    
select distinct department_id, salary
    from employees;
    
-- 연습문제 @scott
select * from dept;

ㄴㄴselect deptno as 부서●, dname as "부서명", loc as "위치"
    from dept;

잘됨 select deptno as 부서#, dname as "부서명", loc as "위치"
    from dept;
    
select deptno as "부서#", dname as "부서명", loc as "위치"
    from dept;
    
select * from emp;

select distinct deptno,job
    order deptno
    from emp;
    
    
-- select 열 from 테이블 where 행_조건
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
ㄴㄴ select first_name, salary, commission_pct
    from EMPLOYEES
    where null= commission_pct;
    
select first_name, salary, commission_pct
    from EMPLOYEES
    where commission_pct is null;

select first_name, salary, commission_pct
    from EMPLOYEES
    where commission_pct is not null;


-- 예제1
select * from emp;
select empno as 사원번호, ename as 성명, deptno as 부서번호
    from EMP
    where 'manager'= lower(job);
    
-- 예제2
select *
    from EMP
    where empno in(7902,7788,7566);
    
-- 예제3
select ename as 이름, job as 업무
    from emp
    where upper(ename) like '_L%';
    
-- 예제4
select *
    from emp
--    where hiredate like '1982%';
    where hiredate like '82%';

    
-- 날짜 형식변환 ?? 뭐가 된 느낌이 없는데?
select *
    from emp
    where to_char(hiredate,'yyyy') = '82';
    

-- order by
--select * from emp;
select first_name, salary, department_id, hire_date
    from emp
    where salary > 9000
    and department_id= 90;
