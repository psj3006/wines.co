// 상품테이블
create table product (
	p_num number(10) primary key,
	p_name varchar2(50) not null,
	p_content varchar2(500) not null,
	p_price varchar2(10) not null,
	p_saleprice varchar2(10),
	p_image varchar2(50)
);

create sequence product_seq;

// 샘플 데이터
insert into product values(product_seq.nextval, 'No image Sample', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi, perspiciatis!',
							'500', '', '');
insert into product values(product_seq.nextval, 'Trius Cabernet France', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi, perspiciatis!',
							'200000', '175000', 'wine_rose.png');
insert into product values(product_seq.nextval, 'Maison Castel Pinot Noir', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi, perspiciatis!',
							'220000', '', 'wine_pinotnoir.png');
insert into product values(product_seq.nextval, 'Sauvignon Burgundy', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi, perspiciatis!',
							'120000', '', 'wine_burgundy1.png');
insert into product values(product_seq.nextval, 'Simple Sample', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi, perspiciatis!',
							'100000', '85000', 'wine_2.png');
insert into product values(product_seq.nextval, 'Morgon Coatrublee', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi, perspiciatis!',
							'175000', '', 'wine_4.png');

