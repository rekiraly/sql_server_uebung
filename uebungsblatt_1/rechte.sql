
create login kira with password = '1234',
check_policy=off
use dba1;
create user kira_dba1 for login kira;
create table table1 (id int);

insert into table1 values (1), (2);
select * from table1; 

select user_name();
select system_user;

use ma_famillienstand;
execute as login = 'kira';
select user_name();
select system_user;
select * from ma_famillienstand
revert;

use dba1

grant select on table1 to kira_dba1
select * from table1

insert into table1 values (5);
grant insert on table1 to kira_dba1
delete from table1
revert;

grant delete on table1 to kira_dba1
delete from table1 where id=2
revert;

delete from table1
select * from table1
revert;

revoke delete on table1 to kira_dba1
delete from table1 where id=3;

delete from table1 where id=3
revoke select on table1 to kira_dba1
select * from table1
insert into table1 values (23)

revoke insert on table1 to kira_dba1
select * from table1;
insert into table1 values (33);
delete from table1;
