-- ch1_select
select * from student;

---- �ǽ�����
select name||' �� Ű�� '||height||' cm, �����Դ� '||weight||' kg �Դϴ�'
    from student;
    
--
select * from professor;
select name||' '||position||'��'
    from professor;
    
---- �ǽ�����: where
select * from emp;
select empno as �����ȣ, ename as �̸�, job as ����, sal as �޿�
    from EMP
    where sal >=3000;

--
select empno, ename, job, sal, deptno
    from emp
    where 'manager' = lower(job);
-- 3-how to 1
select empno, ename, job, sal, hiredate, deptno
    from emp
    where 1982= substr(hiredate,1,4); -- wow!
    
select substr(hiredate,1) -- for check. date store format
    from emp;
    --from dual;
    
select substr(hiredate,1,4) from emp; -- for check

select convert(numeric, substr(hiredate,1,4)) -- for check
    from emp;
-- 3-how to 2
select * from emp;

select EMPNO, ENAME, JOB, SAL, HIREDATE, DEPTNO
    from emp
    where hiredate >= '1982/01/01';
    
    
---- �ǽ�����: ������
select * from emp;
--
select ename, job, sal, deptno
    from EMP
    where 1300<= sal and sal <= 1700; -- &, && no apply
--
select ename, job, sal, deptno
    from emp
    where empno in(7902,7788,7566);
--    
select empno, ename, job, sal, hiredate
    from emp
    where 82= substr(hiredate,3,2);
--    
select ename, sal
    from EMP
    where ename like 'M%';
--    #5 
select ename, job
    from EMP
    where ename like'_L%';
--    
select empno, ename, job, sal, hiredate, deptno
    from EMP
    where comm is null;
--    
select empno, ename, job, sal, hiredate, deptno
    from EMP
    where 1100 <= sal
    and 'manager'= lower(job);
--   #8
select empno, ename, job, sal, hiredate, deptno
    from EMP
    where 1400 <= sal
    or initcap(ename) not like 'M%';

select empno, ename, job, sal, hiredate, deptno --for check
    from EMP
    where 1400 <= sal
    or initcap(ename) like 'M%';
    
nope> select empno, ename, job, sal, hiredate, deptno --nope
    from EMP
    where 1400 <= sal
    or 'M%' != initcap(ename);
--    #9
select empno, ename, job, sal, deptno
    from EMP
    where lower(job) not in('manager', 'clerk', 'analyst');

nope> select empno, ename, job, sal, deptno
    from EMP
    where lower(job) not in(manager, clerk, analyst);
--    
select empno, ename, job, sal
    from emp
    where 1500 <= sal
    or 'salesman' = lower(job);

---- �ǽ�: ����
select empno, ename, job, sal, hiredate, deptno
    from emp
    order by hiredate desc;
--    #2
select empno, ename, deptno, sal
    from emp
    order by deptno asc , sal desc-- default asc
    ;
--    #3
select * from emp;

select distinct job, deptno
    from emp
    order by job
    ;