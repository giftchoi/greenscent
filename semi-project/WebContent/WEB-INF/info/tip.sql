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


--test
insert into tip(tno,id,title,content,regDate,hits)
values (1,'hsj','안녕하슈','내용이유~',sysdate,0)

update tip set title=1,content='뭐하는거유~' where tno=1
update tip set id='hsj',title='제목변경2',content='개어렵네',regDate=sysdate,hits=1 where tno=1

select * from tip

insert into tip ( tno, id , title , content ,regDate, hits) 
values(tip_seq.nextval,'hsjhsj','여긴제목','여긴내용',sysdate,0)

-- TITLE 컬럼에서 특정 문자 또는 문자열을 포함할 경우 검색 sql
SELECT T.tno,T.id,T.title,T.content,T.regDate,T.hits,M.name
FROM(
select row_number() over(order by tno desc) as rnum, 
tno,id,title,content,regDate,hits from tip ) T , green_member M
WHERE T.title LIKE '%여%'



