-- p.65~
-- create, insert, alter, delete, truncate, drop, 
-- dictionary
create table employees_ex6
(   department_id not null number, --???????? �־ȵ�
    first_name varchar(10),
    area varchar(10)
);

insert into employees_ex6(department_id, first_name, area)
    values (9000, 'James', 'seoul');
    
    
-- where�� �����Ǹ� ��ü ���� update��
update ���̺�
    set �÷�=��
    where ����(or ������������)
    ;
    