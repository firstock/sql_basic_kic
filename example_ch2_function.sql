---- ch2_function
select * from student;
--
select name||'의 키는 '||height||' cm, 몸무게는 '||weight||' kg 입니다'
    as "학생의 키와 몸무게            " --응? 짧으면 짤리고 여기서 길면 에러
    from student;
    
select name, height, weight
    from student;
    
select name,'의 키는 ',height,' cm,몸무게는 ',weight,'kg 입니다'
    from student;
--    
--[실습]

--문제1) EMP 테이블에서 scott의 사원번호, 성명, 담당업무(소문자로), 담당업무(대문자로), 첫 글자만 대문자로 변환하여 출력하여라.
select * from emp;
select empno, ename, lower(job), initcap(job)
    from emp;
--문제2) EMP 테이블에서 이름의 첫 글자가 ‘K’보다 큰 사원의 사원번호, 이름, 업무를 출력하여라.
select empno, ename, job
    from EMP
    where upper(substr(ename,1,1)) > 'K';
--문제3) EMP 테이블에서 이름이 6자리 이상인 사원의 이름과 업무를 출력하여라.
select ename, job
    from emp
    where length(ename) >= 6;
--문제4) EMP 테이블에서 이름 중 ‘L’자의 첫 위치를 출력하여라.
select ename, decode(instr(ename,'L',1),0,'없어',instr(ename,'L',1)) as "L 첫 위치"
    from emp;
    
--[실습]

--문제1) 이름에 *를 왼쪽에 채워 모두 동일한 15개의 이름으로 변환하고 업무와 급여를 출력한다.
select lpad(ename,15,'*'), job, sal
    from emp;

--문제2) 급여를 모두 동일하게 만단위로 보여지게 변환하고 이름과 부서번호를 함께 출력한다.
select trim(to_char(sal,'999,999,999,999')), ename, deptno
    from emp;
--문제3) EMP 테이블에서 담당 업무 중 좌측에 ‘A’를 삭제하고 급여 중 좌측의 1(숫자)을 삭제하여 출력하여라.
select job, sal from emp;
select ltrim(job,'A'), ltrim(sal,1)
    from emp;
--문제4) EMP 테이블에서 담당 업무 중 우측에 ‘T’를 삭제하고 급여 중 우측의 0을 삭제하여 출력하여라.
select rtrim(job,'T'), rtrim(sal,0)
    from emp;
--문제5) EMP 테이블에서 JOB에 ‘A’를 ‘$’로 바꾸어 출력하여라.
select translate(job,'A','$')
    from emp;
--[ 실습 ]

--문제1) EMP 테이블에서 현재까지 근무일수가 몇 주, 몇 일인가를 출력하여라.  단, 근무일수가 많은 사람 순으로 출력하여라.
select * from emp;
select sysdate-hiredate as 날짜기준, months_between(sysdate, hiredate) as 월기준  -- ver 0.7
    from emp
    order by months_between(sysdate, hiredate) desc
    ;
    
    -- 나머지 연산? mod
select floor((sysdate-hiredate)/7)||'주 '||mod(floor(sysdate-hiredate),7)||'일'   -- 답은 맞는데, 안배운 함수잖아. 더 간단한게 있을겨
    from emp
    order by months_between(sysdate, hiredate) desc
    ;
    
select trunc(123.65), floor(123.65) from dual;
select trunc(-123.65), floor(-123.65) from dual;
--문제2) EMP 테이블에서 10번 부서원의 현재까지의 근무 월수를 계산하여 출력하여라. 
desc emp;
select * from emp;
select trunc(months_between(sysdate, hiredate)) "10번부서 근무월수"
    from emp
    where 10= deptno;
    
--문제3) EMP 테이블에서 입사한 달의 남은 근무 일수를 계산하여 출력하여라. 단, 토요일과 일요일도 근무일수에 포함한다. (첫달 월급정산용+주휴?)
select hiredate,last_day(hiredate),last_day(hiredate)-hiredate+1 "당일포함 남은근무일수"
    from emp;
    
select hiredate
    from emp;
--문제4) EMP 테이블에서 10번 부서원의 입사 일자로부터 돌아오는 금요일을 계산하여 출력하여라.
alter session set nls_language= korea;
select hiredate, next_day(hiredate,'금')
    from emp;

--[ 실습 ] 

