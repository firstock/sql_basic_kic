-- p.101~
---------- Join
select * from emp;
select * from dept;

-- 부서이름dname이 동시에 출력되었으면

    --쉽게
select *
    from emp, dept; -- 56행? emp 14 * dept 4 = 56
    
select ename, dname
    from emp, dept
    where emp.deptno = dept.deptno
--    where deptno = deptno
    ;

    -- 얜 어디 소속?
select ename, dname, loc, emp.deptno "emp.deptno", dept.deptno "dept.deptno"
    from emp, dept
    where emp.deptno = dept.deptno
    ;
    
--    
select * from student; -- deptno 1,2 제1,2전공
select * from department;
select * from exam_01; -- 1차 시험성적

desc student;
desc department;
desc exam_01;

    -- 두 테이블에서 이름/생일/주전공
select name, birthday, deptno1
    from student, department
    where student.deptno1 = department.deptno
    ;
    
    -- 이름/시험점수
select name 이름, total 시험점수
    from student, exam_01
    where student.studno= exam_01.studno
    ;
    
    