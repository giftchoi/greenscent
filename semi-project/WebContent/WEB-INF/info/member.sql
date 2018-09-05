drop table green_member;

create table green_member (
   id VARCHAR2(100) primary key,
   password VARCHAR2(100) not null,
   name VARCHAR2(100) not null,
   email VARCHAR2(100) not null,
   birthday date not null,
   state number default 1
)
--test
insert into green_member(id,password,name,email,birthday,state)
values ('hsjhsj','1234','테스트2','hsj@네이버','20180903',1)

select * from GREEN_MEMBER

update green_member set state=0 where id='66';
