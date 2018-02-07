---- ch2_function
select * from student;
--
select name||'�� Ű�� '||height||' cm, �����Դ� '||weight||' kg �Դϴ�'
    as "�л��� Ű�� ������            " --��? ª���� ©���� ���⼭ ��� ����
    from student;
    
select name, height, weight
    from student;
    
select name,'�� Ű�� ',height,' cm,�����Դ� ',weight,'kg �Դϴ�'
    from student;
--    
--[�ǽ�]

--����1) EMP ���̺��� scott�� �����ȣ, ����, ������(�ҹ��ڷ�), ������(�빮�ڷ�), ù ���ڸ� �빮�ڷ� ��ȯ�Ͽ� ����Ͽ���.
select * from emp;
select empno, ename, lower(job), initcap(job)
    from emp;
--����2) EMP ���̺��� �̸��� ù ���ڰ� ��K������ ū ����� �����ȣ, �̸�, ������ ����Ͽ���.
select empno, ename, job
    from EMP
    where upper(substr(ename,1,1)) > 'K';
--����3) EMP ���̺��� �̸��� 6�ڸ� �̻��� ����� �̸��� ������ ����Ͽ���.
select ename, job
    from emp
    where length(ename) >= 6;
--����4) EMP ���̺��� �̸� �� ��L������ ù ��ġ�� ����Ͽ���.
select ename, decode(instr(ename,'L',1),0,'����',instr(ename,'L',1)) as "L ù ��ġ"
    from emp;
    
--[�ǽ�]

--����1) �̸��� *�� ���ʿ� ä�� ��� ������ 15���� �̸����� ��ȯ�ϰ� ������ �޿��� ����Ѵ�.
select lpad(ename,15,'*'), job, sal
    from emp;

--����2) �޿��� ��� �����ϰ� �������� �������� ��ȯ�ϰ� �̸��� �μ���ȣ�� �Բ� ����Ѵ�.
select trim(to_char(sal,'999,999,999,999')), ename, deptno
    from emp;
--����3) EMP ���̺��� ��� ���� �� ������ ��A���� �����ϰ� �޿� �� ������ 1(����)�� �����Ͽ� ����Ͽ���.
select job, sal from emp;
select ltrim(job,'A'), ltrim(sal,1)
    from emp;
--����4) EMP ���̺��� ��� ���� �� ������ ��T���� �����ϰ� �޿� �� ������ 0�� �����Ͽ� ����Ͽ���.
select rtrim(job,'T'), rtrim(sal,0)
    from emp;
--����5) EMP ���̺��� JOB�� ��A���� ��$���� �ٲپ� ����Ͽ���.
select translate(job,'A','$')
    from emp;
--[ �ǽ� ]

--����1) EMP ���̺��� ������� �ٹ��ϼ��� �� ��, �� ���ΰ��� ����Ͽ���.  ��, �ٹ��ϼ��� ���� ��� ������ ����Ͽ���.
select * from emp;
select sysdate-hiredate as ��¥����, months_between(sysdate, hiredate) as ������  -- ver 0.7
    from emp
    order by months_between(sysdate, hiredate) desc
    ;
    
    -- ������ ����? mod
select floor((sysdate-hiredate)/7)||'�� '||mod(floor(sysdate-hiredate),7)||'��'   -- ���� �´µ�, �ȹ�� �Լ��ݾ�. �� �����Ѱ� ������
    from emp
    order by months_between(sysdate, hiredate) desc
    ;
    
select trunc(123.65), floor(123.65) from dual;
select trunc(-123.65), floor(-123.65) from dual;
--����2) EMP ���̺��� 10�� �μ����� ��������� �ٹ� ������ ����Ͽ� ����Ͽ���. 
desc emp;
select * from emp;
select trunc(months_between(sysdate, hiredate)) "10���μ� �ٹ�����"
    from emp
    where 10= deptno;
    
--����3) EMP ���̺��� �Ի��� ���� ���� �ٹ� �ϼ��� ����Ͽ� ����Ͽ���. ��, ����ϰ� �Ͽ��ϵ� �ٹ��ϼ��� �����Ѵ�. (ù�� ���������+����?)
select hiredate,last_day(hiredate),last_day(hiredate)-hiredate+1 "�������� �����ٹ��ϼ�"
    from emp;
    
select hiredate
    from emp;
--����4) EMP ���̺��� 10�� �μ����� �Ի� ���ڷκ��� ���ƿ��� �ݿ����� ����Ͽ� ����Ͽ���.
alter session set nls_language= korea;
select hiredate, next_day(hiredate,'��')
    from emp;

--[ �ǽ� ] 

