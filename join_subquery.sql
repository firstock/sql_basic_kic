-- p.101~
---------- Join
select * from emp;
select * from dept;

-- �μ��̸�dname�� ���ÿ� ��µǾ�����

    --����
select *
    from emp, dept; -- 56��? emp 14 * dept 4 = 56
    
select ename, dname
    from emp, dept
    where emp.deptno = dept.deptno
--    where deptno = deptno
    ;

    -- �� ��� �Ҽ�?
select ename, dname, loc, emp.deptno "emp.deptno", dept.deptno "dept.deptno"
    from emp, dept
    where emp.deptno = dept.deptno
    ;
    
--    
select * from student; -- deptno 1,2 ��1,2����
select * from department;
select * from exam_01; -- 1�� ���輺��

desc student;
desc department;
desc exam_01;

    -- �� ���̺��� �̸�/����/������
select name, birthday, deptno1
    from student, department
    where student.deptno1 = department.deptno
    ;
    
select name, birthday, deptno1
    from student s, department d
    where s.deptno1 = d.deptno
    ;
    
    
    -- �̸�/��������
select name �̸�, total ��������
    from student s, exam_01 e
    where s.studno= e.studno
    ;
    
select name �̸�, total ��������
    from student, exam_01
    where student.studno= exam_01.studno
    ;
    
    -- �̸�/�г�/��1����/��������
select * from student; -- deptno 1,2 ��1,2����
select * from department;
select * from exam_01; -- 1�� ���輺��
select * from professor;

desc student;
desc department;
desc exam_01;
desc professor;
    
select name,grade,deptno1,total
    from student s, department d, exam_01 e1
    where s.DEPTNO1= d.DEPTNO
    and s.studno= e.studno
    order by s.name
    ;
    
    -- ������) �ߺ��� ����. https://goo.gl/3DELzV
select * from EXAM_01;  -- 40��_���� 20��. �갡 2�� ��. why??
                        --> teacher_chapter2���� insert �ѹ� �� �ؼ�.
desc exam_01;
 
    -- �̸�, �г�, 1����, ����, ���������̸�
select s.name, grade, dname, total, p.name
    from student s, department d, exam_01 e, professor p
    where s.deptno1 = d.deptno
    and s.studno= e.studno
    and s.profno= p.profno
    ;
    
    
-- non-equal join
select * from gogak;
select * from gift;
desc gogak;
desc gift;

    --���ϸ����� ���� �� �ִ� ���� ���� ��ǰ
select go.gname, go.point, gi.gname
    from gogak go, gift gi
    where go.point between g_start and g_end
    ;
    
    --���ϸ����� ������ ��� ��ǰ
select go.gname, gi.g_start, gi.gname
    from gogak go, gift gi
    where go.point > gi.g_start
--    group by go.gname
    order by 1
    ;
    
    -- �̸�, �г�, 1����, ����, ���������̸�, ����
select * from student; 
select * from department;
select * from exam_01;
select * from professor;
select * from HAKJUM;

desc student;
desc department;
desc exam_01;
desc professor;
desc HAKJUM;

select s.name, s.grade "student.grade" , d.dname, p.name, h.grade "hakjum.grade"
    from student s, professor p, hakjum h, exam_01 e, department d
    where s.profno= p.profno
    and s.studno= e.studno
    and s.deptno1= d.deptno
    and e.total between h.min_point and h.max_point
    ;
    
   -- �̸�/����/��������/��������<- ����. �Ҽ����� ����
select * from emp2;
select * from p_grade;

    -- �������� �� ��
select e.name
    , ceil(months_between(sysdate,e.birthday)/12) ����
    , p.position ��������
--    ,
    from emp2 e, p_grade p
    where ceil(months_between(sysdate,e.birthday)/12) between p.s_age and p.e_age
--    and
    ;
    
select * from emp2;
select * from p_grade;

select e.name
    , ceil(months_between(sysdate,e.birthday)/12) ����
    , e.position �������� -- ���̺� ������� �� ���� �ִ� ��
    , p.position �������� -- ���޿� ���� ������ ��� �ִ� ���̺�: p_grade
    from emp2 e, p_grade p
    where ceil(months_between(sysdate,e.birthday)/12) between p.s_age and p.e_age
    ;
    
    