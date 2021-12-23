--1
Create or replace procedure UpdPrice (NAMEE PRODUCTS.DESCRIPTION%TYPE)
is 
    res PRODUCTS%ROWTYPE;
begin 
        select * into res from PRODUCTS  where PRODUCTS.DESCRIPTION = NAMEE;
        dbms_output.put_line(res.PRODUCT_ID || '->' || res.PRICE);
        update PRODUCTS set PRODUCTS.PRICE = PRODUCTS.PRICE * 1.1 where PRODUCTS.PRODUCT_ID = res.PRODUCT_ID;
        select * into res from PRODUCTS  where PRODUCTS.DESCRIPTION = NAMEE;
        dbms_output.put_line(res.PRODUCT_ID || '->' || res.PRICE);
exception
    when OTHERS
    then dbms_output.put_line('¹ = ' || sqlcode|| chr(10) || 'error = ' || sqlerrm);
end;

begin
    UpdPrice('Ratchet Link');
end;

select * from PRODUCTS  where PRODUCTS.DESCRIPTION = 'Ratchet Link';
--2


create or replace function NumOrder (DAT number, CUSTT ORDERS.CUST%TYPE) return number
is 
    res number;
begin
    select count(*) into res from ORDERS where extract(year from ORDERS.ORDER_DATE)= DAT and ORDERS.CUST = CUSTT;
    return res;
exception
    when OTHERS
    then dbms_output.put_line('¹ = ' || sqlcode|| chr(10) || 'error = ' || sqlerrm);
end; 

begin
    dbms_output.put_line(NumOrder(2007, 2103));
end;

select *from ORDERS where ORDERS.CUST = 2103;
INSERT INTO ORDERS VALUES (112988,'2007-12-31',2103,105,'ACI','4100Y',11,27500.00);
