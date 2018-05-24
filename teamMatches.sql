create table teams(
	team_id integer not null,
	team_name varchar(30) not null,
	unique(team_id)
);

drop table matches;
create table matches(
	match_id integer not null,
	host_team integer not null,
	guest_team integer not null,
	host_goals integer not null,
	guest_goals integer not null,
	unique(match_id)
);


insert into teams
	values(10, 'Give');

insert into teams
	values(20, 'Never');

insert into teams
	values(30, 'You');

insert into teams
	values(40, 'Up');

insert into teams
	values(50, 'Gonna');

insert into matches
	values(1, 30, 20, 1, 0);
insert into matches
	values(2,10,20,1,2);
insert into matches
	values(3,20,50,2,2);
insert into matches
	values(4,10,30,1,0);
insert into matches
	values(5,30,50,0,1);

---- error!

select team_id, team_name,
	hostWin.winPoint+draw.drawPoint as num_points
	from teams,
		(select host_team as winner, count(*)*3 as winPoint
			from matches
			where host_goals > guest_goals
			group by host_team) hostWin,
		(select guest_team as winner, count(*)*3 as winPoint
			from matches
			where host_goals < guest_goals
			group by guest_team) guestWin,
		(select host_team, guest_team, count(*) as drawPoint
			from matches
			where host_goals = guest_goals
			group by host_team, guest_team
			) draw
	order by num_points desc
;

select host_team as winner, count(matches.host_team)*3 as winPoint
	from matches
	where host_goals > guest_goals
	group by host_team




----- cf
select s1.name 학생이름, count(s2.name) 나보다키큰애들
from student s1, student s2
where s1.grade= s2.grade
and s1.name != s2.name
and s1.height < s2.height
group by s1.name
order by 학생이름;