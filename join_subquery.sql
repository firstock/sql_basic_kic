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
    
    -- �̸�/��������
select name �̸�, total ��������
    from student, exam_01
    where student.studno= exam_01.studno
    ;
    
    