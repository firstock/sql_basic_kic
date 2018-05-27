--https://justpaste.it/1h3z3
SELECT * FROM tab;



--문제: emp 테이블에서 급여(sal)와 커미션(comm) 합계가 10% 인상된 급여보다 많은 사원의 이름, 급여 및 커미션을 표시하도록 한다. 단, comm이 null이 아닌 경우만 나타내도록 한다
SELECT * FROM emp;
SELECT sal 급여, comm 커미션
	FROM emp
	WHERE (sal+ nvl(comm,0)) > 1.1*sal;

--문제: emp 테이블에서 커미션을 받지 않는 사원의 급여를 10% 인상하여 표시하되, 다음의 형식으로 출력하여라. The salary of SMITH after a 10% raise is 880
select 'The salary of '||ename||' after a 10% raise is '||1.1*sal
	from emp
	where nvl(comm,0) = 0;

--문제: emp 테이블에서 12월에 입사한 사람은 보너스를 줄 수 없다고 한다. 12월에 입사한 사람의 사번, 이름, 부서번호를 조회하여라.

--문제: EMP 테이블에서 이름의 첫 글자가 'K'보다 큰 사원의 사원번호, 이름, 업무를 출력하여라.

--문제: student 테이블에서 성이 'ㅅ'인 학생의 학번, 이름, 학년을 출력하여라.

--문제 : 학생 테이블(student)을 사용하여 모든 학생들이 '서진수 의 키는 180 cm, 몸무게는 55 kg 입니다' 와 같은 형식으로 출력 되도록 하고 , 칼럼이름은 “학생의 키와 몸무게”라는 별명으로 출력해 보세요.

--문제: 교수 테이블(professor)을 사용하여 교수의 이름과 직급이 아래와 같이 홍길동 (교수) , 홍길동 '교수' 이렇게 나오도록 출력해보세요. 출력된 컬럼 이름은 교수님 입니다.

--문제 : EMP 테이블에서 급여(sal)가 3000 이상인 사원의 사원번호(empno), 이름(ename), 업무(job), 급여(sal)를 출력하라.

--문제 : EMP 테이블에서 담당업무가 Manager인 사원의 정보를 사원번호, 성명, 업무, 급여, 부서번호(deptno)를 출력하라.

--문제 : EMP 테이블에서 1982년 1월 1일 이후에 입사한 사원의 사원번호, 성명, 업무, 급여, 입사일자(hiredate), 부서번호를 출력하여라.

--문제 : EMP 테이블에서 급여가 1300에서 1700 사이인 사원의 성명, 업무, 급여, 부서번호(deptno)를 출력하여라.

--문제 : EMP테이블에서 사원번호(empno)가 7902, 7788, 7566인 사원의 사원번호, 성명, 업무, 급여, 입사일자(hiredate)를 출력하여라.

--문제 : EMP테이블에서 입사일자가 82년도에 입사한 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하여라.

--문제 : EMP 테이블에서 이름의 첫 글자가 ‘M’인 사원의 이름, 급여를 조회하라.

--문제 : EMP 테이블에서 이름의 두 번째 글자가 ‘L’인 사원의 이름, 업무를 조회하라.

--문제 : EMP 테이블에서 보너스(comm)가 NULL인 사원의 사원번호, 이름, 업무, 급여, 입사일자, 부서번호를 출력하여라.

--문제 : EMP 테이블에서 급여가 1100 이상이고, JOB이 Manager인 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하여라.

--문제 : EMP 테이블에서 급여가 1100 이상이거나, 이름이 M으로 시작하지 않는 사원의 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하여라.

--문제 : EMP 테이블에서 JOB이 Manager, Clerk, Analyst가 아닌 사원의 사원번호, 성명, 업무, 급여, 부서번호를 출력하여라.

--문제 : EMP 테이블에서 JOB이 PRESIDENT이고 급여가 1500 이상이거나 업무가 SALESMAN인 사원의 사원번호, 이름, 업무, 급여를 출력하여라.

--문제 : EMP 테이블에서 가장 최근에 입사한 순으로 사원번호, 이름, 업무, 급여, 입사일자, 부서번호를 출력하여라.

