 --1. emp ���̺��� �޿�(sal)�� Ŀ�̼�(comm) �հ谡 10% �λ�� �޿����� ���� ����� �̸�, �޿� �� Ŀ�̼��� ǥ���ϵ��� �Ѵ�. ��, comm�� null�� �ƴ� ��츸 ��Ÿ������ �Ѵ�
select * from emp;
desc emp;
select ename "�̸�", sal "�޿�", comm "Ŀ�̼�"
    from emp
    where sal*1.1 < sal+comm    -- sal+nvl(comm,0) ���� null �ƴҶ��� ��ȸ�̹Ƿ� �н�
    and 0 != nvl(comm,0)
    ;
    
    -- null�̸� ��������� �� �Ǵ�, null �̶� ���Ѵ� ��ü�� ����
nope> select ename "�̸�", sal "�޿�", comm "Ŀ�̼�"
    from emp
    where sal*1.1 < sal+comm
    and null != comm
    ;
--2. emp ���̺��� Ŀ�̼��� ���� �ʴ� ����� �޿��� 10% �λ��Ͽ� ǥ���ϵ�, ������ �������� ����Ͽ���. The salary of SMITH after a 10% raise is 880
select comm, 'The salary of '||ename||' after a 10% raise is '||sal*1.1
    from emp
    where 0= nvl(comm,0)
    ;
--3. emp ���̺��� 12���� �Ի��� ����� ���ʽ��� �� �� ���ٰ� �Ѵ�. 12���� �Ի��� ����� ���, �̸�, �μ���ȣ�� ��ȸ�Ͽ���.
select empno, ename, deptno
    from emp
    where 12= to_char(hiredate,'mm')
    ;
    
select to_char(hiredate,'mm') -- for check
    from emp;
    
    -- ���� to_char��� �� ���� ���?
--4. EMP ���̺��� �̸��� ù ���ڰ� 'K'���� ū ����� �����ȣ, �̸�, ������ ����Ͽ���.
select empno"�����ȣ",ename"�̸�",job"����"
    from emp
    where 'K'< initcap(substr(ename,1,1));
--5. student ���̺��� ���� '��'�� �л��� �й�, �̸�, �г��� ����Ͽ���.
select * from student;
desc student;

select 