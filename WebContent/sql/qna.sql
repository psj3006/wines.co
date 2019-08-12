create table qna (
	q_num number(10) primary key,
	id varchar2(30) not null,
	subject varchar2(50) not null,
	content CLOB not null,
	regdate date not null,
	hit number(5) not null,
	foreign key(id) references member(id) on delete cascade
);

create sequence qna_seq;

create table qna_comment (
	com_num number(10) primary key,
	id varchar2(30) not null,
	content CLOB not null,
	regdate date not null,
	q_num number(6) not null,
	foreign key (q_num) references qna(q_num) on delete cascade,
	foreign key(id) references member(id) on delete cascade
);
insert into qna_comment values(qna_comment_seq.nextval, 'test', 'asdfasdfasdf', sysdate, 11);
insert into qna_comment values(qna_comment_seq.nextval, 'admin', 'asdfasdfddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddasdf', sysdate, 11);
commit
create sequence qna_comment_seq;