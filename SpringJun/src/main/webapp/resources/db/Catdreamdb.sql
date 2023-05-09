create database catdreamdb;

use catdreamdb;

delete from catdreamdb; -- 내용삭제
drop database catdreamdb; -- 완전삭제




create table member(
	id varchar(15) primary key,  -- 아이디
    password varchar(30) not null, -- 비밀번호
    name varchar(10) not null, -- 이름
    birth date not null, -- 생년월일 날짜
    gender varchar(2) not null,  -- 성별
    email varchar(30) not null,  -- 이메일
    phone varchar(15) not null,  -- 휴대폰 번호
    jobrank varchar(5) not null, -- 직급
    regdata datetime default now() -- 등록날짜
);
-- 생성일자 추가해야하고 성별은 남자M 여자F 선택안함U 인데 남자로 저장되어있다
insert into member(id,password,name,birth,gender,email,phone,jobrank)
values('hjg8013','123456','황준호','1997-12-15','남자','hjg8012@naver.com','01029128013','관리자');

select * from member;

create table board(
bno int primary key auto_increment,
title varchar(50) not null,
content longtext,
writer varchar(15),
regdate datetime default now(),
cnt int default 0,
memberId varchar(15)
);

select * from board order by regdate desc;

	 	select * from board order by regdate desc;

create table reply(
	rno int primary key auto_increment,
    bno int,
    reply varchar(1000) not null,
    replyer varchar(15),
    replydate datetime default now(),
    memberId varchar(15)
);

select * from reply;

create table attach(
	uuid varchar(50) primary key,
    uploadpath varchar(100),
    filename varchar(100),
    image int,
	bno int
);


select * from attach;

create table product(
	pno int primary key auto_increment,  -- 상품번호
    pname varchar(100),					 -- 상품이름
	pimage int,							 -- 상품이미지 확인
    pimgname varchar(100),				 -- 상품이미지 이름
    pcontent longtext, 					 -- 상품상세 설명
    pprice int, 				 		 -- 상품가격
    pbargain int, 				 		 -- 상품할인가
    pdate datetime default now(),		 -- 상품 등록 날짜
    pbrand varchar(20),				 	 -- 상품 브랜드
    pstar int,							 -- 상품 별점
   	preveiw int,						 -- 리뷰인원수
    puuid varchar(50),   				 -- 상품 uuid
    puploadpath varchar(100) 			 -- 상품 업로드 경로
);



    
select * from product;

drop table product;