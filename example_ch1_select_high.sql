 --1. emp 테이블에서 급여(sal)와 커미션(comm) 합계가 10% 인상된 급여보다 많은 사원의 이름, 급여 및 커미션을 표시하도록 한다. 단, comm이 null이 아닌 경우만 나타내도록 한다
select * from emp;
desc emp;
select ename "이름", sal "급여", comm "커미션"
    from emp
    where sal*1.1 < sal+comm    -- sal+nvl(comm,0) 차피 null 아닐때만 조회이므로 패스
    and 0 != nvl(comm,0)
    ;
    
    -- null이면 산술연산이 안 되니, null 이랑 비교한단 자체가 에러
nope> select ename "이름", sal "급여", comm "커미션"
    from emp
    where sal*1.1 < sal+comm
    and null != comm
    ;
--2. emp 테이블에서 커미션을 받지 않는 사원의 급여를 10% 인상하여 표시하되, 다음의 형식으로 출력하여라. The salary of SMITH after a 10% raise is 880
select comm, 'The salary of '||ename||' after a 10% raise is '||sal*1.1
    from emp
    where 0= nvl(comm,0)
    ;
--3. emp 테이블에서 12월에 입사한 사람은 보너스를 줄 수 없다고 한다. 12월에 입사한 사람의 사번, 이름, 부서번호를 조회하여라.
select empno, ename, deptno
    from emp
    where 12= to_char(hiredate,'mm')
    ;
    
select to_char(hiredate,'mm') -- for check
    from emp;
    
    -- 느린 to_char대신 더 좋은 방법?
--4. EMP 테이블에서 이름의 첫 글자가 'K'보다 큰 사원의 사원번호, 이름, 업무를 출력하여라.
select empno"사원번호",ename"이름",job"업무"
    from emp
    where 'K'< initcap(substr(ename,1,1));
--5. student 테이블에서 성이 'ㅅ'인 학생의 학번, 이름, 학년을 출력하여라.
select * from student;
desc student;

select 