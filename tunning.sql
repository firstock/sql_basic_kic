-- cmd d: > mkdir \app\dbmsexpert\oradata\orcl\

-- 테이블 스페이스 생성
sqlplus "/as sysdba"
create tablespace dbmsexpert_data
	datafile 'd:\app\dbmsexpert\oradata\orcl\dbmsexpert_data.dbf' size 4G
	autoextend on next 1G maxsize unlimited
	logging
	online
	permanent
	extent management local autoallocate
	blocksize 8K
	segment space management auto
	flashback on;


-- 임시 테이블 스페이스 생성
-- table space에서 작업하다 부족하면 임시공간에서
create temporary tablespace dbmsexpert_tmp
	tempfile 'd:\app\dbmsexpert\oradata\orcl\dbmsexpert_tmp.dbf' size 1g
	autoextend on next 100m maxsize unlimited;

-- 사용자 계정 생성. dbmsexpert
-- dbmsexpert_data, dbmsexpert_tmp 테이블 스페이스를 default로 하는
sqlplus "/as sysdba"
create user dbmsexpert identified by dbmsexpert
	default tablespace dbmsexpert_data
	temporary tablespace dbmsexpert_tmp
	profile default
	account unlock;

--  계정권한 주기
grant resource to dbmsexpert;
grant connect to dbmsexpert;
grant create view to dbmsexpert;
grant create synonym to dbmsexpert;

-- 생성된 계정으로 접속
-- password: dbmsexpert

-- insert 입력시간 줄이기. noLogging 모드. redo 로그 작업 최소화
alter table 테이블명 nologging;

-- 오라클 데이터 입력 단계
-- 1. data buffer cache경유/ 2. table segment의 free block 검색/ 3. 빈블록에 데이터 저장
-- append 힌트: segment 맨 끝에서 데이터 입력
insert /*+ append */ into 테이블명

-- 미친 select1. 카티션곱 조인
-- 100건 x 1000건 = 10만 건
select * from A, B;

-- 10행만 보기
select * from dual
connect by level <= 10;

select * from emp where rownum <= 10;