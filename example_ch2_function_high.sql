--[ 실습 문제 ]
--1) student 테이블에서 1전공(deptno1)이 101번인 학생들의 이름을 출력하되, 두번째 글자만 '*'로 표시되게 출력하세요.
select * from student;
desc student;

select name
    from student
    where 101= deptno1
    ;

select substr('abcd',2,1) from dual;
select replace('abcd','b','#') from dual;

select replace(name, substr(name,2,1),'#')
    from student
    where 101= deptno1
    ;

--2) student 테이블에서 전화번호 국번만 '#' 처리하여 출력하세요.  ex) 051) ###-1700
select tel
    from student
    ;

select replace(tel, substr(tel,4,3),'###') -- 국번이 3 or 4개. 지역번호도 2 or 3개
    from student
    ;

select tel,instr(tel,')')
    from student
    ;

select replace(tel,instr(tel,')'),'#') -- ??? 전혀 의도와 다른
    from student
    ;

select replace(tel,instr(tel,')'),'#') -- 4를 바꾸지말고 index 4를 의도했는데
    from student
    ;


--3) student 테이블에서 전화번호 형식을 다음과 같이 변경하세요.  051)426-1700 => 051 426 1700

--4) emp 테이블을 이용하여 현재까지 근무일수를 XX년 XX개월 XX일 형태로 출력하여라.

--5) professor 테이블을 이용하여 하반기에 입사한 교수이름과 id를 출력하되 id는 '-' 기호를 제외하고 출력하도록 하여라

--[ 실습 문제 ]
--1) emp 테이블에서 JOB에 따라 평균 연봉을 구하고 단, 평균연봉은 천단위 구분기호로 표시하여라.

--2) PROFESSOR 테이블에서 하반기에 입사한 교수들의 입사월별 평균연봉을 구하여라. 단, 연봉은 PAY*12+BONUS로 나타내고, BONUS가 없는 교수는 100을 부여하여 계산하여라.

--3) Student 테이블의 jumin 컬럼을 참조하여 학생들의 이름과 태어난 달, 그리고 분기를 출력하라. 태어난 달이 01-03월 은 1/4분기, 04-06월은 2/4 분기, 07-09 월은 3/4 분기, 10-12월은 4/4 분기로 출력하라 (decode,case모두)

--4) EMP2 테이블에서 출생년도(1960,1970,1980,1990)별로 평균연봉을 구하라.

--5) EMPLOYEES 테이블에서 대소를 구분하지 않고 email에 last_name이 포함되어 있지 않은 사람의 EMPLOYEE_ID, FIRST_NAME, EMAIL을 출력하여라.

--6) professor 에서 홈페이지 주소가 없는 교수는 http://www.naver.com/email_id의 새 홈페이지 주소를 부여하고, 이름, id와 함께 출력하여라. 단, email_id는 email 주소의 @앞의 문자로 가정한다

--7) EMP 테이블을 이용하여 사원이름, 입사일 및 급여검토일을 표시합니다. 급여검토일은 여섯달 근무후 해당되는 첫번째 월요일입니다. 날짜는 "Sunday the Seventh of September, 1981" 형식으로 표시하도록 한다. 열 이름은 check로 한다.(alter session set nls_date_language=american)

--8) 레포트를 작성하고자 한다. emp 테이블을 이용하여 각 부서별 직원수를 출력하되 다음과 같은 형식으로 작성하여라.

--레포트명	       10_직원수	 20_직원수	  30_학생수
----------------------------------------------------------
--본인이름 레포트	        3	         5           6

