---- ch2_function
select * from student;
--
select name||'의 키는 '||height||' cm, 몸무게는 '||weight||' kg 입니다'
    as "학생의 키와 몸무게            " --응? 짧으면 짤리고 여기서 길면 에러
    from student;
    
select name, height, weight
    from student;