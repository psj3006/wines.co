create table cart (
	c_num number(10) primary key,
	id varchar2(30) not null,
	p_num number(10) not null,
	amount number(5) not null,
	foreign key(id) references member(id),
	foreign key(p_num) references product(p_num)
);

create sequence cart_seq;

