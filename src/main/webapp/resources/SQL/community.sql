create table community(
	c_no number(38) primary key
	,c_id varchar2(100) not null
	,c_title varchar2(200) not null
	,c_cont varchar2(4000) not null
	,c_file varchar2(200)
	,c_hit number(38)
	,c_ref number(38)
	,c_step number(38)
	,c_level number(38)
	,c_date date default sysdate
);


drop table community;

select * from community;

create sequence c_no_seq
start with 1
increment by 1
nocache;

select c_no_seq.nextval from dual;

drop sequence c_no_seq;