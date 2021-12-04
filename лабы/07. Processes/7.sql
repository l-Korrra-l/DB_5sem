--1
select* from v$bgprocess;

--2
select *from v$process where background is not null;
select *from v$process;
select *from v$process inner join v$session on v$session.paddr = v$process.addr  where v$session.username != 'null';
--3
show parameter db_writer_processes;
select *from v$process where pname like 'DBW%';

--4
select * from v$session;

--5
select username, server from v$session;

--6
select * from v$services;  

--7
show parameter dispatcher;

--8
--OracleOraDB19Home1TNSListener

--9
--select username, server from v$session;

--10
--C:\app\ora_install_user\product\12.2.0\dbhome_1\network\admin

--11
--lsnrctl
--help --> start, stop,status - ready, blocked, unknown
--services, version
--servacls - get access control lists
--reload - reload the parameter files and SIDs
--save_config - saves configuration changes to parameter file

create table X(x nvarchar2(1));
--12
--services