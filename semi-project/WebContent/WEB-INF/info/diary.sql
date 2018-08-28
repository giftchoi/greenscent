drop table diary;
drop table diary_img;
drop table diary_reply;


create table diary(
	dno number primary key,
	id varchar2(100) not null,
	title varchar2(100) not null,
	content clob not null,
	regdate date default sysdate,
	isPublic number default 0,
	state number default 5,
	constraint fk_diary_id foreign key(id) references green_member(id)
)
create table diary_reply(
	drno number primary key,
	dno number not null,
	id varchar2(100) not null,
	content varchar2(1000) not null,
	regdate date default sysdate,
	constraint fk_dreply_id foreign key(id) references green_member(id),
	constraint fk_dreply_dno foreign key(dno) references diary(dno) on delete cascade
)

create table diary_img(
	dimgno number primary key,
	dno number not null,
	imgpath varchar2(100) not null,
	constraint fk_dimg_dno foreign key(dno) references diary(dno) on delete cascade
)
create sequence dno_seq nocache;
create sequence drno_seq nocache;
create sequence dimgno_seq nocache;