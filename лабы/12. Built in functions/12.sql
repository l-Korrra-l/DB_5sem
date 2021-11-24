--+++курсорный подзапрос к 11й
--1
select *from teacher;
alter table teacher add (birthday date, salary int);

update teacher set birthday = to_date('19.01.2000', 'DD.MM.YYYY'),
                    salary = 10
                    where pulpit like 'F%';

update teacher set birthday = to_date('10.01.1000', 'DD.MM.YYYY'),
                    salary = 100000
                    where teacher = 'SVV';

update teacher set birthday = to_date('11.01.2001', 'DD.MM.YYYY'),
                    salary = 1
                    where pulpit like 'O%';
                    
update teacher set birthday = to_date('11.01.1992', 'DD.MM.YYYY'),
                    salary = 13
                    where pulpit like 'T%';

update teacher set birthday = to_date('11.12.1986', 'DD.MM.YYYY'),
                    salary = 17
                    where pulpit like 'ET%' and birthday is null;
commit;
--2
select *from teacher;
select substr(teacher_name ,1,  regexp_instr(teacher_name, '\s', 1, 1) + 1)||'. '||
      substr(regexp_substr(teacher_name,'\s\S',1, 2),2, 1)||'. ' as teachers, teacher as initials from teacher;
      
--3
select * from teacher where TO_CHAR(birthday, 'd') = 2; --Monday
select * from teacher where TO_CHAR(birthday, 'd') = 4; --Wednesday

--4
--trunc dates
--round 
create or replace view FirstDay as select teacher_name,birthday, trunc(birthday, 'YEAR') as year,trunc(birthday, 'mm') as month  from teacher ;
select * from FirstDay;
create or replace view RoundDay as select teacher_name,birthday, round(birthday, 'YEAR') as year, round(birthday, 'mm') as month  from teacher ;
select * from RoundDay;


create or replace view NextMonth as select teacher_name, birthday from teacher where TO_CHAR(sysdate,'mm')+1 = TO_CHAR(birthday, 'mm') or (TO_CHAR(sysdate,'mm') = 12 and TO_CHAR(birthday, 'mm') = 1);
create or replace view NextMonthDec as select teacher_name, birthday  from teacher where TO_CHAR(to_date('11.12.1986', 'DD.MM.YYYY'),'mm')+1 = TO_CHAR(birthday, 'mm') or (TO_CHAR(to_date('11.12.1986', 'DD.MM.YYYY') ,'mm') = 12 and TO_CHAR(birthday, 'mm') = 1);
select * from NextMonth;
select * from NextMonthDec;

--5
create or replace view EveryMonth as select to_char(birthday,'mon') as Month, count(*) as Count from teacher group by to_char(birthday,'mon');
create or replace view EveryMonthOrder as select teacher_name, birthday from teacher order by to_char(birthday,'mon');

select*from EveryMonth;
select*from EveryMonthOrder;

drop view EveryMonthOerder;

--6
create or replace view Unniversary as select teacher_name, birthday from teacher where mod(extract(year from sysdate) - extract(year from birthday), 10) = 0;

select *from Unniversary;

cursor Salary(teacher%rowtype) return salary%type is
select pulpit,sum(salary) from teacher
group by pulpit;

--7
cursor Unniversary(teacher%rowtype) return teacher%rowtype is
select * from teacher
where mod((TO_CHAR(sysdate,'yyyy') - TO_CHAR(birthday, 'yyyy')+1), 10)=0;

--8
declare
    type contacts is record
    ( 
        adress VARCHAR2(50),
        phone number(13)
    );
    type person is record
    (
       name teacher.teacher_name%type,
       pulpit teacher.pulpit%type,
       contact contacts
    );
    rec person;
begin
    rec.name := 'Merhel Caroline';
    rec.pulpit := 'FIT';
    rec.contact.adress := 'Prostokvashino';
    rec.contact.phone := 375441236784;
    dbms_output.put_line('Name: '||rec.name|| chr(10) ||'Pulpit: '|| rec.pulpit || chr(10)|| 'Phone number: '|| rec.contact.phone);
exception
  when others
      then dbms_output.put_line(sqlerrm);
end;