--문제 : EMP 테이블에서 부서번호(deptno)로 정렬한 후 부서번호가 같을 경우 급여(sal)가 많은 순으로 정렬하여 사원번호, 성명, 업무, 부서번호, 급여를 출력하여라.

--문제 : 부서별로 담당하는 업무를 한번씩 조회하라. 단, 업무 기준으로 정렬해서 나오도록 한다.

--문제: student 테이블에서 1전공(deptno1)이 101번인 학생들의 이름을 출력하되, 두번째 글자만 '*'로 표시되게 출력하세요.

--문제: student 테이블에서 전화번호 국번만 '#' 처리하여 출력하세요. ex) 051) ###-1700

--문제: student 테이블에서 전화번호 형식을 다음과 같이 변경하세요. 051)426-1700 => 051 426 1700

--문제: emp 테이블을 이용하여 현재까지 근무일수를 XX년 XX개월 XX일 형태로 출력하여라.

--문제: professor 테이블을 이용하여 하반기에 입사한 교수이름과 id를 출력하되 id는 '-' 기호를 제외하고 출력하도록 하여라

--문제: emp 테이블에서 JOB에 따라 평균 연봉을 구하고 단, 평균연봉은 천단위 구분기호로 표시하여라.

--문제: PROFESSOR 테이블에서 하반기에 입사한 교수들의 입사월별 평균연봉을 구하여라. 단, 연봉은 PAY*12+BONUS로 나타내고, BONUS가 없는 교수는 100을 부여하여 계산하여라.

--문제: Student 테이블의 jumin 컬럼을 참조하여 학생들의 이름과 태어난 달, 그리고 분기를 출력하라. 태어난 달이 01-03월 은 1/4분기, 04-06월은 2/4 분기, 07-09 월은 3/4 분기, 10-12월은 4/4 분기로 출력하라 (decode,case모두)

--문제: EMP2 테이블에서 출생년도(1960,1970,1980,1990)별로 평균연봉을 구하라.

--문제: EMPLOYEES 테이블에서 대소를 구분하지 않고 email에 last_name이 포함되어 있지 않은 사람의 EMPLOYEE_ID, FIRST_NAME, EMAIL을 출력하여라.

--문제: professor 에서 홈페이지 주소가 없는 교수는 http://www.naver.com/email_id의 새 홈페이지 주소를 부여하고, 이름, id와 함께 출력하여라. 단, email_id는 email 주소의 @앞의 문자로 가정한다

--문제: EMP 테이블을 이용하여 사원이름, 입사일 및 급여검토일을 표시합니다. 급여검토일은 여섯달 근무후 해당되는 첫번째 월요일입니다. 날짜는 "Sunday the Seventh of September, 1981" 형식으로 표시하도록 한다. 열 이름은 check로 한다.(alter session set nls_date_language=american)

--문제: 레포트를 작성하고자 한다. emp 테이블을 이용하여 각 부서별 직원수를 출력하되 다음과 같은 형식으로 작성하여라. 레포트명 10_직원수 20_직원수 30_학생수 ---------------------------------------------------------- 본인이름 레포트 3 5 6

--문제: EMP 테이블에서 scott의 사원번호, 성명, 담당업무(소문자로), 담당업무(대문자로), 첫 글자만 대문자로 변환하여 출력하여라.

--문제: EMP 테이블에서 이름의 첫 글자가 ‘K’보다 큰 사원의 사원번호, 이름, 업무를 출력하여라.

--문제: EMP 테이블에서 이름이 6자리 이상인 사원의 이름과 업무를 출력하여라.

--문제: EMP 테이블에서 이름 중 ‘L’자의 첫 위치를 출력하여라.

--문제: 이름에 *를 왼쪽에 채워 모두 동일한 15개의 이름으로 변환하고 업무와 급여를 출력한다.

--문제: 급여를 모두 동일하게 만단위로 보여지게 변환하고 이름과 부서번호를 함께 출력한다.

--문제: EMP 테이블에서 담당 업무 중 좌측에 ‘A’를 삭제하고 급여 중 좌측의 1(숫자)을 삭제하여 출력하여라.

