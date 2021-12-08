drop table lb18;
create table lb18(id number(10) primary key, text varchar2(20), date_value date);
delete from lb18;
select *from lb18;
commit;
--control.ctl
--sqlldr system/parol direcctory\control.ctl
--spool 'dir\export.txt'
--select
--spool off;