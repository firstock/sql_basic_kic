 -- p115~

-- emp> allen의 sal보다 많이 받는 이름/sal
select *
  from emp;
 
--allen
select ename,
       sal --1600
  from EMP
 where 'allen'= lower(ename);
 
--1600이구나. 비교?
select ename,
       sal
  from EMP
 where sal > 1600;
 
--를 하나로 만들자
select ename,
       sal
  from emp
 where sal > (select sal
                from emp
                where ename='ALLEN');
                
    --emp> 이름s로 시작 사람 sal< 사람 이름 sal
nope> select ename, sal
    from emp
    where sal > (select sal
                    from emp
                    where ename like 'S%');

select ename, sal
    from emp
    where sal > (select max(sal)
                    from emp
                    where ename like 'S%');

    --부서별 최대연봉
select deptno, max(sal)
    from emp
    group by deptno;
    
    -- 최대연봉 직원 정보
select *
    from emp
    where (deptno, sal) in (select deptno, max(sal)
                                from emp
                                group by deptno)
    ;
    
    --student 학년별 키max 이름학년키
select * from student;
select max(height)
    from student
    group by grade;

select name, grade, height
    from student
    where (grade, height) in (select grade,max(height)
                            from student
                            group by grade)
    order by height desc
    ;
    
    --어느 학과 학생이지?
select * from student;
select * from department;
select name, grade, height, 
    from student s, department d
    where (grade, height) in (select grade, max(height)
                                from student
                                group by grade)
    and s.deptno1= d.deptno
    ;
    
------------------    이해 안되기 시작
--문제4. 인라인뷰_from에 서브쿼리
    -- 얘는 안 됨. 부등호 대상에 여러 행이 와서
nope> select * 
    from emp
    where (deptno, sal) > (select deptno, avg(sal)
                            from emp
                            group by deptno)
;
    -- 얘는 되는데
select * 
    from emp
    where (deptno, sal) in (select deptno, avg(sal)
                            from emp
                            group by deptno)
;

------    
select *
    from emp
    where deptno in (select deptno
                        from emp
                        group by deptno)
    nope> and sal < (select sal
                from emp
                group by deptno)
;

-- 
select deptno, avg(sal)
  from emp
 group by deptno;

nope> select e.ename, e.sal
    from emp e,
       (select deptno,
               avg(sal)
            from emp
            group by deptno) i
    where e.deptno= i.deptno
    and e.sal > avg(sal)
;

select e.ename, e.sal, round(avg_sal,3)
    from emp e,
       (select deptno, avg(sal) as avg_sal
            from emp
            group by deptno) i
    where e.deptno= i.deptno
    and e.sal > avg_sal
;

-- student> 학년별 평균키보다 큰> 이름학년키
select * from student;

    --sub
select avg(HEIGHT) as avg_h
    from student
    group by grade;

select name, grade, height
    from student s
;

select name, grade, height
    from student s, (select avg(HEIGHT) as avg_h
                        from student
                        group by grade) t_ah
    where  s.height > t_ah.avg_h
;
    --바른
select s.name, s.grade, i.평균키
    from student s, (select grade, avg(HEIGHT) as 평균키
                        from student
                        group by grade) i
    where  s.height > i.평균키
    and s.grade= i.grade
;


--student,exam_01로 학년별평균성적
select * from STUDENT;
select * from EXAM_01;

    --평균성적
select avg(e.total)
    from student s, exam_01 e
    where s.STUDNO= e.STUDNO
    ;
    
    --학년별 평균성적
select s.grade, avg(e.total)
    from student s, exam_01 e
    where s.STUDNO= e.STUDNO
    group by s.grade
    ;
    
    --학년별 평균미달 이름학년성적
select s2.name, s2.grade, e2.total
    from  student s2, exam_01 e2,
        (select s1.grade, avg(e.total) as gr_total
            from student s1, exam_01 e
            where s1.STUDNO= e.STUDNO
            group by s1.grade
            )  i
    where i.gr_total > e2.total
    and s2.grade = i.grade
    and s2.studno = e2.studno
    ;        
    
select i1.name, i1.grade, i1.total, i2.평균성적
    from (select s.name, s.grade, e.total
            from student s, EXAM_01 e
            where s.STUDNO= e.studno) i1,
         (select s.GRADE, avg(e.total) 평균성적
            from STUDENT s, EXAM_01 e
            where s.STUDNO= e.STUDNO
            group by s.GRADE) i2
    where i1.grade= i2.grade
    and i1.total < i2.평균성적
;


---- 
select ename, (select dname from dept where deptno=10)
    from emp;
    
select ename, (select dname from dept)
    from emp;
    
select ename, (select max(dname) from dept)
    from emp;
    
select ename, (select dname from dept d where e.deptno= d.deptno)
    from emp e;
select *  from emp;

------스칼라 서브쿼리 장점2
--outer join (null 값 포함 join) 을 신경 안 써도 되서

select name,
       (select name
          from professor p
         where s.profno= p.profno) as 지도교수이름
  from student s