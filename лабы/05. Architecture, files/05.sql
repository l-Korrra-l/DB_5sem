--1
--все файлы табл пространств
select tablespace_name, file_name from DBA_DATA_FILES; 
select tablespace_name, file_name from DBA_TEMP_FILES;

--2
drop tablespace MKA_QDATA;

create tablespace MKA_QDATA
    datafile 'C:\app\Tablespaces\MKA_QDATA.dbf'
    size 10m
    extent management local
    offline;
    
alter tablespace MKA_QDATA online;

-----------user-----------------------
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
select *from DBA_USERS; -- mka

create user mka identified by 12345;
grant create session,
      create table, 
      create view, 
      create procedure,
      drop any table,
      drop any view,
      drop any procedure to mka;
------------------------------------

alter user mka quota 2m on MKA_QDATA;

create table mka_t1 (
    a number(5) primary key,
    aa number(5)) tablespace MKA_QDATA;
    
insert into mka_t1 values(1,1);
insert into mka_t1 values(2,2);
insert into mka_t1 values(3,3);

--3
--segments list
select * from dba_segments where tablespace_name like 'MKA%';
select * from dba_segments;

--SYS_C007394 is index

--4
drop table mka_t1;
--segment name 'bin......'
select *from user_recyclebin; 
--dropped objects

--5
flashback table mka_t1 to before drop;

--6
drop table mka_t1;

begin
  for x in 0..10000
  loop
    insert into mka_t1 values(x, x);
  end loop;
  commit;
end;

select *from mka_t1;

--7
select *from DBA_EXTENTS where SEGMENT_NAME like 'MKA%';
select extent_id, blocks, bytes from DBA_EXTENTS where SEGMENT_NAME like 'MKA%';
select *from DBA_EXTENTS;

--8
drop tablespace MKA_QDATA including contents and datafiles;

--9
select *from v$log;

--10
select *from v$logfile;

--11
ALTER SYSTEM SWITCH LOGFILE;
select *from v$log;
--current 3
--2.32 am 19.10.21
--curent 1,2
--а чего долго так на  3...

--12
alter database add logfile group 4 'C:\app\ora_install_user\oradata\orcl\REDO04.LOG' 
                                                size 50 m blocksize 512;
alter database add logfile member 'C:\app\ora_install_user\oradata\orcl\REDO041.LOG'  to group 4;
alter database add logfile member 'C:\app\ora_install_user\oradata\orcl\REDO042.LOG'  to group 4;

select group#, sequence#, bytes, members, status, first_change# from v$log;
--2.38am

--13-------------------
alter database drop logfile member 'C:\app\ora_install_user\oradata\orcl\REDO04.LOG';
alter database drop logfile member 'C:\app\ora_install_user\oradata\orcl\REDO041.LOG';
alter database drop logfile member 'C:\app\ora_install_user\oradata\orcl\REDO042.LOG';

alter database clear unarchived logfile group 4;
alter database drop logfile group 4;
select group#, sequence#, bytes, members, status, first_change# from v$log;

--14
SELECT NAME, LOG_MODE FROM V$DATABASE;
SELECT INSTANCE_NAME, ARCHIVER, ACTIVE_STATE FROM V$INSTANCE;

--15
SELECT * FROM V$ARCHIVED_LOG;

--16
--вкл архивирование
--shutdown immediate;
--startup mount;
--alter database archivelog;
--alter database open;

select name, log_mode from v$database;
SELECT INSTANCE_NAME, ARCHIVER, ACTIVE_STATE FROM V$INSTANCE;

--17
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1 ='LOCATION=C:\app\ora_install_user\oradata\orcl\archive.arc';

alter system switch logfile;
select * from v$archived_log;

--19
select *from v$controlfile_record_section;

--20
show parameter control;

--21
ALTER DATABASE BACKUP CONTROLFILE TO TRACE;
show parameter spfile ;

--22
--CREATE PFILE='mka_pfile.ora' FROM SPFILE;

--23
--database/pwdorcl
SELECT * FROM V$PWFILE_USERS;

--24
SELECT * FROM V$DIAG_INFO;

--------------------------------------
‘айл параметров
--------------------------------------
show parameter spfile;--пор€док поиска имен
select * from V$PARAMETER where name like '%block%';
select * from V$PARAMETER where name = 'open_cursors';
select * from V$PARAMETER where name like 'control%';
--напр€мую мен€ть низ€
Alter system set open_cursors = 300 scope=spfile;
Alter system set control_files = 'C:\APP\ORA_INSTALL_USER\ORADATA\ORCL\CONTROL01.CTL, C:\APP\ORA_INSTALL_USER\ORADATA\ORCL\CONTROL02.CTL' scope=spfile;
--connect /as sysdba
--shutdown immediate;
--startup open;
select * from V$PARAMETER where name = 'open_cursors';
--loc
select * from V$PARAMETER where NAME = 'spfile'; --or regedit orahome/database --spfile
--pfile ora_inst_user/admin/orcl/pfile
create pfile='p1.ora' from spfile; --as spfile folder
create spfile='ss.ora' from pfile='p1.ora';
--------------------------------------
‘айл паролей -- pwdoracle.ora
--------------------------------------
select * from v$PWFILE_USERS;
show parameter remote_login_passwordfile;
--new -- orapwd file=name --sys password
--grant sysdba -> добавление в файл паролей
--as sysdba ---через файл паролей
--------------------------------------
”правл€ющие файлы
--------------------------------------
--найти в файле параметров
select * from V$PARAMETER where name = 'control_files';
show parameter control_files
show parameter control
select name from v$controlfile

--содержимое--настройки
select type,record_size, records_total from v$controlfile_record_section;
--change
--shutdown->change loc in param file-> startup open
ALTER DATABASE BACKUP CONTROLFILE TO TRACE; --создать сценарий, откорректировать, выполнить
----------------------------------------
mess
-----------------------------------------
select *from v$diag_info
---
жур п
--
select *from v$logfile;
select *from v$log;
select * from v$database;
select *from v$archived_log

--
select * from dba_data_files;


Parameters file: C:\app\ora_install_user\product\12.2.0\dbhome_1\database Чspfile
C:\app\ora_install_user\admin\orcl\pfile Чpfile
control_files=("C:\app\ora_install_user\oradata\orcl\control01.ctl", "C:\app\ora_install_user\oradata\orcl\control02.ctl")

--trace
C:\app\ora_install_user\diag\rdbms\orcl\orcl\trace

--new pwd
orapwd file= name.ora

--mess file
C:\app\ora_install_user\diag\rdbms\orcl\orcl\alert


