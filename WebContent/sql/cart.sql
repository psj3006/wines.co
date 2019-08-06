create table cart (
	id varchar2(30) not null,
	p_num number(10) not null,
	amount number(5) not null,
	foreign key(id) references member(id),
	foreign key(p_num) references product(p_num)
);

drop table cart;
commit