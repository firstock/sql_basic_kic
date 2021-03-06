 -- p.101~

---------- Join
select *
  from emp;
 
select *
  from dept;
 
-- 부서이름dname이 동시에 출력되었으면

--쉽게
select *
  from emp,
       dept;
 
-- 56행? emp 14 * dept 4 = 56
select ename,
       dname
  from emp,
       dept
 where emp.deptno = dept.deptno
--    where deptno = deptno
       ;
 
-- 얜 어디 소속?
select ename,
       dname,
       loc,
       emp.deptno "emp.deptno",
       dept.deptno "dept.deptno"
  from emp,
       dept
 where emp.deptno = dept.deptno ;
 
--    
select *
  from student;
 
-- deptno 1,2 제1,2전공
select *
  from department;
 
select *
  from exam_01;
 
-- 1차 시험성적
       desc student;
 desc department;
 desc exam_01;
 
-- 두 테이블에서 이름/생일/주전공
select name,
       birthday,
       deptno1
  from student,
       department
 where student.deptno1 = department.deptno ;
 
select name,
       birthday,
       deptno1
  from student s,
       department d
 where s.deptno1 = d.deptno ;
 
-- 이름/시험점수
select name 이름,
       total 시험점수
  from student s,
       exam_01 e
 where s.studno= e.studno ;
 
select name 이름,
       total 시험점수
  from student,
       exam_01
 where student.studno= exam_01.studno ;
 
-- 이름/학년/제1전공/시험점수
select *
  from student;
 
-- deptno 1,2 제1,2전공
select *
  from department;
 
select *
  from exam_01;
 
-- 1차 시험성적
select *
  from professor;
 desc student;
 desc department;
 desc exam_01;
 desc professor;
 
select name,
       grade,
       deptno1,
       total
  from student s,
       department d,
       exam_01 e1
 where s.DEPTNO1= d.DEPTNO
   and s.studno= e.studno
 order by s.name ;
 
-- 수업외) 중복행 제거. https://goo.gl/3DELzV
select *
  from EXAM_01;
 
-- 40개_원래 20개. 얘가 2번 들어감. why??

--> teacher_chapter2에서 insert 한번 더 해서.
       desc exam_01;
 
-- 이름, 학년, 1전공, 점수, 지도교수이름
select s.name,
       grade,
       dname,
       total,
       p.name
  from student s,
       department d,
       exam_01 e,
       professor p
 where s.deptno1 = d.deptno
   and s.studno= e.studno
   and s.profno= p.profno ;
 
-- non-equal join
select *
  from gogak;
 
select *
  from gift;
 desc gogak;
 desc gift;
 
--마일리지별 받을 수 있는 제일 좋은 상품
select go.gname,
       go.point,
       gi.gname
  from gogak go,
       gift gi
 where go.point between g_start and g_end ;
 
--마일리지별 가능한 모든 상품
select go.gname,
       gi.g_start,
       gi.gname
  from gogak go,
       gift gi
 where go.point > gi.g_start
--    group by go.gname
 order by 1 ;
 
-- 이름, 학년, 1전공, 점수, 지도교수이름, 학점
select *
  from student;
 
select *
  from department;
 
select *
  from exam_01;
 
select *
  from professor;
 
select *
  from HAKJUM;
 desc student;
 desc department;
 desc exam_01;
 desc professor;
 desc HAKJUM;
 
select s.name,
       s.grade "student.grade" ,
       d.dname,
       p.name,
       h.grade "hakjum.grade"
  from student s,
       professor p,
       hakjum h,
       exam_01 e,
       department d
 where s.profno= p.profno
   and s.studno= e.studno
   and s.deptno1= d.deptno
   and e.total between h.min_point and h.max_point ;
 
-- 이름/나이/현재직급/예상직급<- 나이. 소수이하 생략
select *
  from emp2;
 
select *
  from p_grade;
 
