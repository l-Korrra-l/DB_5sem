create table dba_help (sos nvarchar2(2000));
select *from dba_help;
insert into dba_help(sos) values ('Distributivy:
na oracle.com vybrat Database 12c > Download > 2 fajla dlya vashej OS

oracle.com->products->database oracle->19c. To get older follow the instructions.
Installyaciya:
zapusk Oracle Database 12c Installer
* ukazat email (neobyazatelno)
* Skip software updates
* Create and configure database
* Server class / Desktop class
* Single instance database installation
* Typical / Advanced install
* Create New Windows User : name, password
* 			Oracle database name : orcl.be.by
			Administrative password : ….
			SID : orcl
SID (System ID) – unikalnoe imya, kotoroe odnoznachno identificiruet ekzemplyar/BD');

insert into dba_help(sos) values ('Osn. sistemnye polzovateli:
* SYS – predopredelyonyj privilegirovannyj yuzer ranga admina BD, kotoryj yavlyaetsya vladelcem klyuchevyh resursov BD Oracle
* SYSTEM – predopredelyonnyj privilegirovannyj yuzer, kotoromu prinadlezhat klyuchevye resursy BD Oracle

Obshchee mezhdu sys i sysdba
Sozdayutsya pri inicializacii bazy dannyh orakl
Avtomaticheski poluchayut DBA rol
Imeyut raznye defoltnye paroli(MANAGER dlya system, CHANGE_ON_INSTALL dlya sys)

Raznoe mezhdu sys i system
Sys: vladeet bazovymi pablicami i predstavleniyami bazy dannyh
Skhema po umolchaniyu - sysdba

system
ispolzuetsya dlya sozdaniya dopolnitelnyh tablic i predstavlenij.
Imeet vse administrativnye vozmozhnosti za isklyucheniem dvuh:
Bekap i vosstanovlenie
Obnovlenie bd

(https://dba.stackexchange.com/questions/405/what-is-the-difference-between-sys-and-system-accounts-in-oracle-databases)


Specialnye sist. privilegii:
* SYSDBA, SYSOPER – specialnye privilegii admina, pozvolyayushchie vypolnyat bazovye zadachi administrirovaniya: zapusk i ostanovka ekzemplyara BD; sozdanie, udalenie, otkrytie, montirovanie bd…

SYSDBA:
•	Vypolnyat STARTUP i SHUTDOWN operacii
•	ALTER DATABASE: open, mount, back up, or change character set
•	CREATE DATABASE
•	DROP DATABASE
•	CREATE SPFILE
•	ALTER DATABASE ARCHIVELOG
•	ALTER DATABASE RECOVER
•	Vklyuchaet privilegiyu RESTRICTED SESSION
•	ALTER DATABASE RECOVER
•	Pozvolyaet podklyuchatsya kak polzovatel SYS

SYSOPER:
•	Vypolnyat STARTUP i SHUTDOWN operacii
•	CREATE SPFILE
•	ALTER DATABASE OPEN/MOUNT/BACKUP
•	ALTER DATABASE ARCHIVELOG
•	ALTER DATABASE RECOVER (Tolko polnoe vosstanovlenie. Drugie formy vosstanovleniya, takie kak UNTIL TIME|CHANGE|CANCEL|CONTROLFILE trebuyut SYSDBA.)
•	Vklyuchaet privelegiyu RESTRICTED SESSION
•	Pozvolyaet vypolnyat bazovye operacii, no bez vozmozhnosti prosmotra dannyh polzovatelya

Skhema po umolchaniyu dlya SYSDBA: SYS
Skhema po umolchaniyu dlya SYSOPER: PUBLIC
•	


DBA – predopredelyonnaya rol, kotoraya avtomaticheski sozdaetsya dlya kazhdoj BD oracle i soderzhit vse sistemnye privilegii, krome SYSDBA i SYSOPER
');

insert into dba_help(sos) values ('BD – nabor fizicheskih fajlov v OS (mb dostupna v neskolkih ekzemplyarah)

Baza dannyh — eto uporyadochennyj nabor strukturirovannoj informacii ili dannyh, kotorye obychno hranyatsya v elektronnom vide v kompyuternoj sisteme.
(https://www.oracle.com/ru/database/what-is-database/)

Ekzemplyar – nabor processov i oblast SGA (obespechivaet dostup tolko k 1 BD)

Ekzemplyar (instans):
* zapushchennyj server (programma) SUBD
* obshchaya (globalnaya) oblast pamyati : SGA i drugie sistemnye oblasti pamyati
* fonovye processy, prednazn. dlya upravleniya fajlami BD
');

insert into dba_help(sos) values ('startup nomount | mount | open
shutdown normal | transactional | immediate | abort
rezhim ostanovki	Abort	Immediate	Transactional	Normal
Razreshaet novye soedineniya	-	-	-	-
ZHdat konca tekushchego seansa	-	-	-	+
ZHdat konca tekushchej tranzakcii	-	-	+	+
Kontrolnaya tochka, zakrytie fajlov	-	+	+	+
');

insert into dba_help(sos) values ('Tablicy yuzera – nabor tablic, sozdannyh i obsluzhivaemyh yuzerom
+ soderzhat informaciyu yuzera
Slovar dannyh – nabor tablic, sozdannyh i obsluzhivaemyh serverom Oracle
+ soderzhat informaciyu o BD
Slovar Oracle – nabor tablic i svyazannyh s nimi predstavlenij, pozvolyayushchij otsledit vnutrennyuyu strukturu BD i deyatelnost SUBD oracle

* sozdayotsya pri generacii BD
* obnovlyaetsya i obsluzhivaetsya serverom v fonovom rezhime posle vypolneniya DDL-operatorov (create/alter/drop)
* pozvolyaet zaprashivat dannye v vide predstavlenij
* soderzhit: imena yuzerov, urovni privilegij, imena obyektov BD, tablichnye ogranicheniya, uchetnye dannye
* raspolozhenie v sistemnom TableSpace – SYSTEM
* vladelec – yuzer SYS, nekotorye predstavleniya – SYSTEM
* dlya dostupa k slovaryu  privilegiya – grant select any dictionary
Zaprosy k slovaryu dannyh:
- USER – obyekty yuzera
- ALL – obyekty, k kotorym yuzer imeet dostup
- DBA – vse obyekty BD (dlya admina)
- V$ - proizvoditelnost servera

Osnovnye predstavleniya:
dba_users,    _profiles,    _roles
dba_ (role | sys | tab | col) _privs,
role_ (role | sys | tab | col) _privs,
user_ (role | sys | tab | col) _privs
');


insert into dba_help(sos) values ('Oracle Multitenant – tekhnologiya, pozvolyayushchaya zapustit neskolko nezavisimyh BD v ramkah odnogo ekzemplyara

Eta opciya podderzhivaetsya novoĭ arhitekturoĭ, v kotoroĭ odna konteĭnernaya baza dannyh mozhet soderzhat mnozhestvo podklyuchaemyh baz dannyh.
(https://www.oracle.com/assets/multitenant-wp-t-2995359-ru.pdf)

* Kazhdaya BD imeet svoj nabor TableSpaces i nabor skhem, no pri etom u nih obshchaya SGA i odin nabor servernyh processov
* BD izolirovany, drug o druge nichego ne znayut, ne konfliktuyut

CDB – Container DB
PDB – Pluggable DB
* Mozhno sozdat neskolko CDB – dlya raznyh versij PO SUBD
* Odnu PDB mozhno perenosit mezhdu CDB
* V CDB sozdaetsya glavnyj kontejner Root (soderzhit metadannye)
* V odnoj CDB mozhno sozdat do 252 PDB
* s mnozhestvom pdb mozhno rabotat kak s 1 celym

Vazhno otmetit chto s versii 12s poddeerzhivaetsya CDB arhitektura. No takzhe mozhno ispolzovat v etoj versii staruyu, ne-CDB arhitekturu.
');


insert into dba_help(sos) values ('Fajly parametrov – ispolzuyutsya dlya hraneniya parametrov ekzemplyara – SPFILE. Izmeneniya primenyayutsya pri sleduyushchem starte Oracle
*select name, description from v$parameter; 

Upravlyayushchie fajly – soderzhat imena osnovnyh fizicheskih fajlov BD i nekotoryh parametrov – ispolzuyutsya dlya poiska drugih fajlov OS
	*dlya nadezhnosti sozdayutsya 2 upravlyayushchih fajla (na raznyh diskovyh nositelyah)
	*show parameter control;			--polnaya informaciya
	*select name from v$controlfile;		--raspolozhenie

dlya izmeneniya: shutdown immediate -> skopirovat upravlyayushchij fajl -> izmenit parametry CONTROL_FILES v fajle parametrov -> startup open

Fajl parolej – dlya autentifikacii adminov BD. Mozhno sozdavat, peresozdavat, izmenyat
	*prosmotret polzovatelej
		*select * from v$pwfile_users;

Fajl trassirovki – dlya fiksacii vsekh sobytij BD, v tom chisle kriticheskih.
	*po i soderzh material dlya vyyasneniya pochemu proizoshel tot/inoj sboj.

Kazhdyj servernyj i fonovyj process mogut delat zapisi v sootvetstvuyushchij trassirovochnyj fajl. Kogda proiskhodit vnutrennyaya oshibka processa, process sohranyaet damp s informaciej ob oshibke v svoj trassirovochnyj fajl. CHast informacii v fajle trassirovki prednaznachena dlya administratora bazy dannyh, togda kak drugaya chast - dlya sluzhby Podderzhki Oracle.

alter session set sql_trace=true;
alter session set sql_trace=false;
');


insert into dba_help(sos) values ('Fajl dannyh – fajl, v kotorom hranyatsya vse dannye v BD.
	*v kazhdoj BD est hotya by 1 (s 1 BD mozhet byt svyazan tolko 1 fajl dannyh)

ZHurnal povtora vypolneniya – diskovye resursy, v kotoryh fiksiruyutsya izmeneniya vnosimye yuzerami v BD.
	*predstavlyaet soboj fajl OS
	*2+ fajla OS, primenyayutsya pri vosst. BD.
	*ispolzuyutsya ciklicheski (snachala zapis v 1j fajl, zatem vo 2oj, 3… 1)
			select * from v$logfile;

Multipleksirovanie zhurnalov povtora – podderzhka neskolkih kopij kazhdogo zhurnala
	*select * from v$log;
SCN (system change number) – sistemnyj nomer izmenenij v BD (pred.selekt (first_change))

Sistemnyj nomer izmeneniya, ili SCN (system change number) – ocenochnyj faktor, ispolzuemyj bazoj dannyh dlya otslezhivaniya sostoyaniya v kazhdyj dannyj moment vremeni. Oracle ispolzuet SCN dlya slezheniya za vsemi izmeneniyami, provedennymi v baze dannyh. SCN – eto logicheskaya vremennaya metka, ispolzuemaya Oracle dlya uporyadochivaniya sobytij, proiskhodyashchih s bazoj dannyh. SCN ochen vazhen po neskolkim prichinam, ne poslednyaya iz kotoryh – vosstanovlenie bazy dannyh posle sboya.

Parametry ZHurnala Povtora (ukazyvayutsya v upravlyayushchih fajlah):
	*maxlogfiles – maks.kol-vo grupp ZHP
	*maxlogmembers – maks.kol-vo fajlov v gruppe	
	*maxinstances – maks.kol-vo instansov
	*maxdatafiles – maks.kol-vo fajlov dannyh

Dobavit novoj gruppy:
	alter database add logfile group 5 �?put\redo5.log’ size 50m blocksize 512;
Dobavlenie fajla v gruppu:

	alter database add logfile member �?put\redo51.log’ to group 5;

Pereklyuchenie zhurnalov:
	alter system switch logfile;
Arhivy zhurnalov povtora: 
	Rezhimy raboty ekzemplyara (select name, log_mode from v$database;)
		*archivelog;
		*noarchivelg;
	*zhiznenno vazhny pri vosstanovl.
	*primenyaetsya posledovatelno (esli 1 propushchen – ostalnye ne mogut ispolzovatsya)
Arhivy:
	*vklyuchit process arhiv-niya (shutdown, mount, .., open)
			alter database archivelog;
	*arhivnyj zhurnal poyavlyaetsya posle pereklyucheniya operativnogo zhurnala
');


insert into dba_help(sos) values ('V Oracle ispolzuyutsya 2urovnevaya organizacii BD.
	*obyekty verhnego urovnya – logicheski struktury BD.
	*obyekty nizhnego urovnya – fizicheskie struktury BD.
Logicheskaya struktura sost iz polzovatelskih komponetov: tablichnoe prostranstvo, segment, ekstent i blok dannyhkh.
Tablichnoe prostranstvo - logicheskaya struktura hraneniya dannyh, kontejner segmentov.
Segment – oblast na diske, vydelyaemaya pod obyekty. Raspolagaetsya v tablespace
Ekstent – nepreryvnyj fragment diskovoj pamyati
Blok – min edinica obyema pamyati, primenyaemaya pri zapisi i chtenii dannyh

Segment sostoit iz ekstentov, ekstent – iz blokov. V odnom ts mozhet byt neskolko segmentov.

Segment:
hranit tolko dannye, poetomu on sozdaetsya tolko pri dobavlenii dannyh. Pri udalenii strok iz tablicy, segment ne udalyaetsya. Pri udalenii tablicy izmenyaetsya imya segmenta, i informaciya ob udalenii zapisyvaetsya v slovar BD(???). Mb vosstanovlen s pomoshchyu mekhanizma RECYCLEBIN. Dlya udaleniya recyclebin-segmenta primen. komanda PURGE. 
*segment dannyh  (hranit tablicu + stroki tablic (1 tablica – 1 segment))		
*segment indeksov (hranyat indeksy (specialnye tablicy, kotorye soderzhatinformaciyu iz klyuchevogo stolbca tablicy i id nomera stroki - rowid))		
*segment otkata (stroyatsya sistemoj i ispolzuyutsya pri vypolnenii tranzakcii)
*vremennyj segment	(sozdayotsya sistemoj i ispolzuetsya v fajlah BD, chtoby sozdat vremennuyu rabochuyu oblast dlya promezhutochnyh stadij obrabotki zaprosa, napisannyj na yazyke SQL  i operacij sortirovki)

Ekstent:
dlinu vydelyaemogo ekstenta vychislyaet SUBD. Esli pri sozdanii TableSpace zadana opciya UNIFORM, to vse ekstenty imeyut odinakovuyu dlinu.

Blok – naimenshaya edinica upravleniya prostranstvom v BD. Blok – naimenshaya edinica vvoda-vyvoda, ispolzuemaya serverom.

');


insert into dba_help(sos) values ('Fizicheski BD  organizovana kak sovokupnost fajlov, sozdavaemyh obychnymi sredstvami OS. Takim obrazom osnovoj fizicheskogo urovnya yavlyaetsya fajl.
	Vse komponenty fizicheskogo urovnya BD mogut razdelyatsya na 2 bolshie gruppy(???):
	*sistemnye obyekty, ispolzuemye vnutri sistemy i neobhodimye dlya vypolneniya funkcij SUBD
		sozdayutsya i nastraivayutsya adminom BD i nedostupny yuzeru
	*fajly parametrov, upravleniya, trassirovki, zhurnal povtora i arhivy
	*obyekty yuzera
	*fajly dannyh
');



insert into dba_help(sos) values ('SGA(system global area):
- gruppa oblastej razdelyaemoj pamyati
- soderzhat dannye i upravlyayushchuyu informaciyu dlya odnogo ekzemplyara Oracle
- sovmestno ispolzuetsya vsemi servernymi i fonovymi processami
	select * from v$sga;

Struktura:	Osnovnye puly oblasti SGA:
* razdelyaemyj pul (Rech Pospolituyu zhalko)
* bolshoj pul (bolshoj kush)
* fiksiruemaya oblast SGA (papich fiksiruet)
* pul Java (poshla nahuj eta zhaba)
* bufernyj pul
* bufer zhurnalov povtora	* java pool
* large pool
* shared pool
* streams pool
* “null” pool

Razdelyaemyj pul – hranit ispolnyaemyj pl/sql kod i operatory sql vmeste s informaciej slovarej dannyh
Bolshoj pul – neobyazatelen – nuzhen dlya hraneniya zaprosov (hranit chto-to tipa rezultata bufera rman)
Java pul – dlya BD, kotoraya sozdaet mnogo Java koda («kuchi» dlya sozdannyh obyektov Java)
streams pool – pamyat, kot.vydel.dlya poderzhki streams v vashem ekzemplyare (potok)
Bufernyj kesh – hranit kopii blokov dannye, prochitannye iz fajlov ili sozdannye dinamicheski, chtoby realizovat model soglasovannogo chteniya
Bufer zhurnal povtora – generiruet dannye povtornogo vypolneniya, kotorye zapisany v etot bufer.

Pamyat razlichnym pulam v SGA vydelyaetsya blokami – granulami (naimenshaya edinica vydeleniya pamyati). - 4 8 ili 16 mbajt
');



insert into dba_help(sos) values ('Process – mekhanizm v OS, kotoryj mozhet vypolnit posledost shagov.
Servernyj process – process, vypolnyayushchijsya na osnovanii klientskogo zaprosa. Klient – lyubaya proga, kotoraya pytaetsya podklyuchitsya k BD. Kazhdyj yuzer, podklyuchennyj k BD imeet svoj otdelnyj servernyj process, sushchestvuyushchij na protyazhenii seansa. Pervichnoe ustanovlenei soedineniya proiskhodit cherez specialnyj servernyj process Oracle Net Listener. 
V nekotoroj situacii, kogda prilozhenie i BD rabotayut na 1 kompe, mozhet obedinyatsya yuzerskij process i servernyj process v odin dlya umensheniya sistemnyh izderzhek. Odnako, kogda prilozhenie i BD rabotayut na razlichnyh PK , polzoaatelskij process vsegda svyazan v BD cherez otdelnyj servernyj process.
Naznachenie – otvechat na poluchaemye sql-zaprosy.
Servernyj process mozhet vypolnyat 1+ iz sleduyushchih operacij:
	*poluchenie i vypolnenie sql-Operatora
	*chtenie fajlov dannyh
	*vozvrashchenie rezultatov takim obrazom, chtoby prilozhenie moglo obrabotat informaciyu. 
	*osushchestvlyat poisk v keshe

Oracle Net Listener – process na storone servera, kotoryj proslushivaet vhodyashchie zaprosy klienta na soedinenie s ekzemplyarom.
Listener – programma-server, kotoraya proslushivaet TCP-port, prinimayushchaya zaprosy na soedinenie
V rezultate uspeshnoj raboty Listener ustanavlivaet soedineniya mezhdu klientom i obrabotchikom zaprosov ekzemplyara. Po umolchaniyu TCP-port – 1521.
');



insert into dba_help(sos) values ('Fonovoj process – specialnaya gruppa processov dlya obespecheniya proizvoditelnosti i podderzhki raboty bolshogo chisla yuzerov.
Fonovyj processy zapuskayutsya vmeste s BD i vypolnyayut razlichnye zadachi obsluzhivaniya.
LREG (listener registration process) – periodicheskaya registraciya servisov v process Listener;
DBWn (database writer process) – zapisyvaet izmeneniya v fajly dannyh (iz buf.kesha)
CKPT – vypolnyaet process checkpoint;
	* vypolnyaetsyasya pri shutdown, alter system checkpoint, pereklyuchenii REDO – zhurnala, backup
	*zapisyvaet informaciyu o kontrolnoj tochke v upravlyayushchij fajl
LGWR (log writer process) – zapisyvaet izmeneniya v zhurnal povtora;
	-pri izmenenii v tablice (ins, up, del) zapisi zafiks/nezafiksirovannye izmen v zhurnal povtora
	*ne mozhet zapisat – vse ravno prodolzhaet rabotat
	*iniciiruet sozdanie kontrolnyh tochek (bolshe tochek – menshe t pri vosstanovlenii)
ARCn (Archiver Process) – kopiruet fajly zhurnala povtora posle pereklyucheniya gruppy zhurnalov
PMON (process monitor) – otvechaet za ochistku posle nenormativnogo zakrytiya podklyucheniya
RECO (recovery process) – razreshaet problemy svyazannyh s raspredelyonnymi tranzakciyami.
');

insert into dba_help(sos) values ('Proslushivatel (Listener) – komponent, kotoryj pozvolyaet ustanovit soedinenie mezhdu klientom i bazoj dannyh. Odin listener obsluzhivaet neogranichennoe kolichestvo BD. listener upravlyaetsya fajlom listener.ora. Mb skonfigurirovan tolko 1 fajl listener.ora, na servere mb nastroeno neskolko listenerov, i etot fajl mozhet obsluzhivat vsekh listenerov.
	Esli na servere neskolko listenerov. => s celyu obespecheniya otkazoustojchivosti proivzvoditsya balans obrashchenij (load balancing)

Po umolchaniyu, listener imeet imya LISTENER i sozdayotsya pri ustanovke oracle.
Esli neskolko listenerov – kazhdyj poluchaet imenno unikalnoe imya.
Nastrojki proslushivatelya vklyuchayut sleduyushchie parametry:	
	Protokol, port, imya hosta.
Dlya upravleniya listenerom ispolzuetsya utilita lsnrctl; Dostupny sleduyushchie komandy:
Start – zapusk processa proslushivaniya
Stop – ostanovka
Status – tekushchij status listenera.
');

insert into dba_help(sos) values ('Oracle podderzhivaet 2 rezhma soedineniya: dedicated(vydelennyj) i shared(razdelyaemyj) server.
Dedicated (po umolchaniyu) – dlya kazhdogo Klienta – otdelnyj servernyj process.
Shared – v kachestve obrabotchika vystupaet programma dispatcher, kotoraya:
1)Poluchaet zapros ot Klienta
2)Pomeshchaet ego vo vhodyashchuyu ochered k razdelyaemomu Serveru
3)Nezanyatyj razdelyaemyj Server izvlekaet i obrabatyvaet zapros
4)Posle obrabotki razdelyaemyj Server pomeshchaet rezultat obrabotki v vyhodnuyu ochered
5)Iz ocheredi rezultat izvlekaet dispetcher
6)Dispetcher peresyl rezultat klientu
Za podklyuchenie otvechayut 2 konfig fajla:
*listener.ora – dlya upravleniya proslushivatelem 
*tnsnames.ora – podrobnoe opisanie podlkyuchenij k BD
Vidy podklyuchenij:
*prostoe podklyuch (basic) – yavno ukazyvayutsya vse parametry soedineniya
	CONNECT imya/parol@[//]host[:port][/imya_sluzhby]
*lokalnoe imenovanie (tns)
		V tncnames (host, port, service_name) -> oracle net manager
*LDAP-soedinenie – s pomoshchyu sluzhby katalogov.
*local/bequeath-soed
		*tolko na Servere
		*mozhet soedinyatsya s pomoshchyu sqlplus/sqldeveloper
		*bez ukazaniya parametrov soedineniya
		*tolko s vydelennym Serverom
		*listener ne zadejstvovan
');

insert into dba_help(sos) values ('TS – logicheskaya struktura hraneniya dannyh, kontejner segmentov
S odnim TS svyazany 1 ili nesk fajlov OS, s kazhdym fajlom OS tolko 1 TS

Neskolko tipov TableSpaces
* permanent	– hranenie postoyannyhobyektov
				– mb neskolko
				— 1 mb propisano v kachestve TS po umolchaniyu
				– mozhno sozdat svoi obyekty v lyubom PTS, esli ne zapreshcheno
* temporary – hranenie vremennyh dannyh
			– mb neskolko
			– pripisano 1 ili neskolkim yuzeram, kotorye mogut tam razmeshchat svoi dannye
* undo – hranenie segmentov otkata, ispolzuetsya vsegda odin (ukaz. v SPFILE.ORA)

TP otkata undo:
	*sozd.CREATE UNDO TABLESPACE

1) Perevesti TP v rabochee/ nerabochee sostoyanie: 
	ALTER TABLESPACE imya_TP OFFLINE (ONLINE)
2) Pri sozdanii tablicy mozhno ukazat TP:
	create table xxx1(x1 int) tablespace imya_TP; 
Esli TP ne ukazat pri sozdanii tabl – tablica sozdastsya v TP po umolchaniyu.
3) Udalenie tablicy s opredelyonnym TP:
	drop table xxx1 purge;
4) vyvesti spisok TP:
	select tablespace_name, contents from dba_tablespaces;

create (temporary) tablespace imya_TP 
 		datafile (tempfile) �?put_k_fajlu’
		size
		autoextend on next
		maxsize

Parametry:
* smallfile – 1022 fajlov
* bigfile – 1 fajl, 128 TB
* logging / nologging / force logging (obyazatelnost zhurnalirovaniya)
* online / offline
* reuse
');


insert into dba_help(sos) values ('Privilegiya – pravo vypolnyat konkretnyj tip predlozhenij SQL, ili pravo dostupa k obyektu drugogo yuzera
* sistemnye i obyektnye
* grant - dat vs revoke - zabrat
 
Sistemnye:
create (any), alter (any), drop …
Obyektnye:
alter, delete, execute, index, insert, select, update …

Rol – imenovannyj nabor privilegij

role, password_required, authen_type, common, oracle_maintained
');


insert into dba_help(sos) values ('YUzer – fizicheskoe ili yuridicheskoe lico, kotoroe imeet dostup k BD i polzuetsya uslugami dlya polucheniya informacii
create user .. identified by 12345
	default tablespace ..  quota unlimited on .. - ttableSpace i kvota v nyom
	temporary tablespace .. - vremennoe TS
	profile .. - profil
	account unlock - razblokirovan li akk
	password expire - istyok li parol
');


insert into dba_help(sos) values ('Dostup k dannym osushchestvlyaetsya v vide zaprosov na yazyke SQL – deklarativnyj (neprocedurnyj) yazyk: s ego pomoshchyu mozhno sformulirovat, chto nado poluchit, no nelzya ukazat KAK.
* DDL (definition) – create, alter, drop
* DML (manipulation) – select, insert, update, delete
* DCL (control) – grant, revoke
* TCL – commit, rollback, savepoint
');


insert into dba_help(sos) values ('Tablica – osnovnaya struktura sohraneniya informacii v BD
* Tablicy, organizovannye v kuche (heap-organized), ili tradicionnye tablicy. Eti tablicy — ne chto inoe, kak obychnye tablicy Oracle, v kotoryh dannye hranyatsya bez kakogo-to opredelennogo poryadka.
* Indeks-tablicy. Indeks-tablicy hranyat dannye v otsortirovannoj indeksnoj strukture — binarnom dereve (B-tree).
* Klasterizovannye tablicy. Klasterizovannaya tablica yavlyaetsya chastyu gruppy tablic, kotorye razdelyayut mezhdu soboj odni i te zhe bloki dannyh, poskolku dannye iz klasterizovannyh tablic chasto zaprashivayutsya sovmestno.
* Sekcionirovannye tablicy. Sekcionirovannaya tablica pozvolyaet delit bolshie obyemy dannyh na podtablicy, imenuemye razdelami (partition), soglasno razlichnym kriteriyam. Sekcionirovanie osobenno polezno v srede hranilishcha dannyh.
* vlozhennye (oda tablica v drugoj tablice)
* vremennye (lokalnye/globalnye; udalyayutsya kogda yuzer/vse otsoedinyayutsya ot Servera)
* obyektnye (mogut sozdavat obyekty i rabotat s nimi)
* vneshnie  (mogut rabotat s fajlami kak s tablicej (posle ih zagruzki))

V pervuyu ochered tablica proveryaetsya na Normalnuyu Formu:
	*1 nf (vse polya nedelimy i ne vychislyaemy (atomarny))
	*2 nf (1 + kazhdyj neklyuchivoj stolbec dannyh zavis ot pervichnogo klyucha)
	*3 nf (2 + net tranzit zavisimosti (esli est vneshnij klyuch net vneshnego klyucha))

Parametry:
create table (…)
organized index
nomonitoring (server smotrit kak zapoln tablica)
logging (vse izmeneniya tablicy zapis v log)
pctthreshold 20 (% zapolnennosti v bloke ?)

Parametry:
PCTFREE - % pamyati bloka, rezerv. dlya vozmozhnyh obnovlenij strok, uzhe soderzhashchihsya v bloke
PCTUSED - % zanyatoj chasti pamyati bloka

- mozhet imet do 1000 stolbcov (oracle 7 do 254)
- mozhet imet neogranichennoe chislo strok + indeksov (neogranichennye problemy admina)
- net ogranicheniya na chislo tablic
');


insert into dba_help(sos) values ('tablicy, kotorye hranyat dannye na vremya sessii ili tekushchej tranzakcii
V kotoroj yuzer vidit tolko svoi dannye (svoj nabor)
rabotaya, kak s obychnoj tablicej
Otlichie ot obychnyh: (net flashback - vosstanovlenie)
privil: create table
statichny: vremennye tablicy sozdayutsya (create) edinozhdy i sushchestvuyut, poka ih ne udalyat (drop)
v nachale seansa vsegda pusta
drop ne poluchitsya esli tablica v etot moment ispolzuetsya drugim yuzerom 

byvayut:
* on commit preserve rows – dannye sushchestvuyut na vremya seansa, vozmozhny vse DML, TCL
* on commit delete rows – dannye sushchestvuyut na vremya tranzakcii, vozmozhny vse DML, posle vypolneniya commit / rollback tablica stanet pustoj

- mozhno sozdavat triggery, konstrejny (ogranicheniya celostnosti)
- ne mozhet byt indeksno-organizovannymi, nelzya sekcionirovat, razmeshchat v klastere
- dannye povtornogo vypolneniya generiruyutsya(???), no ih kolichestvo och malo
Nuzhny, kogda iz postoyannyh tablic nuzhno dostat, kuda-to na vremya polozhit i bolshe oni ne nuzhny.
');


insert into dba_help(sos) values ('Celostnost dannyh - svojstvo dannyh, nuzhna dlya korrektnosti i validnosti hranimyh dannyh. Takzhe, s ih pomoshchyu mozhno obnaruzhivat oshibki v prilozheniyah, kotorye tyazhelo najti drugimi sposobami.

1) pimary key – predotvrashchaet poyavleniya v stolbce povtornyh znachenij i pustogo znacheniya
2) check – obespechivaet sootvetstvie stolbca opredelyonnym parametram : n number CHECK (n<1)
3) unique – garantiruet unikalnost: CONSTRAINT  n UNIQUE (n, name)
4) foreign key – pust est roditelskaya tablica, kotoraya ssylaetsya na znachenie drugoj tablicy, garantiruya sushchestvovanie : CONSTRAINT n REFERENCES tabl2 (m);
');


insert into dba_help(sos) values ('* char / nchar [2]		--stroka fiksirovannoj dliny
* varchar2 / nvarchar2 [4]  --strok peremennoj dliny
* date - data
* interval - interval dat
* interval day to second [11] / interval year to month timestamp [5] – pokaz tochnuyu raznicu mezhdu dvumya datami
* timestamp with time zone [13]/ timestamp with local time [7-11] – data, vremya i nastrojki, svyazi s chasovym poyasom / k poyasu BD
* number (A,B) – dlya chisl znachenij peremennoj dliny (obshchego kolichestva, posle zapyatoj)
* long raw / long / raw – uzhe ne ispolzuetsya
* rowid / urowid – id stroki v tablice (na urovne bd ne povtor, unik dlya kazhd.stroki)/ adresaciya strok v tablicah, orgnaizovana po indeksu
');


insert into dba_help(sos) values ('Indeks – struktura, pozvolyayushchaya proizvodit bystryj poisk (po suti obyekt tablicy)
Indeksy mogut otnositsya k neskolkim tipam, naibolee vazhnye iz kotoryh perechisleny nizhe:
Unikalnye i neunikalnye indeksy. Unikalnye indeksy osnovany na unikalnom stolbce. Vmesto unikalnyh indeksov sleduet ispolzovat unikalnye ogranicheniya. Kogda nakladyvaetsya ogranichenie unikalnosti na stolbec tablicy, Oracle avtomaticheski sozdaet unikalnye indeksy po etim stolbcam.
Pervichnye i vtorichnye indeksy. Pervichnye indeksy – eto unikalnye indeksy v tablice, kotorye vsegda dolzhny imet kakoe-to znachenie i ne mogut byt ravny null.
Vtorichnye indeksy – eto prochie indeksy tablicy, kotorye mogut i ne byt unikalnymi.

Sostavnye indeksy – indeksy, soderzhashchie dva ili bolee stolbca iz odnoj tablicy.
Klasterizovannye - neklasterizovannye

* tablichnyj (B*Tree)	--chashche vsego (v vide sbalans dereva)
Dlya indeksirovaniya unikalnyh stolbcov s vysokoj selektivnostyu
* bitovyj --(t. v orcl) sozdayot bitovye karty dlya kazhdogo vozmozhnogo znacheniya stolbca, gde kazhdomu bitu sootvetstvuet stroka, a znachenie bita 1(0) oznachaet, chto sootvetstvuyushchaya stroka soderzh(ne sod) indeksovannoe znachenie
OCHEN bystroe
 lyuboe izmenenie – nado peresozdat indeks (udalit i sozd zanovo )=> dlya hranilishcha neizmenyaemyh dannyh, esli nado podschit kolichestvo znachenij
Dlya indeksirovaniya stolbcov s nihkoj selektivnostyu (ne dlya tablic s chastym obnovleniem)
* funkcionalnyj –vychislyaet znachenie funkcii po zadannomu stolbcu i sohranyaet rezultat v indekse (Blinova-blinova: LOWER(name) / UPPER(name))
* klasternyj - eto drevovidnaya struktura dannyh, pri kotoroj znacheniya indeksa hranyatsya vmeste s dannymi, im sootvetstvuyushchimi. I indeksy, i dannye pri takoj organizacii uporyadocheny.

Plotnost zaprosa – kolichestvo vovzrashchaemyh strok zaprosa
Selektivnost zaprosa – kolichestvo vozvrashchaemyh znachenij klyucha (%klyuchej ot obshchego kolichestva)

Horoshaya selektivnost – esli kol-vo vozvrashchaemyh znacheniyj klyucha menshe (<10%) 
Plohaya selektivnost – esli kol-vo vozvrashchaemyh znachenij bolshe 10%
');


insert into dba_help(sos) values ('Tranzakciya – neskolko posledovatelnyh instrukcij SQL, kotorye rassmatrivayutsya kak edinoe celoe

Po urovnyam izolirovannosti:
SERIALIZABLE (serializuemyj), REPEATABLE READ (povtoryaemoe chtenie), READ UNCOMMITTED (chtenie tolko nezafiksirovannyh dannyh) i READ COMMITTED (chtenie tolko zafiksirovannyh dannyh).

Operatory:
* COMMIT – fiksiruet vse izmeneniya dlya tekushchej tranzakcii
* ROLLBACK – otkat nezafiksirovannyh izmenenij: chitaet informaciyu iz segmentov otkata i vosstanavlivaet bloki dannyh v sostoyanie, v kotorom oni nahodilis do nachachala tranzakcii, osvobozhdenie blokirovki
* SAVEPOINT – v odnoj tranzakcii mozhet byt neskolko, sozdayot vozmozhnost otmeny tolko chasti raboty, prodelannoj v tranzakcii Osvobozhdaet blokirovki, kotorye byli ustanovleny otmenennym operatorom
* SET TRANSACTION – ustanavlivaet atributy tranzakcii – uroven izolirovannosti, budet ispolzovatsya dlya chteniya ili zapisi


PRAGMA AUTONOMOUS_TRANSACTION;
Avtonomnye tranzakcii – pozvolyayut sozdavat podtranzakcii, kotorye mogut sohranyat/otmenyat izmeneniya vne zavisimosti ot roditelskoj tranzakcii
');


insert into dba_help(sos) values ('Posledovatelnost (sequence)– obyekt BD, prednaznachennyj dlya generacii chislovoj posledovatelnosti
Privilegiya create sequence
create sequence s1
increment by 20	-- prirashchenie
start with 10		-- nachalnoe znachenie
(no)maxvalue	-- maksimalnoe znachenie
(no)minvalue		-- minimalnoe znachenie
(no)cycle		-- (ne)ciklicheskaya - dlya ciklicheskoj dolzhno stoyat max dlya vozrastayushchej i min dlya ubyvayushchej
cache 20		-- keshiruetsya - neskolko znachenij zaranee vyschityvayutsya v pamyati. Ne mozhet byt bolshe chem diapazon znachenij i menshe chem 2
order	—garantiya sohraneniya ocheredi

S1.nextval, S1.currval (from dual) – poluchit sleduyushchee/tekushchee znachenie
Slovari: sys.dba_sequences, sys.all_sequences, sys.user_sequences
');

insert into dba_help(sos) values ('Klastery:

Klasterami nazyvayut dve ili bolee tablic, kotorye fizicheski hranyatsya vmeste, chtoby ispolzovat preimushchestva sovpadayushchih mezhdu tablicami stolbcov. Esli dve tablicy imeyut identichnyj stolbec i prihoditsya soedinyat tablicy po nemu, to stanovitsya vygodno hranit znacheniya obshchih stolbcov v odnom i tom zhe bloke dannyh. Celyu takoj organizacii yavlyaetsya sokrashchenie obyema vvoda-vyvoda s uvelicheniem skorosti dostupa pri soedinenii svyazannyh tablic. Odnako klastery ponizhayut proizvoditelnost operatorov INSERT, poskolku dlya hraneniya dannyh neskolkih tablic trebuetsya bolshe blokov.

Snachala sozdayotsya klaster, potom tablicy i pri sozdanii ukazyvaem etot klaster

svyazannye stolbcy – klasternyj klyuch

Klaster – obyekt BD, kotoryj hranit znacheniya obshchih stolbcov neskolkih tablic

Hesh-klastery:
ispolzuet funkcii heshirovaniya klasternogo klyucha stroki dlya opredeleniya fizicheskoj lokalizacii mesta, gde stroku sleduet hranit
Naibolshie preimushchestva – v zaprosah, ispolzovanie operacii ravenstva: where id = 999;
privilegiya: create cluster

create cluster CJACORE.cl1 ( x number(2,5) ) hashkeys 100; - ukazyvaetsya kolichestvo hesh-klyuchej
');

insert into dba_help(sos) values ('Predstavlenie – poimenovannyj select zapros
mozhet obrashchatsya kak k obychnoj tablice
dannyee hranyatsya v tablice
dobavlyayut uroven zashchity
skryvayut slozhnost dannyh
skryvayut imena stolbcov tablic
vypolnyayutsya naletu

Dlya inserta ne dolzhno byt
1) vychislyaemyh stolbcov
2) stolbcov iz raznyh tablic

Parametry:
* FORCE – sozdayot predstavlenie, nevazhno sushchestvuyut li tablicy i est li prava
* NOFORCE – po umolchaniyu
* WITH CHECK OPTION – zapreshchaet izmenenie strok kotoryh net v podzaprose
* READ ONLY - tolko dlya chteniya
');

insert into dba_help(sos) values ('Posledovatelnost (sequence)– obyekt BD, prednaznachennyj dlya generacii chislovoj posledovatelnosti
Privilegiya create sequence
create sequence s1
increment by 20	-- prirashchenie
start with 10		-- nachalnoe znachenie
(no)maxvalue	-- maksimalnoe znachenie
(no)minvalue		-- minimalnoe znachenie
(no)cycle		-- (ne)ciklicheskaya - dlya ciklicheskoj dolzhno stoyat max dlya vozrastayushchej i min dlya ubyvayushchej
cache 20		-- keshiruetsya - neskolko znachenij zaranee vyschityvayutsya v pamyati. Ne mozhet byt bolshe chem diapazon znachenij i menshe chem 2
order	—garantiya sohraneniya ocheredi

S1.nextval, S1.currval (from dual) – poluchit sleduyushchee/tekushchee znachenie
Slovari: sys.dba_sequences, sys.all_sequences, sys.user_sequences
');

insert into dba_help(sos) values ('Materializovannoe predstavlenie –  hranyat nekotorye dannye, kotorye obnovlyayutsya v sootvetstvii s ukazannym promezhutkom vremeni.
OTLICHIE: hranyat dannye (vyschitannye znacheniya), v to vremya kak obychnye predstavleniya hranyat zaprosy.
privilegiya: create materialized view
* build immediate – srazu sozdayotsya v moment vypolneniya operatora
* start with – kogda vypolnitsya v pervyj raz
* next – kogda vypolnitsya v  sleduyushchij raz (1/1440 = 1/24*60 = minuta)
(start with – next = periodichnost) COMMIT !!!!

Create materialized view …. Build immediate refresh complete start with to_date .. next to_date … as select .. from … ;
');

insert into dba_help(sos) values ('Sinonim – sposob obrashchatsya k obyektu BD bez ukazaniya obyazatelnoj polnoj identifikacii obyekta (host – ekzemplyar – vladelec – obyekt)
* chastnyj prinadlezhit yuzeru, kotoryj ego sozdal
* publichnyj ispolzuetsya sovmestno vsemi yuzerami BD (poluchaetsya dobavleniem slova public pri sozdanii)
privilegiya: create (public) synonym
slovar: dba.synonyms
mozhet ukazyvat na: tablicu, proceduru, funkciyu, posledovatelnost, predstavlenie, pakety, obyekty v lokalnoj/udalyonnoj BD
primer: create synonym T1 for svvcore.teacher;
');

insert into dba_help(sos) values ('Procedure Language extensions to SQL
Osnovnoj yazyk dlya programmirovaniya hranimyh procedur (stored procedure)
Integrirovan s BD Oracle
(bystroe pereklyuchenie mezhdu dvizhkami PL/SQL i SQL)
Mozhet kak interpretirovatsya tak i kompillirovatsya

YAzyk PL/SQL pozvolyaet opredelyat sleduyushchie tipy imenovannyh blokov:
•	procedury;
•	funkcii;
•	obyekty;
•	pakety.

Imperativnyj
OOP

Obyektnye tipy
');


insert into dba_help(sos) values ('Sinonim – sposob obrashchatsya k obyektu BD bez ukazaniya obyazatelnoj polnoj identifikacii obyekta (host – ekzemplyar – vladelec – obyekt)
* chastnyj prinadlezhit yuzeru, kotoryj ego sozdal
* publichnyj ispolzuetsya sovmestno vsemi yuzerami BD (poluchaetsya dobavleniem slova public pri sozdanii)
privilegiya: create (public) synonym
slovar: dba.synonyms
mozhet ukazyvat na: tablicu, proceduru, funkciyu, posledovatelnost, predstavlenie, pakety, obyekty v lokalnoj/udalyonnoj BD
primer: create synonym T1 for svvcore.teacher;
');


insert into dba_help(sos) values ('Net imeni (zagolovka) – anonimnyj blok
Est – procedura/funkciya
IS
Razdel obyavlenij – ne obyazatelen – obyavlyaet peremennye
BEGIN
Ispolnyaemyj razdel – obyazatelen, hot odin
EXCEPTION
Razdel isklyuchenij – ne obyazatelen
END;
Anonimnyj blok – ne mozhet byt vyzvan iz drugogo bloka
Ispolzuetsya kak skript dlya vypolneniya PL/SQL
Prostejshij sostoit iz komandy null (ne delaet nichego, ispolzuetsya kogda specialno hotim pokazat, chto gasim vsyakuyu deyatelnost)
* ne chuvstvitelen k registru
Imenovannye bloki – procedury i funkcii
when others – obrabotka lyubogo isklyucheniya
sqlerrm – funkciya, kotoraya vozvrashchaet soobshchenie ob oshibke
sqlcode – funkciya, kotoraya vozvrashchaet № oshibki (obychno 5-znachnyj)
blokov when skolko ugodno, samyj poslednij – when others

Bloki mogut byt vlozheny drug v druga
');


insert into dba_help(sos) values ('Tipy dannyh:
- skalyarnye	simvol/stroka, chislo, bulevoe, data/vremya
- ssylochnye
- sostavnye
- big obyekty
Konstanty: s pom constant
');


insert into dba_help(sos) values ('NLS – National Language Support
National Languages Support (NLS) – eto arhitektura podderzhki nacionalnyh yazykov Oracle, pozvolyayushchaya hranit, obrabatyvat i vybirat dannye na nacionalnom yazyke. Ona obespechivaet, chtoby utility bazy dannyh, soobshcheniya ob oshibkah, soglasheniya po poryadku sortirovki, date, vremeni, denezhnye, chislovye i kalendarnye soglasheniya avtomaticheski adaptirovalis k nacionalnym yazykam i lokalnym nastrojkam klientskoj mashiny (locale).

* mozhet hranit dannye mnozhestva nacionalnyh yazykov, ispolzuya Unicode ili specialnye kodirovki (character set)
* simvoly hranyatsya kak kody simvolov, zavisyat ot vybrannogo nabora
* v odnoj BD mb 2 nabora: osnovnoj i dopolnitelnyj
* ustanavlivaetsya pri sozdanii BD
* izmenennie: alter database (national) character set
* krome simvolov alfavita v nabor vhodyat znaki prepinaniya, chisla, $...

osnovnye nabory simvolov dlya:
- hran char, varchar2, clob, long
- opisaniya imen obyektov, peremennyh
- vvod i hranenie pl/sql modulej
dop nabor simvolov dlya:
- hraneniya nchar, nvarchar2, nlob

peremennaya okruzheniya NLS_LANG = lang_territory.charset
	lang – imena mesyacev, dnej, napravl teksta : po umolch american
	territory – nastrojka kalendarya, format daty, deneg
	charset – otobrazhenie simvolov, zaglavnyh bukv, 
slovari: nls_ [session | instance | database] _parameters

Semantika simvolov:
* bajtovaya – rassm stroki kak posledovatelnost bajtov (po umolchaniyu)
* simvolnaya – rassmatrivaet stroki kak posledovatelnost simvolov
zadaetsya nls_length_semantics
');


insert into dba_help(sos) values ('Tip peremennoj osnovan na izvestnoj sisteme dannyh.');


insert into dba_help(sos) values ('Lokalnyj programmiruemyj modul – procedura/funkciya, opredelyonnaya v sekcii deklaracii pl/sql bloka
Lokalnye procedury i funkcii:
	*ih obyavlenie dolzhno byt v konce sekcii deklariruemyh posle vsekh tipov, zapisej, kursorov, peremennyh i isklyuchenij
	*mb ispolzovany tolko v ramkah bloka, v kotorom oni obyavleny
	*mb peregruzheny (raznoe chislo parametrov, drugoj tip programmnogo modulya, drugosemejstvo parametrov	
	Lokalnaya procedura:
	Lokalnaya funkciya:
Parametry in, out i in out ispolzuyutsya kak pri sozdanii procedur, tak i funkcij. 
In - konstanta, po vyhodu ne izmenyaetsya
Out- peredayotsya kak null, vozvrashchaet znachenie
In Out - peredayotsya kak znachenie, vozvrashchaet znachenie
Glavnoe razlichie mezhdu proceduroj i funkciej v tom, chto funkciya prednaznachena dlya vozvrata znacheniya, kotoroe mozhet ispolzovatsya v bolee krupnom SQL-Operatore.
');


insert into dba_help(sos) values ('Zapis – struktura dannyh, sostavlennaya iz neskolkih chastej informacii - polej.
Tipy zapisej:
	*tablichnye
	*kursornye
	*programmno-opredelennye
Obyavlenie zapisej:
*na osnovanii tablicy (%rowtype)
	declare
		one_book books%rowtype;
*na osnovanii kursora (cursor + %rowtype)
	declate cursor myc is
		select * from books where author like �?%Fadeev%’;
	one_curs mycc%rowtype;
*zapis opredelyaemaya programmistom:
Vlozhennye zapisi – odno iz polej vneshnej zapisi v dejstvitelnosti yavlyaetsya polem drugoj zapisi.
');

insert into dba_help(sos) values ('Kak i vo vsekh yazykah programmirovaniya, v PL/SQL imeyutsya operatory ciklov. 
Ih tri osnovnyh tipa: 
1.	Bezuslovnye cikly (vypolnyaemye beskonechno)
2.	Interaktivnye cikly (FOR)
3.	Uslovnye cikly (WHILE)
Samyj prostoj tip cikla v yazyke PL/SQL takov:
LOOP NULL; END LOOP
No ispolzovat takoj cikl net smysla, da i dlya ekzemplyara BD eto ne 
bezopasno. Dlya etogo neobhodimo ispolzovat opredelennye puti vyhoda iz ciklov. 
Ih to zhe tri: 
1.	EXIT - Bezuslovnyj vyhod iz cikla. Ispolzuetsya posredstvom 
primeneniya operatora IF.
2.	EXIT WHEN - Vyhod pri vypolnenii usloviya.
3.	GOTO - Vyhod iz cikla vo vneshnij kontekst.

Operator IF
1)if … then … end if;
2)if … then … else … end if;
3)if … then … elseif …then …(elseif … then …) … else … end if;

Operator CASE
case x
	when … then …;
	when … then …;
	when x between 13 and 20 then ….;
	else ….;
end case;
Otlichie: v pervom vybiraem znachenie i sravnivaem ego s chem-to. Vo vtorom – proveryaem usloviya.

Cikly loop, for, while
');

insert into dba_help(sos) values ('Kursor – obyekt BD, pozvolyayushchij rabotat s zapisyami postrochno
Kursor Oracle – ukazatel na oblast v PGA, v kotoroj hranyatsya: stroki zaprosa, chislo strok, ukazatel na razobannyj zapros v obshchem pule
* mozhet vozvrashchat 1/0/nesk strok
* dlya povtornogo sozdaniya rezultiruyushchego nabora dlya drugih znachenij parametrov, kursor nado zakryt i otkryt
Oshibki neyavnogo kursora:');

insert into dba_help(sos) values ('Atributy:
%ISOPEN – otkryt li (u neyavnogo vsegda false)
%FOUND – true, esli stroki byli vstav/ud/vybrany
%NOTFOUND – naoborot
%ROWCOUNT - № tekushchej stroki

yavnye kursory s parametrami:
cursor cur (capacity int)
	is select * from aud where cap > capacity
begin
	for aum in cur(80)
	loop …output… end loop;
');

insert into dba_help(sos) values ('Kursornye peremennye – struktury dannyh, ukazyvayushchie na kursornyj obyekt
- dlya peredachi kursora v kachestve parametra
- chtoby otlozhit svyaz kursora s SELECT-zaprosom do vypolneniya OPEN
Parametry instansa
cursor_space_for_time = {TRUE|FALSE} 
TRUE – bolshij obyem pamyati dlya kursorov i nikogda ne osvobozhdaetsya.  Primenyaetsya dlya uvelicheniya skorosti raboty kursorov pri nalichii pamyati dlya  razdelyaemogo pula.    
cursor_sharing = {EXACT|SIMILAR|FORCE}
open_cursors  - maksimalnoe kolichestvo otkrytyh kursorov. 
session_cached_cursors – maksimalnoe kolichestvo keshiruemyh  kursorov
');

insert into dba_help(sos) values ('Esli vy planiruete obnovlyat ili udalyat zapisi, na kotorye ssylaetsya operator SELECT FOR UPDATE, vy mozhete ispolzovat operator WHERE CURRENT OF.
·	Operator WHERE CURRENT OF pozvolyaet obnovit ili udalit zapis, kotoraya byla v kursore poslednej.
Izmenyat mozhno dannye (esli idyom po view)
1) ne sostavnye
2) ne vychislyaemye
Esli planiruetsya obnovlyat/udalyat zapisi, na kotorye ssylaetsya SELECT FOR UPDATE:
update  tabl  set … where current of imya kursora
delete from tabl where current of imya kursora
eto pozvolyaet obnovit/udalit zapis, kotoraya byla v kursore poslednej
');

insert into dba_help(sos) values ('- execute immediate – odnostrochnye zaprosy i ddl-komandy
- open for, fetch, close – dinamicheskie mnogostrochnye zaprosy
* dlya uluchsheniya proizvoditelnosti vypolneniya sql-vyrazhenij mogut ispolzovatsya dinamicheskie kursory so svyazannymi peremennymi
* pozvolyaet povtorno ispolzovat razobrannye SQL-vyrazheniya iz razdelyaemogo pula
Sut v chyom: strokoj podgotavlivaem kursor dlya vypolneniya i cherez execute immediate vyzyvaem ego.
Takzhe dinamicheskie kursory mozhno otkryt konstrukciej OPEN cur FOR �?*CUR_DECLARATION*’
');

insert into dba_help(sos) values ('Psevdostolbcami v Oracle prinyato nazyvat stolbcy, kotorye otsutstvuyut v tablicah v yavnom vide, no mogut byt ispolzovany v zaprosah.
ROWID – psevdostolbec, yavlyayushchijsya unikalnym identifikatorom stroki.
	*unikalnyj ne tolko v ramkah tablicy, no i v ramkah BD.
	*uproshchaet rabotu s BD, t.k.pozvolyaet odnomu znachniyu identificirovat lyubouyu stroku tablicy, chto pozvolyaet udalyat/izmenyat stroki tablic bez pervichnogo klyucha.
	*poisk po rowid – samyj bystryj
	!nelzya primenyat pri razrabotke prilozhenij, raschityvat na rabotu s BD drugih tipov.
ROWNUM – psevdostolbec, kotoryj umeet numerovat stroki v vozvrashchaemyh rezultatah.
	!nelzya napryamuyu ispolzovat v zaprose (vernet oshibku)
	*pozvolyaet vvodit ogranichenie na kolichestvo vyvodimyh zapisej
			select * from students where rownum < 10;
');

insert into dba_help(sos) values ('Isklyuchitelnaya situaciya – sobytie, voznikayushchiee v programme i trebuemoe nezamedlitelnoj obrabotki
1)	programmno-opredelyaemye
2)	predopredelennye (standartnye)
Mozhno vyzvat isklyuchenie komandoj raise
Mozhno sozdavat svoi isklyucheniya
DECLARE my-exception EXCEPTION;
* sqlerrm – funkciya, vozvrashchaet soobshchenie ob oshibke
* sqlcode – funkciya, vozvrashchaet № oshibki
- oshibka, sgenerirovannaya serverom / prilozheniem / v rezultate dejstvij yuzera
Obrabotka isklyucheniya – perekhvat oshibki v sekcii isklklyuchenij
');

insert into dba_help(sos) values ('Oblast vidimosti isklyuchenij.Obrabotchik isklyuchenij obrabatyvaet ili pytaetsya obrabotat tolko isklyucheniya porozhdennye v vypolnyaemoj sekcii bloka PL/SQL. Isklyucheniya, generiruemye v obyavlenii ili v sekcii isklyuchenij, avtomaticheski peredaetsya vneshnemu bloku. Mozhno ogranichit oblast vidimosti isklyucheniya, pomestiv kod PL/SQL v otdelnyj blok s sobstvennoj sekciej obrabotki isklyuchenij.
Rasprostranenie isklyuchenij – process peredachi isklyuchenij ot odnogo bloka drugomu, esli isklyuchenie ne bylo obrabotano
raise_appl_error – komanda, perekhvatyvaet vypolnenie tekushchego bloka
- opredelena v pakete dbms_standart
- mozhno prisvoit soobshch ob oshibke
Procedura RAISE_APPLICATION_ERROR ()
Procedura RAISE_APPLICATION_ERROR - eto eshche odin sposob vozbuzhdeniya isklyuchitelnoj situacii, kotoryj ne trebuet predvaritelnogo obyavleniya i mozhet byt vyzvan v lyubom meste bloka. Sintaksis procedury i primer ee ispolzovaniya.
RAISE_APPLICATION_ERROR    (nomer_oshibki,    soobshchenie, TRUE|FALSE]);
Pri oshibke vypolnenii procedury:
- vypolnenie bloka preryvaetsya
- izmenenie v argumentah in out / out otkatyvaetsya
- izmenie v globalnoj strukture ne otkatyvaetsya – nado delat yavno rollback
');

insert into dba_help(sos) values ('Vstroennye funkcii:
*chislovye funkcii (round, cos/sin, mod, sqrt, power ……)
*simvolnye funkcii (ascii, asciistr, concat, initcap (1 zaglavn))
*po rabote s datami (current_date, sysdate, dbtimezone, localtimestamp…)
*konvertirovanie (convert, to_number, to_date, to_char)
*obrabotki oshibok (sqlerrm (soobshch.ob oshibke), sqlcode (nomer oshibki))
Dlya strok:
*rpad (str1, x, str2) – vozvrashchaet pervuyu stroku dopolnennuyu sprava vtoroj strokoj do razmera h
*rtrim (str1, str2) – vozvrashchaet pervuyu stroku, v kotoroj udaleny pravye krajnie vtorye stroki.
*upper (str) – vse simvoly propisnye
Dlya daty:
*trunc (d, [format]) – vozvrashchaet datu d, usechennuyu do edinic ukazannyh v formate
*sysdate – tekushchaya data i vremya
');

insert into dba_help(sos) values ('Regulyarnye vyrazheniya – yazyk poiska i osushchestvleniya manipulyacij s podstrokoj v tekste, osnovannyj na ispolzovanii metasimvolov.
*REGEXP_LIKE vybiraet vse stroki, sootvetstvuyushchie zadannomu shablonu 
*REGEXP_INSTR opredelyaet mestopolozhenie vhozhdeniya shablona v stroku
*REGEXP_REPLACE zamenyaet shablon vyrazheniya na zadannyj
*REGEXP_SUBSTR vydelyaet iz stroki shablon
*REGEXP_COUNT opredelyaet kolichestvo vhozhdenij
Metasimvoly privyazki:
metas	opisanie	primer	Rez-t
^	K nachalu stroki	REGEXP_LIKE(str,’^t’)	test11 => true
11123345 => f
$	K koncu stroki	REGEXP_LIKE(str,’$5’)	test11 => false
11123345 => true
Kvantifikatora + operatory povtora
*	Vstrech.0+	REGEXP_REPLACE(str, �?11*’, �?1’)	test11 => test1
?	0/1		
+	1+	REGEXP_LIKE(str,’5+’)	test11 => false
{m}	m raz	REGEXP_LIKE(str,’3{2}’)	11123345 => true
{m,}	po krajne mere m		
{m,n}	Ot m do n		
……..
');

insert into dba_help(sos) values ('Kollekciya – struktura dannyh, kotoraya soderzhit elementy odnogo tipa.
	*element kollekcii – kak skalyarnaya velichina, tak i kompozitnye dannye.
	*elementy kotorye mozhno sravnivat mezhdu soboj na ekvivalentnost
	*mozhno peredat parametrom
	*odnomernaya, no mozhno sozdat kollekcii kollekcij
Tipy kollekcij: vlozhennye tablicy, massivy, associativnye massivy.
Kollekciya sostiot iz nabora elementov, pri chem kazhdyj element nahoditsya v opredelyonnoj pozicii (imeet indeks elementa)
Neobhodimo obyavit tip kollekcii – komandoj type
Neobhodim obyavit kollekciyu – peremennuyu etogo tipa dlya dalnejshego ispolzovaniya.
Ogranicheniya Kollekcii - esli zaranee opredelit granicy vozmozhnyh znachenij indeksov ee elementov, 
inache – neogranichennaya
Kollekciya tipa varray vsegda ogranichennaya
Vlozh tablicy i associativnye massivy – neogranichennaya
Plotnaya kollekciya – vse ee elementy opredeleny i kazhdomu iz nih prisvoeno nekotoroe znachenie (v t.ch.null)
		*Massivy VARRAY vsegda yavlyayutsya plotnymi
		*Vlozhennye tablicy pervonachalno vsegda plotnye, no po mere udaleniya nekotoryh elementov stanovyatsya razrezhennymi
		*Asociativnye massivy mogut byt kak razrezhennymi, tak i plotnymi v zavisimosti ot sposoba ih zapolneniya
Podobno dvum drugim tipam kollekcij, massivy peremennoj dliny yavlyayutsya odnomernymi kollekciyami, sostoyashchimi iz odnorodnyh elementov.
·	Razmer vsegda ogranichen i massiv ne mozhet byt razrezhennym.
·	Maksimalnoe kolichestvo elementov ukazyvaetsya pri opredelenii tipa.
·	Mogut ispolzovatsya kak v PL\SQL, tak i v tablicah.
·	Poryadok elementov pri sohranenii i izvlechenii, v otlichii ot vlozhennyh tablic, sohranyaetsya.
·	Indeks — polozhitelnoe chislo ot 1 do 2,147,483,647
·	Nelzya udalit proizvolnyj element massiva
Massivy peremennoj dliny – odnomernye, svyazannye kollekcii odnotipnyh el-tov.
	*dostupny v ramkah pl/sql i  v BD;
	*yavlyayutsya plotnymi
');

insert into dba_help(sos) values ('Vlozhennye tablicy – odnomernye, nesvyazannye kollekcii odnotipnyh elementov;
Vlozhennuyu tablicu mozhno rassmatrivat kak odnomernyj massiv, v kotorom indeksami sluzhat znacheniya celochislennogo tipa. Vlozhennaya tablica mozhet imet pustye elementy, kotorye poyavlyayutsya posle ih udaleniya vstroennoj proceduroj DELETE. Kolichestvo elementov mozhet dinamicheski uvelichivatsya.
Maksimalnoe chislo strok vlozhennoj tablicy sostavlyaet 2 gigabajta.
	*dostupny v ramkah pl/sql i kak polya tablicy v BD
	*iznachalno plotnye, no mb stanovitsya razrezhennymi
	*obyavlenie:
			type collection_name is table of datatype; 
				*datatype – lyuboj dopustimyj tip pl/sql za isklyucheniem ger cursor;
Primer pl\sql koda s ispolzovanie vlozhennyh tablic:
·	inicializaciya, ispolzuya konstruktor
·	dobavlenie elementov cherez metod EXTEND
·	ispolzovanie metodov FIRST i LAST
');

insert into dba_help(sos) values ('Associactivnye massivy – odnomernye, neogranichennye (po maksimalnomu kolichestvu elementov pri sozdanii) kollekciya elementov
	*dostupny tolko v ramkah pl/sql
	*iznachalno razrezhennye, indeks mozhet prinimat neposledovatelnye znacheniya
	*pobodny hesh-tablicam
	*predstavlyayut soboj mnozhestvo par znachenij, odno soderzhitsya v massive, a drugoe sluzhit indeksom
			type array_name is table of datatype index by value;
Variant vlozhennoj tablicy, v kotoroj elementy mogut imet proizvolnye znacheniya indeksov, raspolozhennye v opredelennom poryadke.
Pozvolyaet rabotat so stolbcami kak s edinoj peremennoj — massivom.
YAvlyaetsya vremennoj formoj kollekcii, sushchestvuet v techenii sessii.
Drugoe nazvanie associativnyh massivov — indeksirovannye tablicy ili pl\sql tablicy.
Associativnyj massiv eto naibolee chasto ispolzuemyj vid kollekcii. Ego ne nado inicializirovat ili rasshiryat. V Oracle9i Database Release 2 i bolee pozdnih versiyah associativnye massivy mozhno indeksirovat ne tolko po chislam, no i po strokam.
');

insert into dba_help(sos) values ('- funkciya – vozvrazhaet znachenie (rezultat raboty) v vyzyvayushchuyu programmu
- procedura – imenovannyj modul, vypolnyaet odno ili neskolko vyrazhenij i mozhet prinimat / vozvrashchat znacheniya cherez spisok parametrov
- paket – nabor peremennyh, procedur i funkcij, svyazannyh funkcionalnym zamyslom, sostoit iz specifikacii i tela
- trigger – hranimaya procedura, kotoraya avtomaticheski zapuskaetsya pri sobytii, obychno svyazany s insert, update, delete v nekotoroj tablice
');

insert into dba_help(sos) values ('Procedura – imenovannyj modul, vypolnyayushchij odno ili neskolko vyrazhenij i mozhet prinimat / vozvrashchat znacheniya cherez spisok parametrov
Specifikaciya procedury (procedure specification) vklyuchaet v sebya imya procedury i opisanie ee vhodnyh i vyhodnyh dannyh.
Telo procedury (procedure body) — eto blok PL/SQL-koda.
Tipy parametrov:
* in – vhodnoj, chisto dlya chteniya, nelzya menyat
* out – pri vypolnenii ustanavlivaetsya v null
* in out – pri vypolnenii ostayutsya neizmennymi
Znachenie parametrov po umolchaniyu. kak i vse peremennye formalnye parametry procedury mogut imet znacheniya po umolchaniyu. V takom sluchae znachenie parametru, imeyushchemu takoe opredelenie mozhno ne peredavat. Esli zhe fakticheskij parametr vse-taki peredan, to prinimaetsya imenno ego znachenie.
Peredacha parametrov:
* pozicionnoe – kazhdoe znachenie v spiske argumentov vyzova stavitsya v sootvetstvie formalnomu parametru po poryadku : nn (23, name, surname)
* imenovannoe – yavno svyazyvayutsya argumenty pri vyzove s parametrami po imenam : 
nn (in_id => 23, out_name => name)
* mozhno kombinirovat oba metoda, poka pozicionnye stoyat sleva
Vyzov procedury:
conn -> procedures -> vybrat -> Run
exec procedure_name(param1, param2)
');

insert into dba_help(sos) values ('Funkciya – imenovannyj modul, vypolnyayushchij ot nulya vyrazhenij cherez frazu Return
ona takzhe imeet specifikaciyu i telo. Glavnoe razlichie mezhdu proceduroj i funkciej v tom, chto funkciya prednaznachena dlya vozvrata znacheniya, kotoroe mozhet ispolzovatsya v bolee krupnom SQL-Operatore.
Vyzov:
- v prisvoenii nachalnogo znacheniya peremennoj
- v vyrazhenii prisvoeniya
- v bulevom vyrazhenii
- v SQL zaprose
- kak argument v spiske parametrov drugoj funkcii / procedury
Deterministic – funkciya vozvrashchaet odno i to zhe znachenie pri vyzove s temi zhe parametrami
');

insert into dba_help(sos) values ('PAKET -  eto obyekt bazy dannyh, kotoryj gruppiruet logicheski svyazannye tipy, programmnye obyekty i podprogrammy  PL/SQL. Pakety obychno sostoyat iz dvuh chastej, specifikacii i tela, hotya inogda v tele net neobhodimosti.  
SPECIFIKACIYA paketa – eto interfejs s prilozheniyami; ona obyavlyaet tipy, peremennye, konstanty, isklyucheniya, kursory i podprogrammy, dostupnye dlya ispolzovaniya v pakete.   
TELO paketa – polnostyu   opredelyaet kursory i podprogrammy, tem samym realizuya specifikaciyu paketa.
V otlichie ot podprogramm, pakety nelzya vyzyvat, peredavat im parametry ili vkladyvat ih drug v  druga.  V ostalnom format paketa analogichen formatu podprogrammy:
Obrshchenie k elementu paketa:
Imya_paketa.element_paketa
Pakety – kollekciya pl/sql obyektov, sgruppirovannyh vmeste
* skrytie informacii
* obyektno-orientirovannyj dizajn
* postoyanstvo obyektov v tranzakciyah
* uluchshennaya proizvoditelnost
Specifikaciya paketa (package) – obyazatelno, soderzhit spisok obyektov dlya obshchego dostupa iz drugih modulej ili prilozheniya
Realizaciya (package body) – soderzhit ves programmnyj kod dlya realizacii procedur i funkcij iz specifikacii, privatnye obyekty i sekciyu inicializacii
');

insert into dba_help(sos) values ('Trigger – osobyj vid procedur, kotoryj srabatyvaet po zapuskayushchemu ih sobytiyu
Primenenie triggerov:
– dlya realizacii slozhnyh ogranichenij celostnosti bazy dannyh;
– dlya audita (kontrolya hranimoj i izmenyaemoj informacii – delnogo audita);
– dlya avtomaticheskogo opoveshcheniya programm o proizoshedshih sobytiyah;    
Vidy triggerov:
* po privyazannoesti obyektu: na tablicu, na predstavlenie
* po sobytiyam zapuska: insert, update, delete
* po oblasti dejstviyaviya: uroven operatora, uroven zapisi, sostavnye
* po vremeni srabatyvaniya: before (do zapisi v zhurnal), after (posle)
Urovni triggerov:
* for each row – srabatyvaet dlya kazhdoj izmenennoj stroki
* po umolch (operatornyj uroven) – srabatyvaet odin raz na triggernoe sobytie
Poryadok vyp:
* operatornye BEFORE
* dlya kazhdoj stroki BEFORE
* vypolenie operatora
* dlya kazhdoj stroki AFTER
* operatornyj AFTER
Predikaty triggerov:
create or replace trigger ..
after insert or update or delete on ..
begin
	if inserting then …
	elsif updating then …
	elsif deleting then …
Triggery zameshcheniya: INSTEAD OF – tolko dlya predstavlenij urovnya stroki! - pozvolyaet modificirovat vstavlyaemye dannye. Ostorozhno ne popast v rekursiyu.
Privilegii: 
- create (any) trigger
- alter any trigger
- drop any trigger
- administer database trigger – sozdat/izmenit/udalit sistemnye triggery
Vklyuchenie/ otklyuchenie triggerov
ALTER TRIGGER imya_triggera DISABLE; - otklyuchit trigger
ALTER TRIGGER imya_triggera ENABLE; - vklyuchit trigger
Psevdozapisi old i new.
old – psevdozapis, kotoraya soderzhit znacheniya vsekh stolbcov tablicy do nachala tranzakcii
new – psevdozapis, soderzhashchaya vse znacheniya vsekh stolbcov, kotorye budut pomeshcheny v tablicu pri zavershenii tekushchej tranzakcii
kak zapisyvaetsya :
:old.imya_stolbca
:new.imya_stolbca
Psevdozapisi new, old:
operaciya srabatyvaniya	OLD.column	NEW.column
insert	null	novoe znach
update	staroe znach	novoe znach
delete	staroe znach	null
');

insert into dba_help(sos) values ('Sekcionirovanie – metod, kotoryj pozvolyaet hranit segment dannyh v vide neskolkih segmentov.
	*povyshaet proizvoditelnost obrabatyvaemyh dannyh
	*uproshchaet upravlenie krupnymi obyektami dannyh
	*obespechivaet dopolnitelnuyu nadezhnost sistemy
Diapazonnoe (range) – sekcionirovanie, pri kotorom dlya kazhdoj sekcii opredelyayutsya diapazonnye znacheniya klyucha sekcionirovaniya.
	*klyuch mozhet prinimat znacheniya daty i vremeni, chisla, teksta
	! pri zagruzke novyh dannyh, neobhodimo postoyanno rasshcheplyat sekciyu maxvalue;
	*dlya zadaniya diapazona ispolzuetsya klyuchevoe slovo less than
Primer:
	create table T_RANGE( docnum number) partition by range(docnum)
(partition n1 values less than(10) tablespace t1,
partition n2 values less than(20) tablespace t2,
partition n3 values less than(30) tablespace t3);
Intervalnoe – pri zagruzke novyh dannyh v tablicu avtomaticheski sozdayutsya novye sekcii dlya novogo diapazona klyuchej.
	*novye sekcii budut sozdavatsya avtomaticheski (po pervoj operacii insert, ne popadayushchej v diapazon sekcij)
Hesh-sekcionirovanie pozvolyaet ravnomerno raspredelyat stroki mezhdu sekciyami, t.e. razbrosat stroki po raznym sekciyam i sdelat eti sekcii ravnovelikimi.
	!eto ne oznachaet, chto stroki raspredelyayutsya po sekciyayam sluchajnym obrazom
	create table T_HASH( doctype varchar2(5))
	partition by hash(doctype)
(partition p1 tablespace th1,
partition p2 tablespace th2)
Spisochnoe – pozvolyaet razbit tablicu po spisku konkretnyh znachenij
		*klyuch spisochnogo sekcionirovaniya mozhet byt tolko odnostolbcovym
		*default – opisyvaet vse znacheniya, ne popavshie v drugie spiski
		*null – mb klyuch.znach. (Klyuchevym znacheniem?)
Kompozitnoe  - dlya slishkom bolshih tablic – sekcionirovanie po dvum urovnyam (sekcii i podsekcii)
');

insert into dba_help(sos) values ('DBMS_JOB – podderzhka upravleniya zadaniyami
Zadanie – procedura, Pl-SQL blok, vneshnyaya procedura
 	*vypolnyaetsya v fonovom rezhime, nado zadat kolichestvo odnovremenno vypolnyaemyh processov
SUBMIT – sozdanie zadaniya
ISUBMIT – sozdanie zadaniya s zadannym nomerom
REMOVE – udalenie zadaniya iz ocheredi
RUN – nemedlennoe vypolnenie zadaniya v polzovatelskom seanse 
BROKEN – razrushenie zadaniya (16 raz esli ne smozhet vyponitsya, broknetsya samo po sebe)
INSTANCE – ukazanie ekzemplyara
NEXT_DATE – izmenenie vremeni vypolneniya
INTERVAL – izmenenie intervala vypolneniya
CHANGE – izmenenie parametrov zadaniya
WHAT – izmenenie zadaniya
DBMS_SCHEDULER
Schedule – raspisanie kogda vypolnyat? 
Program – programma, chto budem vypolnyat? 
Job – planovaya programma kak vypolnyat?');

insert into dba_help(sos) values ('- ustanavlivayutsya vo vremya ustanovki Oracle
- ispolzuyutsya dlya rasshireniya funkcionalnyh vozmozhnostej Oracle
- vladelec paketov – SYS
-	napisany na C ili plsql
Pakety APEX:
- apex – oracle application express – sreda razrabotki veb-prilozhenij
- apex_custom_auth – proverka podlinnosti upravleniya seansom
- apex_application – ispolzovanie globalnyh peremennyh
- apex_item – sozdanie elementov form na osnove sql-zaprosa
- apex_util – razlichnye utility sostoyaniya seansa, fajlov, avtorizacii …
Pakety DBMS:
- dbms_advanced_rewrite – perekhvat i zamena sql-zaprosov
- dbms_advisor – chast nabora ekspertnoj sistemy dlya resheniya problem proizvoditelnosti, svyaz s komponentami servera BD
- dbms_sqltune – sbor statistiki, ispolzuemoj pri analize proizvoditelnosti operatorov
-	dbms_appl_info – prisvoenie imeni processu dlya udobstva monitoringa i otladki 
-	dbms_crypto - kriptografiya
-	Dbms random
-	Dbms output
-	Dbms defer -  vyzov udalyonnyh procedur
');