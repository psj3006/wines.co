// 멤버 테이블
create table member (
	id varchar2(30) primary key,
	pw varchar2(20) not null,
	name varchar2(20) not null,
	addr varchar2(100) not null,
	tel varchar2(11) not null unique
);

// 어드민용 계정
insert into member values ('admin', '1111', 'admin', 'admin', 'admin');
// 테스트용 일반계정
insert into member values ('test', '1111', 'test', 'test', 'test');
