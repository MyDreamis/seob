create table cmember(
 id varchar2(50) primary key
 ,pwd varchar2(50) not null
 ,name varchar2(50) not null
 ,year int not null
 ,month int not null
 ,day int not null
 ,gender varchar2(50)
 ,zip varchar2(50)
 ,addr varchar2(100)
 ,addr1 varchar2(100) 
 ,addr2 varchar2(100) 
 ,phone01 varchar2(10) 
 ,phone02 varchar2(10)
 ,phone03 varchar2(10)
 ,mail_id varchar2(50)
 ,mail_domain varchar2(100)
 ,c_date date
 ,c_state number(38)
 ,c_delcont varchar2(4000)
 ,c_delete date 
);
 
select * from cmember;

drop table cmember;