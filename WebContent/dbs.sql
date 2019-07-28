drop table member;

create table member (
	id varchar2(30) primary key,
	pw varchar2(20) not null,
	name varchar2(20) not null,
	addr varchar2(100) not null,
	tel varchar2(11) not null unique,
	admin char(1) check( admin in('0', '1') )
);

insert into member values ('admin', '1111', 'admin', 'admin', 'admin', '1');
insert into member values ('test', '1111', 'test', 'test', 'test', '0');

select * from member;

delete from member;