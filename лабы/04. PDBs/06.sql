--1.���������� ����� ������ ������� SGA.
--select * from v$sga;
select SUM(VALUE) from v$sga;

--2.���������� ������� ������� �������� ����� SGA.
select component, current_size from v$sga_dynamic_components where component in ('shared pool', 'large pool', 'java pool', 'streams pool');

--3.���������� ������� ������� ��� ������� ����.
select COMPONENT, GRANULE_SIZE from v$sga_dynamic_components where current_size > 0;

--4.���������� ����� ��������� ��������� ������ � SGA.
--select sum(min_size), sum(max_size), sum(current_size) from v$sga_dynamic_components;
select current_size from v$sga_dynamic_free_memory;

--5.���������� ������� ����� ���P, DEFAULT � RECYCLE ��������� ����.
select component, min_size, current_size, max_size from v$sga_dynamic_components where component like '%cache%';


--6.�������� �������, ������� ����� ���������� � ��� ���P. ����������������� ������� �������.
create table T_6(x int) storage(buffer_pool keep) tablespace users; --�� ��������� ��� default
insert into T_6 values (1);
commit;

select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where buffer_pool = 'KEEP';
drop table T_6;


--7.�������� �������, ������� ����� ������������ � ���� default. ����������������� ������� �������. 
create table T_61 (x int) cache;
insert into T_61 values (1);
commit;

select * from user_segments where segment_name like '%T_61%';


--8.������� ������ ������ �������� �������.
show parameter log_buffer;

--9.������� 10 ����� ������� �������� � ����������� ����.
select pool, name, bytes from v$sgastat where pool = 'shared pool' order by bytes desc
fetch first 10 rows only;

--10.������� ������ ��������� ������ � ������� ����.
select pool, name, bytes from v$sgastat where pool = 'large pool' and name = 'free memory';

--11.�������� �������� ������� ���������� � ���������. 
select * from v$session;

--12.���������� ������ ������� ���������� � ��������� (dedicated, shared).
select username, server from v$session where username is not null;


--13.*������� ����� ����� ������������ ������� � ���� ������.
select name, type, executions from v$db_object_cache order by executions desc;
--V$DB_OBJECT_CACHE displays database objects that are cached in the library cache. Objects include tables, indexes, clusters, synonym definitions, PL/SQL procedures and packages, and triggers.

