--test task
select *from teacher;
declare 
    cursor curs is select teacher, teacher_name from teacher;
begin
    for t in curs
    loop
    dbms_output.put_line(t.teacher|| ' ' || t.teacher_name);
    end loop;
exception
    when others
    then dbms_output.put_line(sqlerrm);
end;

declare
    rec teacher.teacher_name%type;
begin
    select teacher_name into rec  from teacher where teacher.teacher like 'SV%';
    dbms_output.put_line(rec);
exception
    when others
    then dbms_output.put_line(sqlerrm);
end;