--문제: EMP 테이블에서 담당 업무 중 우측에 ‘T’를 삭제하고 급여 중 우측의 0을 삭제하여 출력하여라.

--문제: EMP 테이블에서 JOB에 ‘A’를 ‘$’로 바꾸어 출력하여라.

--문제: EMP 테이블에서 현재까지 근무일수가 몇 주, 몇 일인가를 출력하여라. 단, 근무일수가 많은 사람 순으로 출력하여라.

--문제: EMP 테이블에서 10번 부서원의 현재까지의 근무 월수를 계산하여 출력하여라.

--문제: EMP 테이블에서 입사한 달의 남은 근무 일수를 계산하여 출력하여라. 단, 토요일과 일요일도 근무일수에 포함한다.

--문제: EMP 테이블에서 10번 부서원의 입사 일자로부터 돌아오는 금요일을 계산하여 출력하여라.

--문제: EMP 테이블에서 10번 부서원의 입사 일자를 '1 MAY 1981'와 '1998년 1월 1일' 의 형태로 각각 출력하여라.

--문제: EMP 테이블에서 20번 부서원의 급여 앞에 $를 삽입하고 3자리마다 ,를 출력하여라.

--문제: february 22, 1981에 입사한 사원의 이름, 업무, 입사일자를 출력하여라. *nls_date_language=american일 경우

--문제: EMP 테이블에서 부서번호가 10이면 ‘A’로, 20이면 ‘B’로, 30이면 ‘C’로 바꾼 뒤 이름, 업무, 부서번호와 함께 출력하여라.

--문제: EMP 테이블에서 JOB이 ANALYST이면 급여 증가는 10%이고, CLERK이면 15%, MANAGER이면 20%이고, 다른 업무에 대해서는 급여 증가가 없다. 사원번호, 이름, 업무, 급여, 증가된 급여를 출력하여라.

--문제: EMP 테이블의 사원이름, 매니저번호(MGR)를 출력하고, 매니저번호가 null이면 ‘상위관리자’로 표시하고, 매니저번호가 있으면 ‘7869담당‘으로 표시하여라.

--문제: emp 테이블을 이용하여 각 부서별로 사원수, 최대연봉, 최소연봉, 평균연봉을 구하고 급여평균으로 정렬하여라.

--문제: emp 테이블을 이용하여 각 업무별로 사원수, 급여평균을 구하고 업무별로 정렬하여라.

--문제: emp 테이블을 이용하여 업무별(JOB), 부서별(DEPTNO)로 그룹화하여 각각의 인원수와 급여평균을 구하고 급여평균이 많은 순으로 정렬하여라.

--문제: EMP 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력하여라.

--문제: EMP 테이블에서 업무별 급여의 평균이 3000 이상인 업무에 대해서 업무명, 평균 급여, 급여의 합을 구하여라.

--문제: student 테이블을 이용하여 구조는 동일하지만 데이터는 없는 테이블을 student_test 테이블로 생성한다.

--문제: 위에 생성된 student_test 테이블에서 birthday 컬럼을 삭제한다

--문제: student_test테이블 맨 끝에 새로운 컬럼을 추가하고 컬럼이름은 birth라고 한다(타입은 date)

--문제: student_test 테이블에 student 테이블의 데이터를 입력하도록 한다.

--문제: 다음의 결과값을 가지고 desc 결과값과 동일하게 나타내도록 하여라;
---- select COLUMN_NAME as "Column",
---- nullable,
---- data_type
---- from user_tab_columns where table_name='EMP';
---- ** 컬럼의 DATA TYPE을 만드는 방법
---- VARCHAR2 TYPE일 경우의 SIZE는 DATA_LENGTH 컬럼 사용
---- NUMBER TYPE일 경우 SIZE는 DATA_PRECISION,DATA_SCALE
---- DATE TYPE일 경우는 SIZE는 무시

--문제: student2 테이블을 student 테이블과 동일하게 만들고 student2 테이블에서 제1의 전공번호가 301인 학생들의
--출생년도와 동일한 학생들을 삭제하여라.

