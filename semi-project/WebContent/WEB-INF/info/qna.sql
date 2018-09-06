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

SELECT Q.qno,Q.id,Q.title,Q.regdate,M.name
from (SELECT row_number() over(ORDER BY qno DESC) as rnum, 
 qno, id, title, to_char(regdate,'YYYY.MM.DD') as regdate 
FROM qna_board ) Q , green_member M WHERE Q.id=M.id AND rnum BETWEEN 1 AND 2
ORDER BY qno DESC

select d.mno,d.id,d.title,d.status,d.regdate,M.name
from (SELECT row_number() over(ORDER BY mno DESC) as rnum,mno,id,title,
to_char(regdate,'YYYY.MM.DD') as regdate, status
FROM m_board ) d , green_member M where d.id=M.id AND rnum between 1 and 3
order by mno desc


SELECT 123 "숫자", '123' "문자" FROM DUAL