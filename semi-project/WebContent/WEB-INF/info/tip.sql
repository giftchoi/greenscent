drop table tip;
drop table tip_reply;
drop sequence tip;
drop sequence tip_reply;

create table tip(
   tno number primary key,
   id varchar2(100) not null, --FK
   title varchar2(100) not null,
   content clob not null,
   regDate date not null,
   hits number default 0,
   constraint fk_tipid foreign key(id) references green_member(id)
)

create table tip_reply(
   trno number primary key,
   tno number default 0, --FK
   id varchar2(100) not null,
   content varchar2(1000) not null,
   regDate date not null,
   constraint fk_tno foreign key(tno) references tip(tno) on delete cascade,
   constraint fk_tip_reply_id foreign key(id) references green_member(id) on delete cascade
)
create sequence tip_seq nocache;
create sequence tip_reply_seq nocache;