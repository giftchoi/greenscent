drop table m_board;
drop table m_img;

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

create table m_reply(
mrno number primary key,
id varchar2(100) not null,
mrcontent varchar2(1000) not null,
regdate date default sysdate,
constraint m_board_fk foreign key(id) references green_member(id),
constraint m_reply_fk foreign key(mrno) references m_board(mno) on delete cascade
)
create sequence mmno_seq;
create sequence mimgno_seq;
create sequence mno_seq;