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
	com_content CLOB not null,
	com_regdate date not null,
	q_num number(10) not null,
	foreign key (q_num) references qna(q_num) on delete cascade,
	foreign key(id) references member(id) on delete cascade
);

create sequence qna_comment_seq;
