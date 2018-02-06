select * from emp;
desc emp;

select empno, ename
    from emp;
    
select empno as 사원번호, ename as 이름
    from emp;
    
select empno as "사원 번호", ename as "emp_name"
    from emp;
    
select empno as "사원 번호", ename as "emp_name",'text'
    from emp;

select * 
    from emp;

select sal||'+'||comm
    from emp;