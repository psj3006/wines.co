create table order_t (
	o_num number(10) not null,
	id varchar2(30) not null,
	o_name varchar2(20) not null,
	o_addr varchar2(100) not null,
	o_tel varchar2(11) not null,
	totalprice number(15) not null,
	p_num number(10) not null,
	amount number(5) not null,
	order_date date not null,
	foreign key(id) references member(id) on delete cascade,
	foreign key(p_num) references product(p_num) on delete cascade
);

create sequence order_seq
	increment by 1
	start with 10000
	maxvalue 999999
	nocycle;	
	
	select * from order_t;