--����1) EMP ���̺��� 10�� �μ����� �Ի� ���ڸ� '1 MAY 1981'�� '1998�� 1�� 1��' �� ���·� ���� ����Ͽ���.
alter session set nls_language= english;
select ltrim(to_char(hiredate,'dd MON rrrr'),0), translate(to_char(hiredate,'rrrr"��" mm"��" dd"��"'), ' 0', ' ')
    from emp;
--����2) EMP ���̺��� 20�� �μ����� �޿� �տ� $�� �����ϰ� 3�ڸ����� ,�� ����Ͽ���.
select trim(to_char(sal,'$999,999,999,999'))
    from emp
    where 20= deptno;
--����3) february 22, 1981�� �Ի��� ����� �̸�, ����, �Ի����ڸ� ����Ͽ���. nls_date_language=american�� ���
alter session set nls_language="english";
select * from emp;
select ename, job, hiredate
    from emp
    where to_date(substr('febraury 22,1981',1,3)||substr('febraury 22,1981',-8),'month dd,yyyy')= hiredate;
    
select to_date('febraury 22,1981','month dd,yyyy') from dual;
select 'feb221981' from dual;
select to_date('feb221981','monthddyyyy') from dual;
select substr('febraury 22,1981',1,3)||substr('febraury 22,1981',-8) from dual;

--[ �ǽ� ]

--����1) EMP ���̺��� �μ���ȣ�� 10�̸� ��A����, 20�̸� ��B����, 30�̸� ��C���� �ٲ� �� �̸�, ����, �μ���ȣ�� �Բ� ����Ͽ���.
desc emp;
select deptno, decode(deptno,10,'A', 20,'B', 30,'C')
    from emp;
--����2) EMP ���̺��� JOB�� ANALYST�̸� �޿� ������ 10%�̰�,  CLERK�̸� 15%, MANAGER�̸� 20%�̰�, �ٸ� ������ ���ؼ��� �޿� ������ ����. 
--       �����ȣ, �̸�, ����, �޿�, ������ �޿��� ����Ͽ���.
select empno, ename, job, sal, decode(lower(job),'analyst',sal*1.1, 'clerk',sal*1.15, 'manager',sal*1.2) "�޿�����"
    from emp;
--����3) EMP ���̺��� ����̸�, �Ŵ�����ȣ(MGR)�� ����ϰ�, �Ŵ�����ȣ�� null�̸� �����������ڡ��� ǥ���ϰ�, �Ŵ�����ȣ�� ������ ��7869��确���� ǥ���Ͽ���.
select * from emp;
select ename, mgr, decode(mgr,null,'����������','7869���')
    from emp;

--[ �ǽ� ] 
------------ ���ϴ� ���� ���� �� �����κ� '18.1.7.��/ �� ���� �ڵ尡 ������!!

--����1) emp ���̺��� �̿��Ͽ� �� �μ����� �����, �ִ뿬��, �ּҿ���, ��տ����� ���ϰ� �޿�������� �����Ͽ���.
nope> select sal
    from emp
    order by avg(sal);

desc emp; -- empno: not null
select deptno "�μ�", count(empno) "�����", max(sal) "�ִ뿬��", min(sal) "�ּҿ���", floor(avg(sal)) "��տ���"
    from emp
    group by deptno
    order by avg(sal) desc;
--����2) emp ���̺��� �̿��Ͽ� �� �������� �����, �޿������ ���ϰ� �������� �����Ͽ���.
select job "����", count(empno) "�����", floor(avg(sal)) "�޿����"
    from emp
    group by job
    order by job
    ;
--����3) emp ���̺��� �̿��Ͽ� ������(JOB), �μ���(DEPTNO)�� �׷�ȭ�Ͽ� ������ �ο����� �޿������ ���ϰ� �޿������ ���� ������ �����Ͽ���.
select job from emp
union
select name from student;

select job "������", deptno "�μ���", count(empno) "�� �ο���", floor(avg(sal)) "�޿����"   -- ???? �� �ǹ�?? �Ƹ� �°� �ѵ�? 
    from emp
    group by job, deptno
    order by avg(sal) desc;
--����4) EMP ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ����Ͽ���.
    -- ?? �Ƹ� �°� ���� ��
select deptno "�μ���ȣ", count(empno), sum(sal)        
    from emp
    group by deptno
    having count(empno) >4;
--����5) EMP ���̺��� ������ �޿��� ����� 3000 �̻��� ������ ���ؼ� ������, ��� �޿�, �޿��� ���� ���Ͽ���.
select job "������", floor(avg(sal)) "��� �޿�", sum(sal) "�޿��� ��"     -- ?? �Ƹ� �°���
    from emp
    group by job
    having 3000 <= avg(sal);