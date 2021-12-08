--1.�������� ������ ������ ������� ���������. 
select name, description from v$bgprocess;

--2.���������� ������� ��������, ������� �������� � �������� � ��������� ������.
select name, description from v$bgprocess where paddr != hextoraw('00');

--3.����������, ������� ��������� DBWn �������� � ��������� ������.
show parameter db_writer_processes; 

--4.�������� �������� ������� ���������� � �����������.
select * from v$session;

--5.���������� ������ ���� ����������.
select username, server from v$session;

--6.���������� ������� (����� ����������� ����������).
select * from v$services;  

--7.�������� ��������� ��� ��������� ���������� � �� ��������.
show parameter dispatcher;

--8.������� � ������ Windows-�������� ������, ����������� ������� LISTENER.
--OracleOraDB19Home1TNSListener

--9.�������� �������� ������� ���������� � ���������. (dedicated, shared). 
select username, server from v$session;

--10.����������������� � �������� ���������� ����� LISTENER.ORA. 
--"C:\Oracle_Home\network\admin\listener.ora"
--���������������� ���� ��������� listener, ����������� ��� ������ listener
--��������� ����, ����, �� ������� ������������

--11.��������� ������� lsnrctl � �������� �� �������� �������. 
--start
--stop
--status - (READY, UNKNOWN)
--services
--servacls - get the service ACLs information --access control lists
--version
--reload - reload the parameter files and SIDs
--save_config - saves configuration changes to parameter file
--trace -set tracing to the specified level (USER | ADMIN | SUPPORT | OFF)
--quit, exit

--12.�������� ������ ����� ��������, ������������� ��������� LISTENER. 
--lsnrctl - services
