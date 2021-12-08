select count(*) from dba_objects_ae where Object_Type = 'PACKAGE';
create table lab17 (a number, b number);
create table lab17_to (a number, b number);
create table report_17 (status varchar2(15), repo varchar2(100));
select*from report_17;
alter table report_17 modify (repo varchar2(250) );
--Пакет DBMS_JOB

--4.	Необходимо проверять, выполняется ли сейчас это задание.
--5.	Необходимо дать возможность выполнять задание в другое время, приостановить или отменить вообще.
----procedure
create or replace procedure copy_data_job is
    cursor all_data is select * from lab17;
    row_data all_data%rowtype;
    ct number;
    ct_inserted number;
    err_msg varchar2(200);
begin
    ct_inserted := 0;
   select count(*) into ct from lab17;
   open all_data;
    for k in 0..(ct/2)
    loop
    fetch all_data into row_data;
    if row_data.a is null then 
    raise_application_error(-20001,'No data');
    exit;
    end if;
    insert into lab17_to values row_data;
    delete from lab17 where lab17.a=row_data.a and lab17.b=row_data.b;
    ct_inserted := ct_inserted +1;
    end loop;
    insert into report_17 values ('seccess', 'inserted '|| to_char(ct_inserted) || ' values');
exception
    when OTHERS
    then dbms_output.put_line('№ = ' || sqlcode|| chr(10) || 'error = ' || sqlerrm);
    err_msg := SUBSTR(SQLERRM, 1, 200);
    insert into report_17 values ('fail', 'inserted '|| to_char(ct_inserted) || ' out of ' ||to_char(ct/2)||' values: '|| err_msg);
end;
------procedure check
delete from lab17;
delete from lab17_to;
exec copy_data_job;
select*from lab17_to;
-------fill data
begin
for k in 0..15
loop
insert into lab17 values(k, k*1.5);
end loop;
end;

select* from lab17;
select*from lab17_to;
-------------------------create job------------
declare v_job number;
begin
  SYS.dbms_job.submit(
      job => v_job,
      what => 'BEGIN copy_data_job(); END;',
      next_date => trunc(sysdate+7) + 3 / 24,
      interval => 'trunc(sysdate + 7) + 60/86400');
  commit;
end;

select job, what, last_date, last_sec, next_date, next_sec, broken from user_jobs;
-------------------------execute job----------------------
begin
  dbms_job.run(21);
end;
select job, what, last_date, last_sec, next_date, next_sec, broken from user_jobs;
-----------------------------grant another time----------------------------
begin
  dbms_job.broken(21, broken => true);
end;
select job, what, last_date, last_sec, next_date, next_sec, broken from user_jobs;
---------------------------drop  from queue-------------------------
begin
  dbms_job.remove(21);
end;
select job, what, last_date, last_sec, next_date, next_sec, broken from user_jobs;
------------------------------return with number----------------------------
begin
  dbms_job.isubmit(21, 'BEGIN copy_data_job(); END;', sysdate, 'sysdate + 60/86400');
  commit;
end;
------------------------------------------------------------------------------
--Пакет DBMS_SHEDULER
--
--6.	Разработайте пакет, функционально аналогичный пакету из задания 1-5. Используйте пакет DBMS_SHEDULER. 

---------------schedule----------------------------------------
begin
  dbms_scheduler.create_schedule(
      schedule_name => 'Sch_2',
      start_date => sysdate,
      repeat_interval => 'FREQ=WEEKLY;',
      comments => 'Sch_2 WEEKLY at 21:25'
  );
end;
select * from user_scheduler_schedules;
------------------program-----------------------------
begin
  dbms_scheduler.create_program(
      program_name => 'Pr_2',
      program_type => 'STORED_PROCEDURE',
      program_action => 'up_job',
      number_of_arguments => 0,
      enabled => false,
      comments => 'Sch_2 WEEKLY at 21:25'
  );
end;
select * from user_scheduler_programs;
---------------job---------------
begin 
dbms_scheduler.create_job(
    JOB_NAME => 'J_1',
    program_name => 'Pr_2',
    schedule_name => 'Sch_2',
    enabled => true
);
end;
select * from user_scheduler_jobs;