--문제: student2 테이블에 성별 컬럼을 새로 추가하고, 각 학생들의 성별로 update 하여라. 성별은 여자,남자로 입력되도록 한다; select * from student;

--문제: student2 테이블에 비만여부를 나타내는 컬럼을 새로 추가하고, 각 학생들의 비만정보를 update 하여라. 비만여부는 체중이 표준체중보다 크면 과체중, 작으면 저체중, 같으면 표준으로 분류하여라. *표준체중 = (키-100)*0.9

--문제: student2 테이블의 jumin 컬럼을 'XXXXXX-XXXXXXX'형태로 변경하여 UPDATE가 되게 하여라. 단, 업데이트 시 에러를 잘 살펴보고 그에 따른 조치를 취하여라.

--문제: emp2 테이블에서 각 부서별 최저연봉을 받는 직원을 찾아 삭제하여라.

--문제:salgrade 테이블에 다음의 제약조건을 생성하여라.
---- grade : 기본키
---- losal, hisal : not null

--문제:student_test 테이블을 student테이블과 동일하게 생성하고 student_test 테이블의 id, studno 컬럼에 unique 제약조건을 추가하여라. 다음을 수행하여라.
---- insert into student_test(studno, name, id, jumin, profno)
---- values(9999,'hong','aaaa','8612092229344',5000);
---- commit;

--문제:student_test 테이블의 profno 가 professor 테이블의 profno를 참조하도록 하여라. 참조되지않는다면, 참조되지 않는 데이터의 PROFNO를 PROFESSOR의 최대값으로 변경하고 참조되도록 만들어라.

--문제:다음의 데이터가 입력허용되도록 student 테이블의 제약조건을 찾아 disable한 후 입력
---- insert into STUDENT
---- select * from STUDENT where ID like '%a%';

--문제:student 테이블의 제약조건을 다시 enable validate 하려고 한다. 하지만 이미 id에 중복값이 들어가 있어 제약조건 enable할 수 없다. id가 중복인 데이터를 지우는 쿼리를 작성하여 중복된 데이터를 지운 후 제약조건을 enable하여라.

--문제: emp2테이블과 p_grade 테이블을 조회하여 사원의 이름과 직급, 현재 연봉, 해당 직급의 연봉의 하한금액과 상한 금액을 출력

--문제: 1전공deptno1이 101번인 학생들의 학생 이름과 지도교수 이름을 출력

--문제: gogak 테이블과 gift 테이블을 join하여 고객이 자기포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때, 산악용 자전거를 선택할 수 있는 고객명과 포인트, 상품명을 출력

--문제: gogak 테이블과 gift 테이블을 join하여 고객이 자기포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때, 점주 입장에서는 각 상품별로 최대 몇 개의 상품이 필요한지 각 상품별 수량을 출력

--문제: emp2테이블과 p_grade 테이블을 조회하여 사원들의 이름과 나이, 현재직급, 예상직급을 출력, 예상직급은 나이로 계산하며 소수점이하는 생략

--문제: student에서 각 학생의 학점을 구하고 각 학점별로 분포된 학생 수를 다음과 같이 구하세요
---- A 4
---- B 12
---- C 3
---- D 1

--문제: student 테이블과 exam_01 테이블을 이용하여 각 학과별 평균 점수와 최고 점수, 최저 점수를 나타내되 학과이름, 학과번호와 함께 출력되도록 작성하여라.

--문제: PANMAE 테이블과 PRODUCT 테이블을 이용하여 각 판매일자와 제품별 총 판매수량과 총 매출을 나타내도록 하여라.;
---- 110101 새우짱 2 2400
---- 110103 새우짱 6 5000

--문제: EMP테이블과 dept 테이블, p_grade 테이블을 이용하여 각 직원의 이름, 부서명, 기존직급과 새로운 직급을 나타태어라. 단, 새로운 직급은 근속년수를 기준으로 계산한다

--문제: emp테이블과 SALGRADE테이블을 이용하여 각 직원의 sal별 등급을 이용하여 해당 등급별 평균 연봉을 최종적으로 나타내어라. 단, 평균연봉은 소수 첫번째 자리에서 반올림하여 정수로 나타낸다.
---- 1 950
---- 2 1267
---- 4 2855
---- 5 5000
---- 3 1550

