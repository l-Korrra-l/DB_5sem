--1
begin
    null;
end;

--2
declare 
    x char(15) :=  'Hello world';
begin
    dbms_output.put_line(x);
end;

--3
--sqlerrm зарезервированное имя переменноц окружения-- ошибка
--sqlcode номер ошибки
declare 
    z number (10, 2);
begin 
    z := 5 / 0;
    dbms_output.put_line('no');
EXCEPTION
    when OTHERS
    then dbms_output.put_line('№ = ' || sqlcode|| chr(10) || 'error = ' || sqlerrm);
end;

--4
declare
    z number(10 , 2) := 3;
begin
    begin
        z := 5 / 0;
    exception
        when OTHERS
        then dbms_output.put_line('№ = ' || sqlcode|| chr(10) || 'error = ' || sqlerrm);
    end;
    dbms_output.put_line('z = '||z);
end;

--5
show parameter plsql_warnings;
select name, value from v$parameter where name = 'plsql_warnings';

--6
select keyword from v$reserved_words where length = 1 and keyword != 'A';

--7
select keyword from v$reserved_words where length > 1 and keyword!='A' order by keyword;

--8
select name,value from v$parameter where name like 'plsql%';
show parameter plsql;

--9

declare 
--10
    x number(10);
    z number(10) := 5;
--12
    d number (5, 2);
    d1 number (3,2) := 2.33;
--13
    o number(5, 2) := 12.235567;
--14
    bf binary_float := 123456789.12345678911;
--15
    bd binary_double := 123456789.12345678911;
--16
    ne number(15,10) := 12345E-10;
--17
    boo boolean := true;
begin 

--11
    dbms_output.put_line('-=-=-=-= 10 -=-=-==-=--=');
    dbms_output.put_line('x = '||x);
    dbms_output.put_line('z = '||z);
    dbms_output.put_line('-=-=-=-= 11 -=-=-==-=--=');
    dbms_output.put_line('sum : 5 + 6 = '||(z+6));
    dbms_output.put_line('reminder division : 5 / 6 = '||z/6);
    dbms_output.put_line('reminder : 5 / 6 = '|| mod(z,6));
    dbms_output.put_line('-=-=-=-= 12 -=-=-==-=--=');
    dbms_output.put_line('d1 = '||d1);
    dbms_output.put_line('-=-=-=-= 13 -=-=-==-=--=');
    dbms_output.put_line('o = '||o);
    dbms_output.put_line('-=-=-=-= 14 -=-=-==-=--=');
    dbms_output.put_line('bf = '||bf);
    dbms_output.put_line('-=-=-=-= 15 -=-=-==-=--=');
    dbms_output.put_line('bd = '||bd);
    dbms_output.put_line('-=-=-=-= 16 -=-=-==-=--=');
    dbms_output.put_line('ne = '||ne);
    dbms_output.put_line('-=-=-=-= 17 -=-=-==-=--=');
    dbms_output.put_line('boo = '||boo);
end;

--18
declare
    n constant number(5) := 9;
    v constant varchar2(5) := '2 hii';
    c constant char(5) := 'c hii';
begin
    dbms_output.put_line('const n = '||n);
    dbms_output.put_line('const n + n = '||(n+n));    
    dbms_output.put_line('const n * 5 = '||(n*5)); 
    dbms_output.put_line('const v = '||v);
    dbms_output.put_line('const c = '||c);
  --n := 10;
    exception 
        when others
        then dbms_output.put_line('error = '||n);
end;

--19-20
select *from faculty;

declare
   v varchar(25) := 'word';
   t v%TYPE := 'type v';
   r  faculty%ROWTYPE;
begin
    dbms_output.put_line('v = '||v);
    dbms_output.put_line('t = '||t);
    r.faculty := 'hi';
    dbms_output.put_line(r.faculty);
        exception 
        when others
        then dbms_output.put_line('error = '||sqlerrm);
end;

--21
declare
    x pls_integer := 17;
begin
    if 8>x then dbms_output.put_line('8 > '||x);
    elsif 8=x then dbms_output.put_line('8 = '||x);
    else dbms_output.put_line('8<'||x);
    end if;
end;

--23
declare
    x pls_integer := 17;
begin
    case x
        when 17 then dbms_output.put_line('17');
    end case;
    case
        when 8 = x then dbms_output.put_line('8 ='||x);
        when x between 13 and 20 then dbms_output.put_line('between');
        else dbms_output.put_line('else');
    end case;
end;

--24
declare
    x pls_integer :=0;
begin
dbms_output.put_line('-=-=-=-= 24 -=-=-==-=--=');
    loop x:=x+1;
        dbms_output.put(x);
        exit when x>5;
    end loop;
--25
dbms_output.put_line('-=-=-=-= 25 -=-=-==-=--=');
    for k in 1..5
        loop dbms_output.put_line(k); 
    end loop;
--26
dbms_output.put_line('-=-=-=-= 26 -=-=-==-=--=');
    while (x>0) loop x:=x-1;
        dbms_output.put_line(x);
    end loop;
end;

------
DECLARE 
x number(2,1) := 2.1;
begin
for k in 1..10 loop 
if mod(k, 2) = 0 then dbms_output.put_line('number: '||k);
end if; 
end loop;
exception
when others 
then dbms_output.put_line('№ = ' || sqlcode|| chr(10) || 'error = ' || sqlerrm);
end;
