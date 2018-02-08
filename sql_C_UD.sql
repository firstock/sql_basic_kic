-- p.65~
-- create, insert, alter, delete, truncate, drop, 
-- dictionary
create table employees_ex6
(   department_id not null number, --???????? 왜안됨
    first_name varchar(10),
    area varchar(10)
);

insert into employees_ex6(department_id, first_name, area)
    values (9000, 'James', 'seoul');
    
    
-- where가 생략되면 전체 행이 update됨
update 테이블
    set 컬럼=값
    where 조건(or 서브쿼리가능)
    ;
    