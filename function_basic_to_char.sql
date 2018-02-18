-- 데이터 형변환. to_char

굳이ㄴㄴ> SELECT ASCII('A') AS A, ASCII('B') AS B
    from dual;
    
desc emp2;
select pay, to_char(pay)
    from emp2;

select pay, '\'||to_char(pay,'999,999,999,999.999')
    from emp2;
    

select hiredate,
        substr(hiredate,1,4) as "잘못된 년도 표시",
        to_char(hiredate,'yyyy') as "올바른 년도 표시"
    from emp;
    
select hiredate,
        substr(hiredate,1,4) as "잘못된 년도 표시",
        to_char(hiredate,'yyyy-mm-dd') as "올바른 년도 표시"
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
   
   
--emp테이블에서 10번 부서원의 입사 일자를 '1 MAY 1981'와 '1988년 1월 1일'
--의 형태로 각각 출력
select * from emp;
desc emp;

alter session set nls_date_language= american;
alter session set nls_date_language= korean;
select ltrim(to_char(hiredate,'dd'),'0')||'일 '||to_char(hiredate,'mon yyyy')
    , to_char(hiredate,'yyyy')||'년'||to_char(hiredate,' mon')||' '||ltrim(to_char(hiredate,'dd'),'0')||'일'
    from emp;
    
    --  정답
select hiredate, to_char(hiredate,'yyyy"년 "mm"월 "dd"일"')
    from emp
    where 10= deptno
    ;

--
create table test1111
(   name varchar2(20)
    , gender varchar2(5)
);


-- EMP테이블에서 20번 부서원의 급여 앞에 $를 삽입하고 3자리마다 , 를 출력
select trim(to_char(sal, '$999,999,999'))
    from emp;
    
    
-- february 22, 1981에 입사한 사원의 이름, 업무, 입사일자를 출력
alter session set nls_date_language= american;
select * from emp;

select ename, job, replace(translate(to_char(hiredate,'day dd, yyyy'),'y ','y'),'y','y ')
    from emp;
    
-- 심화문제: jumin으로 yyyy-mm-dd 형식변환
select * from student;

select to_char(to_date(substr(jumin,1,6)),'yyyy-mm-dd')
    from student;
    
--emp에서 입사일자가 1981년 01월 01일 이후에 입사한 사원에 대해 정보 출력
select * from emp;
desc emp; --hiredate: date

select *
    from emp
    where hiredate > '01/01/1981';      -- error!

    --    hiredate date 형식을 문자로
select *
    from emp
    where '01/01/1981' < to_char(hiredate,'mm/dd/yyyy');
    
select *
    from emp
    where to_date('01/01/1981','mm/dd/yyyy') < hiredate;
    
