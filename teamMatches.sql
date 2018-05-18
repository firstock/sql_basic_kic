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
	hostWin.winPoint+draw1.drawPoint+draw2.drawPoint as num_points
	from teams,
		(select host_team as winner, count(*)*3 as winPoint
			from matches
			where host_goals > guest_goals
			group by host_team) hostWin,
		(select host_team as drawer, count(*) as drawPoint
			from matches
			where host_goals = guest_goals
			group by host_team
			) draw1,
		(select guest_team as drawer, count(*) as drawPoint
			from matches
			where host_goals = guest_goals
			group by guest_team
			) draw2
	order by num_points desc
;

