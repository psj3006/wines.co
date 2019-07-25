drop table member;

create table member (
	id varchar2(20) primary key,
	pw varchar2(20) not null,
	name varchar2(10) not null,
	addr varchar2(100) not null,
	tel varchar2(11) not null,
	admin char(1) check( admin in('0', '1') )
);

insert into member values ('admin', '1111', 'admin', 'admin', 'admin', '1');

