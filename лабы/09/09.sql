--1
select * from user_sys_privs;
select * from session_privs;
select * from user_tablespaces;

grant create session to c##mka;
grant create sequence to c##mka;
grant create cluster to c##mka;
grant create synonym to c##mka;
grant create public synonym to c##mka;
grant create view to c##mka;
grant create MATERIALIZED view to c##mka;
commit;

alter user c##mka quota unlimited on users;

--2
create sequence S1
    increment by 10
    start with 1000
    nominvalue
    nomaxvalue
    nocycle
    nocache
    noorder;
    
select S1.nextval from dual;
select S1.currval from dual;

select S1.currval, S1.nextval from dual;  
--3
create sequence S2
    start with 10
    increment by 10
    maxvalue 100
    nocycle;

select S2.nextval, S2.nextval from dual;
select S2.currval from dual;
--ORA-08004: последов. S2.NEXTVAL exceeds MAXVALUE и не может быть установлено
drop sequence S2;

--4
create sequence S3
    start with 10
    INCREMENT by -10
    MINVALUE -100
    nocycle
    ORDER;
--ORA-04008: START WITH не может превышать MAXVALUE    
-------(-10)
create sequence S3
    start with -10
    INCREMENT by -10
    MINVALUE -100
    nocycle
    ORDER;
-------
select S3.nextval from dual;
select S3.currval from dual;
--ORA-08004: последов. S3.NEXTVAL goes below MINVALUE и не может быть установлено
drop sequence S3;

--5
create sequence S4
    start WITH 1
    INCREMENT by 1
    minvalue 10
    cycle
    cache 5
    noorder;
--ORA-04015: возрастающие последовательности, кот. CYCLE должен задавать MAXVALUE
----
create sequence S4
    start WITH 1
    INCREMENT by 1
    maxvalue 10
    cycle
    cache 5
    noorder;
    
select S4.nextval from dual;
select S4.currval from dual;
----
drop sequence S4;

--6
select *from SYS.user_sequences;
select *from SYS.all_sequences where sequence_owner like 'C##%';
select *from SYS.dba_sequences where sequence_owner like 'C##%'; --from sys

--7
create table T1 (
        N1 NUMBER(20),
        N2 NUMBER(20),
        N3 NUMBER(20),
        N4 NUMBER(20)) cache storage(buffer_pool keep);

--begin
--for i in 1..7 loop
--insert into T1(N1, N2, N3, N4) values (S1.nextval, S2.nextval, S3.nextval, S4.nextval);
--end loop;
--end;

select *from T1;

drop table T1;
--8
create cluster ABC (
        X number(10),
        V varchar2(12)) hashkeys 200;

--9
create table A(XA number(10),
               VA varchar2(12), 
               AA number(10))
cluster ABC (XA, VA); 

--10
create table B(XB number(10),
               VB varchar2(12), 
               BB number(10))
cluster ABC (XB, VB); 

--11
create table C(XC number(10),
               VC varchar2(12), 
               CC number(10))
cluster ABC (XC, VC); 

--12
select * from user_tables;
select * from user_clusters;

select * from dba_segments where owner like 'C##%';
select * from dba_clusters where owner like 'C##%';
--13
create synonym SC for C;
select * from SC;
select * from C##MKA.SC;


drop synonym SC;
--14
create public synonym SB for B;
select * from SB;

drop public synonym SB;
--15
create table A1(x number(10), y varchar(12),constraint x_pk primary key (x));
create table B1(x number(10),y varchar(12), constraint x_fk foreign key (x) references A1(x));

insert into A1 (x, y) values (1,'a');
insert into A1 (x, y) values (2,'b');
insert into A1 (x, y) values (3,'c');
insert into B1 (x, y) values (1,'d');
insert into B1 (x, y) values (2,'e');
insert into B1 (x, y) values (3,'f');

select * from A1;
select * from B1;

create view V1 as select A1.y as AY, B1.y as BYf, A1.x from A1 inner join B1 on A1.x=B1.x;
select * from V1;

drop view V1;
drop table A1;
drop table B1;

--16
create materialized view MV
build immediate 
refresh complete on demand next sysdate + numtodsinterval(2, 'minute') 
as select * from A1;

select * from MV;    

insert into A1 (x, y) values (4,'aaaaaaaaaaaa');
insert into A1 (x, y) values (5,'bbbbbbbbbb');
commit;

drop materialized view MV;