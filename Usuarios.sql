use mysql;
select * from user;
show tables;
use mysql;
select * from mysql where user  like "root@localhost";
/* creacion de usuario de lectura con pw 1234*/
CREATE USER lectura@localhost IDENTIFIED BY '1234';
SELECT * FROM mysql.user WHERE user LIKE 'lectura';
/* visualizar permisos del usuario lectura*/
SHOW GRANTS FOR lectura@localhost;
/* otorgando permisos de lectura a todas las tablas del schema placas*/
GRANT select ON placas.* TO lectura@localhost;
/* visualizar permisos del usuario lectura despues de otorgarle permisos*/
SHOW GRANTS FOR lectura@localhost;
/* creacion de usuario de escritura con pw 1234*/
CREATE USER escritura@localhost IDENTIFIED BY '1234';
/* otorgando permisos  de usuario de escritura insercion y actualizacion con pw 1234*/
GRANT select,insert,update ON placas.* TO escritura@localhost;
/* visualizar permisos del usuario escritura,inserccion y actualizacion despues de otorgarle permisos*/
SHOW GRANTS FOR escritura@localhost;