-- 예상직급 못 함
select e.name ,
       ceil(months_between(sysdate, e.birthday)/12) 나이 ,
       p.position 현재직급
--    ,
  from emp2 e,
       p_grade p
 where ceil(months_between(sysdate, e.birthday)/12) between p.s_age and p.e_age
--    and
       ;
 select *
  from emp2;
 
select *
  from p_grade;
 
select e.name ,
       ceil(months_between(sysdate, e.birthday)/12) 나이 ,
       e.position 현재직급 -- 테이블에 사원별로 값 따로 있는 것
       ,
       p.position 예상직급 -- 직급에 대한 정보만 담고 있는 테이블: p_grade
  from emp2 e,
       p_grade p
 where ceil(months_between(sysdate, e.birthday)/12) between p.s_age and p.e_age ;
 select *
  from tab;
 
-- outer join. 사라진 데이터 찾기
select *
  from professor;
 desc professor;
 
select s.name 학생이름,
       p.name 지도교수이름
  from student s,
       professor p
 where s.profno= p.profno ;
 desc professor;
 
select s.name 학생이름,
       p.name 지도교수이름
  from student s,
       professor p
 where s.profno= p.profno(+) ;
 select s.name 학생이름,
       p.name 지도교수이름
  from student s,
       professor p
 where s.profno(+)= p.profno ;
 select s.name 학생이름,
       p.name 지도교수이름
  from student s,
       professor p
 where s.profno= p.profno(+)
 union
select s.name 학생이름,
       p.name 지도교수이름
  from student s,
       professor p
 where s.profno(+)= p.profno ;
 
 select *
  from emp;
 
--  self join
select * from dept2;
select a.dname 부서명, b.dname 상위부서명
    from dept2 a, dept2 b
    where a.pdept= b.dcode
    order by 1;
    
select a.dname 부서명, b.dname 상위부서명
    from dept2 a, dept2 b
    where a.pdept= b.dcode(+)
    order by 1;
    
    -- emp 테이블에서 이름/sal/상위관리자이름/상위관리자sal.상위관리자없어도 출력
select * from emp;

nope> select e1.ename 이름, e1.sal 연봉, e2.ename 상사이름, e2.sal 상사연봉, e2.sal-e1.sal
    from emp e1, emp e2
    where e1.empno= e2.mgr(+)
    order by e2.sal-e1.sal;
    
select e1.ename 이름, e1.sal 연봉, e2.ename 상사이름, e2.sal 상사연봉, e1.sal-e2.sal, nvl(e2.ename,'최상위관리자')
    from emp e1, emp e2
    where e1.mgr= e2.empno(+)
    order by e1.sal-e2.sal;
    
    -- 각 직원별 담당직원수
select * from emp;

select nvl(e2.ename, '최상위관리자'), count(e1.ename) 바로밑부하직원수
    from emp e1, emp e2
    where e1.mgr= e2.empno(+)
    group by nvl(e2.ename,'최상위관리자');
    
    --같은 학급에서 키가 더 큰 사람
select * from student;

select s1.name 학생이름, s2.name "같은학년 학생이름"
    from student s1, student s2
    where s1.grade= s2.grade
    and s1.name != s2.name
    order by 학생이름;
    
select s1.name 학생이름, s1.HEIGHT 내키, s2.name "같은학년 학생이름", s2.HEIGHT 더키큰녀석
    from student s1, student s2
    where s1.grade= s2.grade
    and s1.name != s2.name
    and s1.height < s2.height
    order by 학생이름;
    
select s1.name 학생이름, count(s2.name) 나보다키큰애들
    from student s1, student s2
    where s1.grade= s2.grade
    and s1.name != s2.name
    and s1.height < s2.height
    group by s1.name
    order by 학생이름;
    
select s1.name 학생이름, count(s2.name) 나보다키큰애들
    from student s1, student s2
    where s1.grade= s2.grade(+)
    and s1.name != s2.name(+)
    and s1.height < s2.height(+)
    group by s1.name
    order by 학생이름;