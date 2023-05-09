create database coupang;
use coupang;

create table member(
	id varchar(15) primary key,  -- 아이디
    password varchar(30) not null, -- 비밀번호
    name varchar(10) not null, -- 이름
    email varchar(30) not null,  -- 이메일
    regdata datetime default now() -- 등록날짜
);
insert into member(id,password,name,email) 
values("1","2","5","15");
select * from member;

select count(*)
from member
where id="asdsd";