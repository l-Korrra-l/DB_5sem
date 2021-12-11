-----------------my
Create table LAB14(X number, Y number) tablespace MKA_TEMP
insert into LAB14 values(2,3);
commit;

SELECT *FROM LAB14;
create or replace function MinusX(X number, Y number) return number
is
begin
return X-Y;
end;

BEGIN
DBMS_OUTPUT.PUT_LINE(MinusX(1,3));
END;

create or replace procedure  MinusXXX(X number, Y number)
is
begin
insert into LAB14 values(X-Y,Y-X);
commit;
end;

select * from LAB14;
commit

begin
dbms_output.put_line(MinusX(10,9));
end;
------hanna-----------------------------------------------------
grant create procedure to US;
create database link conToAnn
connect to USER1
identified by abcde
using 'WIN-MO68OS486GB:1521/orcl';


select * from LAB14@conToAnn;
insert into LAB14@conToAnn values(6,5);
COMMIT;
delete from LAB14@conToAnn where X=3;
update LAB14@conToAnn set x=3 where x=5;
commit;
SELECT * FROM LAB14;

create or replace procedure Plus_@conToAnn(X number, Y number)
is
begin
insert into LAB14@conToAnn values(X+Y,Y+X);
commit;
end;


exec PLUS_@con2ToAnn(10,11);
select * from LAB14@conToAnn;


create public database link con2ToAnn
connect to USER1
identified by abcde
using 'WIN-MO68OS486GB:1521/orcl';

select * from LAB14@con2ToAnn;
exec PLUS_@con2ToAnn(10,11);
commit;

begin
dbms_output.put_line(system.Mult@conToAnn(10,9));
end;

---polevoda------------------------------------------
drop database link conToPolee;
create database link conToPolee
connect to EXTERNALUSER
identified by abcde
using 'WIN-018VFL83RE4:1521/orcl';

select *from lab14table@conToPolee;
insert into lab14table@conToPolee values(5,5);
delete from lab14table@conToPolee where id=3;
update lab14table@conToPolee set id=3 where id=5;
commit;

exec MultipleXXX@conToPolee(11,1);
begin
dbms_output.put_line(system.PlusX@conToPolee2(10,9));
end;

drop database link conToPolee;
create public database link conToPolee2
connect to EXTERNALUSER
identified by abcde
using 'WIN-018VFL83RE4:1521/orcl';

select *from lab14table@conToPolee2;
insert into lab14table@conToPolee2 values(5,5);
delete from lab14table@conToPolee2 where id=3;
update lab14table@conToPolee2 set id=3 where id=5;
commit;

exec MultipleXXX@conToPolee2(11,1);
begin
dbms_output.put_line(PlusX@conToPolee2(10,9));
end;