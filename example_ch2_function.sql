---- ch2_function
select * from student;
--
select name||'의 키는 '||height||' cm, 몸무게는 '||weight||' kg 입니다'
    as "학생의 키와 몸무게"
    from student;