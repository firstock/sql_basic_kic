 --ch4
--1. emp2테이블과 p_grade 테이블을 조회하여 사원의 이름과 직급, 현재 연봉, 해당 직급의 연봉의 하한금액과 상한 금액을 출력
select * from emp2;
select * from p_grade;
--2. 1전공deptno1이 101번인 학생들의 학생 이름과 지도교수 이름을 출력
select * from emp2;
select * from professor;
--3. gogak 테이블과 gift 테이블을 join하여 고객이 자기포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때, 산악용 자전거를 선택할 수 있는 고객명과 포인트, 상품명을 출력
select * from gogak;
select * from gift;
--4. gogak 테이블과 gift 테이블을 join하여 고객이 자기포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때, 점주 입장에서는 각 상품별로 최대 몇 개의 상품이 필요한지 각 상품별 수량을 출력
select * from gogak;
select * from gift;
--5. emp2테이블과 p_grade 테이블을 조회하여 사원들의 이름과 나이, 현재직급, 예상직급을 출력, 예상직급은 나이로 계산하며 소수점이하는 생략
select * from emp2;
select * from p_grade;