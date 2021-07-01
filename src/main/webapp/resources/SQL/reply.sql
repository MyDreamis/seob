create table reply(
	r_no int not null primary key
	,c_no int constraint c_no references community (c_no) on delete cascade
	,r_id varchar2(50) not null
	,r_cont varchar2(500) not null
	,r_date date
);


select * from reply;

create sequence r_no_seq
 start with 1
 increment by 1
 nocache;
 
 select r_no_seq.nextval from dual;
 
 drop sequence r_no_seq;