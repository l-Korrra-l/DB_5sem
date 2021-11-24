
grant create procedure to c##mka;

--1- преподаватели на кафедре(в стандартный серверный вывод)

create or replace procedure get_teachers(pcode in teacher.pulpit%type)
    is 
    begin
    select *from teacher where teacher.pulpit = pcode;
    exception
        when others then dbms_output.put_line(sqlerrm);
end get_teachers;

--2
create or replace function get_num_teachers (pcode teacher.pulpit%type)
    return number is 
        rc number(5);
    begin
        select count(*) into rc from teacher where teacher.pulpit = pcode;
        return rc;
    exception
        when others then return -1;
end get_num_teachers;

--3
create or replace procedure get_teachers_fuc(pcode in faculty.faculty%type)
    is 
    begin
    select *from teacher inner join pulpit where teacher.pulpit = pulpit.pulpit and pulpit.faculty = pcode;
    exception
        when others then dbms_output.put_line(sqlerrm);
end get_teachers_fuc;

create or replace procedure get_subjects(pcode in subject.pulpit%type)
    is 
    begin
    select *from subject where subject.pulpit = pcode;
    exception
        when others then dbms_output.put_line(sqlerrm);
end get_subjects;

--4

create or replace function get_num_teachers_fac (pcode faculty.faculty%type)
    return number is 
        rc number(5);
    begin
        select count(*) into rc from teacher where teacher.pulpit = pcode;
        return rc;
    exception
        when others then return -1;
end get_num_teachers;