--문제1) EMP 테이블에서 10번 부서원의 입사 일자를 '1 MAY 1981'와 '1998년 1월 1일' 의 형태로 각각 출력하여라.
alter session set nls_language= english;
select ltrim(to_char(hiredate,'dd MON rrrr'),0), translate(to_char(hiredate,'rrrr"년" mm"월" dd"일"'), ' 0', ' ')
    from emp;
--문제2) EMP 테이블에서 20번 부서원의 급여 앞에 $를 삽입하고 3자리마다 ,를 출력하여라.
select trim(to_char(sal,'$999,999,999,999'))
    from emp
    where 20= deptno;
--문제3) february 22, 1981에 입사한 사원의 이름, 업무, 입사일자를 출력하여라. nls_date_language=american일 경우
alter session set nls_language="english";
select * from emp;
select ename, job, hiredate
    from emp
    where to_date(substr('febraury 22,1981',1,3)||substr('febraury 22,1981',-8),'month dd,yyyy')= hiredate;
    
select to_date('febraury 22,1981','month dd,yyyy') from dual;
select 'feb221981' from dual;
select to_date('feb221981','monthddyyyy') from dual;
select substr('febraury 22,1981',1,3)||substr('febraury 22,1981',-8) from dual;

--[ 실습 ]

--문제1) EMP 테이블에서 부서번호가 10이면 ‘A’로, 20이면 ‘B’로, 30이면 ‘C’로 바꾼 뒤 이름, 업무, 부서번호와 함께 출력하여라.
desc emp;
select deptno, decode(deptno,10,'A', 20,'B', 30,'C')
    from emp;
--문제2) EMP 테이블에서 JOB이 ANALYST이면 급여 증가는 10%이고,  CLERK이면 15%, MANAGER이면 20%이고, 다른 업무에 대해서는 급여 증가가 없다. 
--       사원번호, 이름, 업무, 급여, 증가된 급여를 출력하여라.
select empno, ename, job, sal, decode(lower(job),'analyst',sal*1.1, 'clerk',sal*1.15, 'manager',sal*1.2) "급여증가"
    from emp;
--문제3) EMP 테이블의 사원이름, 매니저번호(MGR)를 출력하고, 매니저번호가 null이면 ‘상위관리자’로 표시하고, 매니저번호가 있으면 ‘7869담당‘으로 표시하여라.
select * from emp;
select ename, mgr, decode(mgr,null,'상위관리자','7869담당')
    from emp;

--[ 실습 ] 
------------ 이하는 아직 수업 안 나간부분 '18.1.7.수/ 더 좋은 코드가 있을겨!!

--문제1) emp 테이블을 이용하여 각 부서별로 사원수, 최대연봉, 최소연봉, 평균연봉을 구하고 급여평균으로 정렬하여라.
nope> select sal
    from emp
    order by avg(sal);

desc emp; -- empno: not null
select deptno "부서", count(empno) "사원수", max(sal) "최대연봉", min(sal) "최소연봉", floor(avg(sal)) "평균연봉"
    from emp
    group by deptno
    order by avg(sal) desc;
--문제2) emp 테이블을 이용하여 각 업무별로 사원수, 급여평균을 구하고 업무별로 정렬하여라.
select job "업무", count(empno) "사원수", floor(avg(sal)) "급여평균"
    from emp
    group by job
    order by job
    ;
--문제3) emp 테이블을 이용하여 업무별(JOB), 부서별(DEPTNO)로 그룹화하여 각각의 인원수와 급여평균을 구하고 급여평균이 많은 순으로 정렬하여라.
select job from emp
union
select name from student;

select job "업무별", deptno "부서별", count(empno) "각 인원수", floor(avg(sal)) "급여평균"   -- ???? 뭔 의미?? 아마 맞게 한듯? 
    from emp
    group by job, deptno
    order by avg(sal) desc;
--문제4) EMP 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하여라.
    -- ?? 아마 맞게 했을 걸
select deptno "부서번호", count(empno), sum(sal)        
    from emp
    group by deptno
    having count(empno) >4;
--문제5) EMP 테이블에서 업무별 급여의 평균이 3000 이상인 업무에 대해서 업무명, 평균 급여, 급여의 합을 구하여라.
select job "업무명", floor(avg(sal)) "평균 급여", sum(sal) "급여의 합"     -- ?? 아마 맞겠지
    from emp
    group by job
    having 3000 <= avg(sal);