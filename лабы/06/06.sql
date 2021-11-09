--1
select * from v$sga;
select SUM(VALUE) from v$sga; 

--2
select * from v$sga_dynamic_components where current_size > 0;

--3
select component, granule_size from v$sga_dynamic_components where current_size > 0;

--4
select current_size from v$sga_dynamic_free_memory;

--5
select component, current_size, min_size from v$sga_dynamic_components where component like '%cache%';
alter system set db_recycle_cache_size=100m scope=spfile;

select *from v$buffer_pool;
--6
create table keep_table(x int) storage(buffer_pool keep);
select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where segment_name ='KEEP_TABLE';

--7
create table def_table(x int) cache storage(buffer_pool default);
select segment_name, segment_type, tablespace_name, buffer_pool from user_segments where segment_name ='DEF_TABLE';

--8
show parameter log_buffer;

--9
select *from (select pool, name, bytes from v$sgastat where pool = 'shared pool' order by bytes desc) where rownum <=10;

--10
select pool, name, bytes from v$sgastat where pool = 'large pool' and name = 'free memory';

--11
select * from v$session;

--12
select username, server from v$session where username is not null;

--13
select name,type,executions from v$db_object_cache order by executions desc ;
