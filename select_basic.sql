select * from emp;
desc emp;

select empno, ename
    from emp;
    
select empno as �����ȣ, ename as �̸�
    from emp;
    
select empno as "��� ��ȣ", ename as "emp_name"
    from emp;
    
select empno as "��� ��ȣ", ename as "emp_name",'text'
    from emp;

select * 
    from emp;

select sal||'+'||comm
    from emp;