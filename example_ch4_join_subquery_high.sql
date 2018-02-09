select * from tab;
--1. student에서 각 학생의 학점을 구하고 각 학점별로 분포된 학생 수를 다음과 같이 구하세요
--   A 4
--   B 12
--   C 3
--   D 1
select * from student;
select * from EXAM_01;
select * from hakjum;

desc student;

select h.GRADE, count(s.studno)
    from student s, exam_01 e, hakjum h
    where s.studno= e.studno
    and e.TOTAL between h.MIN_POINT and h.MAX_POINT
    group by h.GRADE
    ;

--2. student 테이블과 exam_01 테이블을 이용하여 각 학과별 평균 점수와 최고 점수, 최저 점수를 나타내되 
--학과이름, 학과번호와 함께 출력되도록 작성하여라.
select * from student;
select * from exam_01;
select * from department;

select d.DEPTNO, d.DNAME, avg(e.total), max(e.total), min(e.total)
    from student s, EXAM_01 e, DEPARTMENT d
    where s.DEPTNO1= d.DEPTNO
    and s.STUDNO= e.STUDNO
    group by d.deptno, d.dname
    ;

--3. PANMAE 테이블과 PRODUCT 테이블을 이용하여 각 판매일자와 제품별 총 판매수량과 총 매출을 나타내도록 하여라.;
--20110101 새우짱 2 2400
--20110103 새우짱 6 5000
select * from panmae;
select * from product;

select pr.P_NAME, pa.P_DATE 판매일자, sum(pa.P_TOTAL) 총판매수량, sum(pa.P_TOTAL*pr.P_PRICE) 총매출
    from panmae pa, product pr
    where pa.P_CODE= pr.P_CODE
    group by pr.P_NAME, pa.P_DATE
    ;
--4. EMP테이블과 dept 테이블, p_grade 테이블을 이용하여 각 직원의 이름, 부서명, 기존(옛날)직급과 새로운(현재) 직급을 나타내어라.
--단, 새로운 직급은 근속년수를 기준으로 계산한다
select * from emp;
select * from dept;
select * from p_grade;

select * from emp2;
select * from p_grade;

select e.ENAME, d.DNAME
    from emp e, dept d
    where e.DEPTNO= d.DEPTNO
    ;

select e.ENAME 이름, d.DNAME 부서명, e.mgr ,p.POSITION 연차직급 --mgr이 기존직급이라 치자. scott 테이블 다 뒤져봐도 안나옴;;
    from emp e, dept d, p_grade p
    where e.DEPTNO= d.DEPTNO
    and trunc(months_between(sysdate, e.hiredate)/12) between p.s_year and p.e_year
    ;

    -- 다 '이사'인 까닭. 샘플 기준연도가 옛날거라
    select 2018-1987 from dual;

--5. emp테이블과 SALGRADE테이블을 이용하여 각 직원의 sal별 등급을 이용하여 해당 등급별 평균 연봉을 최종적으로 나타내어라.
--단, 평균연봉은 소수 첫번째 자리에서 반올림하여 정수로 나타낸다.
--    1	950
--    2	1267
--    4	2855
--    5	5000
--    3	1550
    
--[ 실습문제 ]    
--1. student 테이블에서 각 학생의 시험성적을 기반으로 
--같은학과에서 본인보다 시험성적이 우수한 학생수를 나타내도록 하여라.
--단, 각 학생의 정보는 학생이름, 학과이름, 시험성적과 함께 출력하여라. (아우터조인은 고려하지 않는다)
select * from tab;
select * from student;


--2. professor 테이블에서 각 학과별 최소연봉을 갖는 교수의 이름, 학과이름, pay를 출력하세요.

--3. student 테이블에서 각 학년별로 본인보다 생년월일이 빠른 학생의 수를 출력하되,
--각 학생의 이름, 학과명, 시험성적과 함께 출력하여라. 단, 모든 학생의 정보가 출력될 수 있도록 하자

--4. student 테이블에서 같은지역, 같은 성별의 친구가 몇명인지 구하고, 그 학생의 담당 교수이름도 
--함께 출력되도록 하여라. 단, 같은지역, 같은 성별에 본인은 포함될 수 없다.

--5. student 테이블과 DEPARTMENT 테이블을 이용하여 성별 별로 몸무게가 가장 많이 나가는 학생의 
--이름과 성별, 몸무게, 학과명을 출력하세요.

--[ 실습문제 ]  
--1. student 테이블에서 각 학생의 성별로 몸무게가 가장 많이 나가는 학생의 이름과 성별, 몸무게, 학과명, 지도교수명을 출력하세요.
--1-1)다중컬럼
--1-2)인라인뷰
--1-3)상호연관

--2.  professor 테이블에서 입사년도(1980,1990,2000년대)별 평균연봉보다 높은 연봉을 받는 교수의 
--이름, 학과명, 연봉, 지도학생 수를 출력하여라. (마음대로)

--3. 학년별 평균점수를 구하고 각 학년별 평균점수보다 낮은 점수를 갖는 학생의 이름, 학번, 점수를 출력하세요

--4. emp 테이블에서의 각 부서별 최고연봉자의 이름, 부서명, 연봉을 구하고 상위관리자와 상위관리자의 연봉도 함께 나타내도록 하여라.

--[ 실습문제 ]  
--1. dept2 테이블을 이용하여 상위부서명을 다음과 같이 출력하세요.
-- "경영지원부의 상위부서는 사장실 입니다."
--단, 상위부서가 없는 경우는 본인부서명이 출력되도록 하여라. (스칼라 서브쿼리 이용)

--2. emp 테이블을 이용하여 부서에서 본인보다 입사년도가 빠른 사람의 수를 각 직원의 이름, 부서명과 함께 출력하세요.
--단, 선배수가 많은 사람 순으로 정렬하세요
--2-1) 조인

--2-2) 스칼라 서브쿼리

--3. emp 테이블을 이용하여 본인과 상위관리자의 평균연봉보다 많은 연봉을 받는 직원의
--이름, 부서명, 연봉, 상위관리자명을 출력하여라.

--4. 교수에 대한 전체 자료를 다음과 같은 형식으로 만들어 보자
--(단, 모든 교수들에 대해 출력되도록 한다)
--교수이름	지도학생수	지도학생_성적평균	A_학점자수	B_학점자수	C_학점자수	D_학점자수
--심슨          	2	        79	                1	        0	        0	        1
--허은	        2	        83	                0	        1	        1	        0
--조인형	        1	        97	                1	        0	        0	        0
