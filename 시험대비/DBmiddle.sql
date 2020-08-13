create user C##1594 IDENTIFIED by dbgood
default tablespace users
temporary tablespace temp;
alter user C##1594 default tablespace users quota unlimited on users;
grant create VIEW TO C##1594
grant connect, resource to C##1594

