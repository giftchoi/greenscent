drop table green_member;

create table green_member (
   id VARCHAR2(100) primary key,
   password VARCHAR2(100) not null,
   name VARCHAR2(100) not null,
   email VARCHAR2(100) not null,
   birthday date not null,
   state number default 1
)