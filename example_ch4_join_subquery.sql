 --ch4
--1. emp2���̺��� p_grade ���̺��� ��ȸ�Ͽ� ����� �̸��� ����, ���� ����, �ش� ������ ������ ���ѱݾװ� ���� �ݾ��� ���
select * from emp2;
select * from p_grade;
--2. 1����deptno1�� 101���� �л����� �л� �̸��� �������� �̸��� ���
select * from emp2;
select * from professor;
--3. gogak ���̺��� gift ���̺��� join�Ͽ� ������ �ڱ�����Ʈ���� ���� ����Ʈ�� ��ǰ �� �Ѱ����� ������ �� �ִٰ� �� ��, ��ǿ� �����Ÿ� ������ �� �ִ� �������� ����Ʈ, ��ǰ���� ���
select * from gogak;
select * from gift;
--4. gogak ���̺��� gift ���̺��� join�Ͽ� ������ �ڱ�����Ʈ���� ���� ����Ʈ�� ��ǰ �� �Ѱ����� ������ �� �ִٰ� �� ��, ���� ���忡���� �� ��ǰ���� �ִ� �� ���� ��ǰ�� �ʿ����� �� ��ǰ�� ������ ���
select * from gogak;
select * from gift;
--5. emp2���̺��� p_grade ���̺��� ��ȸ�Ͽ� ������� �̸��� ����, ��������, ���������� ���, ���������� ���̷� ����ϸ� �Ҽ������ϴ� ����
select * from emp2;
select * from p_grade;