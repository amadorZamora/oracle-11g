-- Execute as SYSTEM/oracle

-- create users
create user EXLTMGHOSTFT identified by EXLTMGHOSTFT;
create user EXLTMSGHOST identified by EXLTMSGHOST;
create user SRVLTMSGHOST identified by SRVLTMSGHOST;
create user EXPRICING identified by EXPRICING;
create user EXGEOGRA identified by EXGEOGRA;
create user ARUSER identified by ARUSER;
create user EXBITACO identified by EXBITACO;
create user EXCECOP identified by EXCECOP;

-- unlimit user quota
ALTER USER EXLTMSGHOST QUOTA UNLIMITED ON USERS;
ALTER USER EXPRICING QUOTA UNLIMITED ON USERS;
ALTER USER EXCECOP QUOTA UNLIMITED ON USERS;
ALTER USER EXGEOGRA QUOTA UNLIMITED ON USERS;
ALTER USER ARUSER QUOTA UNLIMITED ON USERS;
ALTER USER EXBITACO QUOTA UNLIMITED ON USERS;

-- create tablespaces
create tablespace EXLTMSGHOST_IDX datafile 'EXLTMSGHOST_IDX.dat' size 500M autoextend on;
create tablespace EXLTMSGHOST_DAT datafile 'EXLTMSGHOST_DAT.dat' size 500M autoextend on;

-- user grants
grant create session to EXLTMSGHOST;
grant create session to SRVLTMSGHOST;
grant create session to EXLTMGHOSTFT;
grant create session to EXPRICING;
grant create session to EXGEOGRA;
grant create session to ARUSER;
grant create session to EXBITACO;
grant create session to EXCECOP;
grant create sequence to EXLTMSGHOST;
grant create sequence to EXPRICING;
grant create sequence to EXGEOGRA;
grant create sequence to ARUSER;
grant create sequence to EXBITACO;
grant create sequence to EXCECOP;
grant create public synonym to EXLTMSGHOST;
grant create public synonym to EXPRICING;
grant create public synonym to EXGEOGRA;
grant create public synonym to ARUSER;
grant create public synonym to EXBITACO;
grant create public synonym to EXCECOP;
grant create table to EXLTMSGHOST;
grant create table to EXLTMGHOSTFT;
grant create table to EXPRICING;
grant create table to EXGEOGRA;
grant create table to ARUSER;
grant create table to EXBITACO;
grant create table to EXCECOP;
grant create view to EXLTMSGHOST;
grant UNLIMITED TABLESPACE TO EXLTMSGHOST;
grant UNLIMITED TABLESPACE TO EXLTMGHOSTFT;

COMMIT;
EXIT;
-- EOF