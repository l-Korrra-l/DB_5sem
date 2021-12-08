grant create tablespace to c##mka;
grant unlimited tablespace to c##mka;

create tablespace ts1
DATAFILE 'C:\app\Tablespaces\t1_mka_user_pdb.dbf'
    SIZE 7 m
    AUTOEXTEND ON NEXT 5M
    MAXSIZE 20M
    EXTENT MANAGEMENT LOCAL;
create tablespace ts2
DATAFILE 'C:\app\Tablespaces\t2_mka_user_pdb.dbf'
    SIZE 7 m
    AUTOEXTEND ON NEXT 5M
    MAXSIZE 20M
    EXTENT MANAGEMENT LOCAL;
create tablespace ts3
DATAFILE 'C:\app\Tablespaces\t3_mka_user_pdb.dbf'
    SIZE 7 m
    AUTOEXTEND ON NEXT 5M
    MAXSIZE 20M
    EXTENT MANAGEMENT LOCAL;
create tablespace ts4
DATAFILE 'C:\app\Tablespaces\t4_mka_user_pdb.dbf'
    SIZE 7 m
    AUTOEXTEND ON NEXT 5M
    MAXSIZE 20M
    EXTENT MANAGEMENT LOCAL;
--1
create table t_range (
    a number,
    b varchar2(15)
)
partition by range (a)
(
    partition t_range_less10 values less than (10),
    partition t_range_less100 values less than (100),
    partition t_range_max values less than (maxvalue)
);

DECLARE
k int := 1;
begin
while k < 20 loop
insert into t_range values(k, 'aa'||k);
k := k+1;
end loop;

while k < 150 loop
insert into t_range values(k, 'bbb'||k);
k := k+10;
end loop;

end;

select *from t_range;
select *from user_part_tables;
select *from user_tab_partitions;
--2
create table t_interval (
a int,
b date
)
partition by range(b)
interval (INTERVAL '1' MONTH)
(
     partition p0 values less than  (to_date ('1-12-2009', 'dd-mm-yyyy'))
);

insert into t_interval values (1, '01-01-2009');
insert into t_interval values (2, '01-02-2009');
insert into t_interval values (3, '01-01-2010');
insert into t_interval values (4, '01-03-2010');
insert into t_interval values (5, '01-12-2010');
insert into t_interval values (6, '01-12-2012');
insert into t_interval values (7, '10-12-2012');
insert into t_interval values (8, '01-03-2011');

select *from user_tab_partitions where table_name = 'T_INTERVAL';

--3
drop table t_hash;  
create table t_hash (
id int, 
b varchar2(20)
)
partition by hash (id)(
    partition k1 tablespace ts1,
    partition k2 tablespace ts2,
    partition k3 tablespace ts3,
    partition k4 tablespace ts4);

begin
    for k in 0..30
    loop
    insert into t_hash values (k, 'hi');
    end loop;
end;

select* from user_tablespaces;
select *from user_tab_partitions where table_name = 'T_HASH';
select *from t_hash;

-------------------
create table t_hash1 (
id int, 
b varchar2(20)
)
partition by hash (id) partitions 16;

begin
    for k in 0..30
    loop
    insert into t_hash1 values (k, 'hi');
    end loop;
end;
select *from t_hash1;
select *from user_tab_partitions where table_name = 'T_HASH1';
--------------

--4
create table t_list (
    a number,
    b char(3)
)
partition by list (b)
(
    partition t_list_avd values('a', 'v', 'd') tablespace ts1,
    partition t_list_iop values('i', 'o', 'p') tablespace ts2,
    partition t_list_lfg values('l', 'f', 'g') tablespace ts3,
    partition t_list_other values(default) tablespace ts4
);

insert into t_list values (1, 'a'); 
insert into t_list values (2, 'b');
insert into t_list values (3, 'v');
insert into t_list values (4, 'c');
insert into t_list values (5, 'y');
insert into t_list values (6, 'i');
insert into t_list values (7, 'g');

select *from t_list;
select *from user_tab_partitions where table_name = 'T_LIST';

--5
select *from user_part_tables;
select *from user_tab_partitions where table_name = 'T_RANGE';

select *from user_tab_partitions where table_name = 'T_INTERVAL';

select* from user_tablespaces;
select *from user_tab_partitions where table_name = 'T_HASH';
select *from t_hash;

select *from t_list;
select *from user_tab_partitions where table_name = 'T_LIST';

--6
alter table t_list enable row movement;
update t_list set b = 'eee' where b = 'o';
select *from user_tab_partitions where table_name = 'T_LIST';

--7
alter table t_list merge partitions t_list_avd, t_list_iop into partition t_list_iopavd;

--8
alter table t_interval split partition p0 at (to_date ('1-06-2009', 'dd-mm-yyyy')) 
    into (partition p6, partition p5);
    
--9
create table t_list1(    
    a number,
    b char(3));
alter table t_list exchange partition t_list_lfg with table t_list1 without validation;
select * from T_list partition (t_list_lfg);
select * from t_list1;