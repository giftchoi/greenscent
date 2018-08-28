drop table qna_board;
drop table qno_img;
drop table qno_reply;

create table qna_board(
   qno number primary key,
   id varchar2(100) not null,
   title varchar2(100) not null, 
   content clob not null,
   regdate varchar2(100) not null,
   constraint fk_qna foreign key(id) references green_member(id) 
);

create table qno_img(
   qimgno number primary key,
   qno number not null,
   img_path varchar2(100) not null,
   constraint fk_qna_img foreign key(qno) references qna_board(qno) on delete cascade
);

create table qno_reply(
   qrno number primary key,
   qno number not null,
   id varchar2(100) not null,
   regdate date not null,
   content varchar2(1000) not null,
   constraint fk_postno foreign key(qno) references qna_board(qno) on delete cascade,
   constraint fk_qno_reply foreign key(id) references green_member(id)
)

create sequence qrno_seq nocache;
create sequence qno_seq nocache;
create sequence qimgno_seq nocache;