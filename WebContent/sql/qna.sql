create table qna (
	q_num number(10) primary key,
	id varchar2(30) not null,
	subject varchar2(50) not null,
	content varchar2(4000) not null,
	regdate date not null,
	foreign key(id) references member(id) on delete cascade
);

create sequence qna_seq;