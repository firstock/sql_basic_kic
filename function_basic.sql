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
    
    
    
-- instr
select * from emp;
select instr(empno,'l') as return from emp; -- ????

select * from student;
select tel, instr(tel,')',1,1) as ")의 위치"
    from student;
    
--    지역번호만 추출하기
select tel, substr(tel,1,instr(tel,')')-1) as "지역번호"
    from student;
    
--    찾는 a는 맨끝이 아니라, 뒤에서 3번째인 5
select 'ababada', instr('ababada','a',-2,1)
    from dual;
    
----    실습문제: instr
select * from emp;
select  empno, ename, lower(job), initcap(job)
    from emp;
   
--   emp테이블에서 이름의 첫 글자가 'K'보다 큰 사원의 사원번호, 이름, 업무 조회
select empno, ename, job
    from emp
    where 'K' < substr(ename,1,1);
    
--    emp에서 이름이 6자리 이상인 사원의 이름,업무
select ename,job
    from emp
    where ename like '______%'; -- % 아무거나 에는 공백도 포함
    
    --다른 방법
select ename,job
    from emp
    where 6<= length(ename);
--    
select ename, instr(ename,'L',1,1) as "이름중 L자 첫 위치"
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
select replace('123412','12','ab') as return from dual; -- 다 바꿈

select * from student;
-- 두번째 글자를 #으로 바꾸기
select replace(name, substr(name,2,1) ,'#')
    from student
    ;

    -- 뒤 7자리를 전부 *로 바꾸고 싶은데..
select replace(jumin, substr(jumin,7,7) ,'*******')
    from student
    ;
    -- 뒤에 오는게 7자리인지 모를땐? ex_주소
nope> select replace(jumin, rpad(substr(jumin,7),13,'*')) --원본그대로 나옴
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

select id, translate(id,'-','')  -- 얜 왜 다 날라감??
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
    
select add_months(sysdate,3) as "3개월후"
    , add_months(sysdate,-3) as "3개월전"
    from dual;
    
select sysdate, next_day(sysdate,'금') as "다음 요일"
    from dual;
    
    -- 그냥은 안 됨
select next_day(sysdate,'FRI') as "다음 요일"
    from dual;
    -- 영어로 찾으려면 세션이 날짜 저장하는 방식을 영어로 바꿔야
alter session set nls_date_language= american;
select next_day(sysdate,'FRI') as "다음 요일"
    from dual;
    -- 대소 구분 X
select next_day(sysdate,'fri') as "다음 요일" 
    from dual;
    
    -- 지금 설정값? 계정 system
select *
    from v$parameter
    where name='nls_date_language';
    
alter session set nls_date_language= korean;

---------- to_char는 양이 많아서 파일 분리

---- null . p50
-- nvl
select sal, comm, nvl(comm,0)
    from emp;
    
select sal, comm, sal+comm, nvl(comm,0)
    from emp;

    -- 바람직
select sal, comm, sal+nvl(comm,0)
    from emp;
    
select hpage, nvl(hpage,'1')
    from prefessor;
    
select hpage, nvl(hpage,1) -- ㄴㄴ
    from prefessor;
    
-- nvl2
select sal, comm, nvl2(comm, '널 아냐','내안에 널있어')
    from emp;
    
select sal, comm, nvl2(comm, comm*1.2, 0)
    from emp;
    
-- decode. 조건  ? T : F
select decode('10','10','십','노십')
    from dual;
    
    --    jumin 1남 2여
select * from student;
select substr(jumin,7,1)
        , decode(substr(jumin,7,1),1, '남','여')
    from student;
    
    
    -- 부서번호 10총무 2재무 3인사
select * from emp;
select decode(deptno,10,'총무',   20,'재무',   30,'인사')
    from emp;
    
select * from emp;
select decode(deptno,10,'총무',   20,'재무',   30,'인사', 'NA')
    from emp;
    
    