--문제: student 테이블에서 각 학생의 시험성적을 기반으로 같은학과에서 본인보다 시험성적이 우수한 학생수를 나타내도록 하여라. 단, 각 학생의 정보는 학생이름, 학과이름, 시험성적과 함께 출력하여라. (아우터조인은 고려하지 않는다)
SELECT * FROM tab;
SELECT * FROM student;
SELECT * FROM department;
SELECT * FROM exam_01;

SELECT s.name, d.dname, e. total
	FROM student s, department d, exam_01 e
	WHERE s.deptno1= d.deptno
	AND s.studno= e.studno
	;
--문제: professor 테이블에서 각 학과별 최소연봉을 갖는 교수의 이름, 학과이름, pay를 출력하세요.

--문제: student 테이블에서 각 학년별로 본인보다 생년월일이 빠른 학생의 수를 출력하되, 각 학생의 이름, 학과명, 시험성적과 함께 출력하여라. 단, 모든 학생의 정보가 출력될 수 있도록 하자
--왜안됨?? DESC student;
SELECT * FROM student;
SELECT * FROM department;
SELECT * FROM exam_01;

								--요구사항이 뭔지 헷갈림
	-- 본인보다 생년월일이 빠른 학생 수
SELECT s1.grade, count(s2.studno)
	FROM student s1, student s2
	WHERE s1.birthday > s2.birthday
	GROUP BY s1.grade
	;
;
SELECT s.namem, d.dname, e.total
	FROM student s, department d, exam_01 e
	WHERE 
--문제: student 테이블에서 같은지역, 같은 성별의 친구가 몇명인지 구하고, 그 학생의 담당 교수이름도 함께 출력되도록 하여라. 단, 같은지역, 같은 성별에 본인은 포함될 수 없다.

--문제: student 테이블과 DEPARTMENT 테이블을 이용하여 성별 별로 몸무게가 가장 많이 나가는 학생의 이름과 성별, 몸무게, 학과명을 출력하세요.

--문제: student 테이블에서 각 학생의 성별로 몸무게가 가장 많이 나가는 학생의
--이름과 성별, 몸무게, 학과명, 지도교수명을 출력하세요.
---- 1)다중컬럼
---- 2)인라인뷰
---- 3)상호연관

--문제: professor 테이블에서 입사년도(1980,1990,2000년대)별 평균연봉보다 높은 연봉을 받는 교수의 이름, 학과명, 연봉, 지도학생 수를 출력하여라. (마음대로)

--문제: 학년별 평균점수를 구하고 각 학년별 평균점수보다 낮은 점수를 갖는 학생의 이름, 학번, 점수를 출력하세요

--문제: emp 테이블에서의 각 부서별 최고연봉자의 이름, 부서명, 연봉을 구하고 상위관리자와 상위관리자의 연봉도 함께 나타내도록 하여라.

--문제: dept2 테이블을 이용하여 상위부서명을 다음과 같이 출력하세요. "경영지원부의 상위부서는 사장실 입니다."단, 상위부서가 없는 경우는 본인부서명이 출력되도록 하여라. (스칼라 서브쿼리 이용)

--문제: emp 테이블을 이용하여 부서에서 본인보다 입사년도가 빠른 사람의 수를 각 직원의 이름, 부서명과 함께 출력하세요. 단, 선배수가 많은 사람 순으로 정렬하세요
---- 문제:1) 조인
---- 문제:2) 스칼라 서브쿼리

--문제: emp 테이블을 이용하여 본인과 상위관리자의 평균연봉보다 많은 연봉을 받는 직원의 이름, 부서명, 연봉, 상위관리자명을 출력하여라.

--문제: 교수에 대한 전체 자료를 다음과 같은 형식으로 만들어 보자 (단, 모든 교수들에 대해 출력되도록 한다)
---- 교수이름 지도학생수 지도학생_성적평균 A_학점자수 B_학점자수 C_학점자수 D_학점자수
---- 심슨 2 79 1 0 0 1
---- 허은 2 83 0 1 1 0
---- 조인형 1 97 1 0 0 0