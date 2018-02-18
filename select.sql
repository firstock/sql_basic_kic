 -- p115~

-- emp> allen�� sal���� ���� �޴� �̸�/sal
select *
  from emp;
 
--allen
select ename,
       sal --1600
  from EMP
 where 'allen'= lower(ename);
 
--1600�̱���. ��?
select ename,
       sal
  from EMP
 where sal > 1600;
 
--�� �ϳ��� ������
select ename,
       sal
  from emp
 where sal > (select sal
                from emp
                where ename='ALLEN');
                
    --emp> �̸�s�� ���� ��� sal< ��� �̸� sal
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

    --�μ��� �ִ뿬��
select deptno, max(sal)
    from emp
    group by deptno;
    
    -- �ִ뿬�� ���� ����
select *
    from emp
    where (deptno, sal) in (select deptno, max(sal)
                                from emp
                                group by deptno)
    ;
    
    --student �г⺰ Űmax �̸��г�Ű
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
    
    --��� �а� �л�����?
select * from student;
select * from department;
select name, grade, height, 
    from student s, department d
    where (grade, height) in (select grade, max(height)
                                from student
                                group by grade)
    and s.deptno1= d.deptno
    ;
    
------------------    ���� �ȵǱ� ����
--����4. �ζ��κ�_from�� ��������
    -- ��� �� ��. �ε�ȣ ��� ���� ���� �ͼ�
nope> select * 
    from emp
    where (deptno, sal) > (select deptno, avg(sal)
                            from emp
                            group by deptno)
;
    -- ��� �Ǵµ�
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

-- student> �г⺰ ���Ű���� ū> �̸��г�Ű
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
    --�ٸ�
select s.name, s.grade, i.���Ű
    from student s, (select grade, avg(HEIGHT) as ���Ű
                        from student
                        group by grade) i
    where  s.height > i.���Ű
    and s.grade= i.grade
;


--student,exam_01�� �г⺰��ռ���
select * from STUDENT;
select * from EXAM_01;

    --��ռ���
select avg(e.total)
    from student s, exam_01 e
    where s.STUDNO= e.STUDNO
    ;
    
    --�г⺰ ��ռ���
select s.grade, avg(e.total)
    from student s, exam_01 e
    where s.STUDNO= e.STUDNO
    group by s.grade
    ;
    
    --�г⺰ ��չ̴� �̸��г⼺��
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
    
select i1.name, i1.grade, i1.total, i2.��ռ���
    from (select s.name, s.grade, e.total
            from student s, EXAM_01 e
            where s.STUDNO= e.studno) i1,
         (select s.GRADE, avg(e.total) ��ռ���
            from STUDENT s, EXAM_01 e
            where s.STUDNO= e.STUDNO
            group by s.GRADE) i2
    where i1.grade= i2.grade
    and i1.total < i2.��ռ���
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

------��Į�� �������� ����2
--outer join (null �� ���� join) �� �Ű� �� �ᵵ �Ǽ�

select name,
       (select name
          from professor p
         where s.profno= p.profno) as ���������̸�
  from student s