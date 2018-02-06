---- 함수
-- initcap
select first_name, initcap(first_name)
    from employees
    where 100= department_id;
    
---- 가공

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
    
-- 주민번호 열로부터 성별 알아내서, 해당하는 행만
select *
    from student
    where 2= substr(jumin,7,1);
    
desc student;

-- birthday
select name, substr(jumin,1,6) as yearMday
    from student;
    
--75년 10월 23일
select name,
    substr(jumin,1,2)||'년 '||substr(jumin,3,2)||'월'||substr(jumin,5,2)||'일'
    as 생년월일
    from student
    where '서진수' =name
    ;