--1
select name,open_mode,con_id from v$pdbs; 
select pdb_name,pdb_id, status from SYS.dba_pdbs;

--2
select * from v$instance

--3
select *from SYS.product_component_version

--4
--database configuration assistant -> pdb_mka

--5
select name,open_mode,con_id,creation_time from v$pdbs;

--6
--connect system/123qwert@//localhost:1521/mka_pdb as sysdba
--C:\Users\User\Documents\בה\DB_5sem\כאבû\04
ALTER SESSION SET "_ORACLE_SCRIPT"=true
ALTER SESSION SET "_ORACLE_SCRIPT"=false


CREATE TABLESPACE TS_MKA
    DATAFILE 'C:\app\Tablespaces\TS_mka_pdb_2.dbf'
    SIZE 7 m
    AUTOEXTEND ON NEXT 5M
    MAXSIZE 20M
    EXTENT MANAGEMENT LOCAL;
    
CREATE TEMPORARY TABLESPACE  TS_MKA_TEMP
    TEMPFILE 'C:\app\Tablespaces\TS_mka_temp_pdb_2.dbf'
    SIZE 5 m
    AUTOEXTEND ON NEXT 3M
    MAXSIZE 30M
    EXTENT MANAGEMENT LOCAL;
    
CREATE ROLE RL_MKACORE

drop role RL_MKACORE

grant create session,
      create table,
      create view,
      create procedure,
      drop any table,
      drop any view,
      drop any procedure 
to RL_MKACORE;
commit;

grant create session to RL_MKACORE;
select * from dba_sys_privs where grantee = 'RL_MKACORE';

CREATE PROFILE PF_MKACORE LIMIT
    PASSWORD_LIFE_TIME 180
    SESSIONS_PER_USER 3
    FAILED_LOGIN_ATTEMPTS 7
    PASSWORD_LOCK_TIME 1
    PASSWORD_REUSE_TIME 10
    PASSWORD_GRACE_TIME DEFAULT
    CONNECT_TIME 180
    IDLE_TIME 30

select *from v$pdbs


create user U1_MKA_PDB identified by 12345
default tablespace TS_MKA quota unlimited on TS_MKA
temporary tablespace TS_MKA_TEMP
account unlock;

grant create session to U1_MKA_PDB
grant create table to U1_MKA_PDB
--7

create table MKA_table ( x int , y varchar(5))

insert into MKA_table values (1, 'frst');
insert into MKA_table values (3, 'thrd');

select *from mka_table

--8
select * from DBA_TABLESPACES; 
select * from DBA_ROLES;
select * from DBA_PROFILES;  
select * from ALL_USERS;

select * from DBA_DATA_FILES;   
select * from DBA_TEMP_FILES;  
select GRANTEE, PRIVILEGE from DBA_SYS_PRIVS; 

--10
create user c##mmm identified by 12345

grant create session to c##mmm

select *from v$session

--13
--alter pluggable database mka_pdb unplug into 'C:\app\ora_install_userzmka_pdb.xml';
--drop pluggable database mka_pdb;
--create pluggable database mka_pdb as clone using 'C:\app\ora_install_userzmka_pdb.xml' nocopy tempfile reuse;

