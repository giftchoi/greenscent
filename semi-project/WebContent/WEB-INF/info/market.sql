drop table m_board;
drop table m_img;
drop table m_reply;

create table m_board(
mno number primary key,
title varchar2(100) not null,
content clob not null,
status number default 0,
regdate date not null,
id varchar2(100) not null,
constraint fk_m foreign key(id) references green_member(id)
)

create table m_img(
   mimgno number primary key,
   mno number not null,
   img_path varchar2(100) not null,
   constraint fk_m_img foreign key(mno) references m_board(mno) on delete cascade
);

insert into m_img(mimgno,mno,img_path) values(mimgno_seq.nextval,1,'a');

create table m_reply(
mrno number primary key,
mno number not null,
id varchar2(100) not null,
content varchar2(1000) not null,
regdate date default sysdate,
constraint m_board_fk foreign key(id) references green_member(id),
constraint m_reply_fk foreign key(mno) references m_board(mno) on delete cascade
)


create sequence mrno_seq;
create sequence mimgno_seq;
create sequence mno_seq;


select * from m_img;