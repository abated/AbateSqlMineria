
/* Creacion tabla de auditoria para nuevos productos*/

create table NuevosProductos(
id_producto int primary key,
nombre_producto varchar(60),
precio int,
fecha date,
usuario varchar(30),
accion varchar(30)
);
/* Trigger despues de insertar un producto nuevo con datos de  id de producto,nombre,precio,fecha,usuario y accion*/
create trigger `NuevosProductos`
after insert on `producto`
for each row
insert into `NuevosProductos`(id_producto,nombre_producto,precio,fecha,usuario,accion) values (new.id,new.nombre,new.precio,now(),system_user(),'insert');

INSERT INTO producto VALUES(null,1,"NuevoProducto",30,500000);
select * from NuevosProductos;

/* Creacion tabla de auditoria para nuevos usuarios*/
create table NuevosUsuarios(
id_usuario int primary key,
nombre_usuario varchar(60),
email_usuario varchar(60),
fecha date,
usuario varchar(30),
accion varchar(30)
);
/* Trigger despues de insertar un usuario nuevo con datos de  id de usuario,email,usuario,fecha,usuario y accion*/
create trigger `NuevosUsuarios`
after insert on `usuario`
for each row
insert into `NuevosUsuarios`(id_usuario,nombre_usuario,email_usuario,fecha,usuario,accion) values (new.id,new.nombre_usuario,new.email,now(),system_user(),'insert');

/* tabla de usuarios eliminados*/
create table UsuariosEliminados(
Usuario_eliminado varchar(60),
email_Eliminado varchar(60),
fecha date,
usuario varchar(30),
accion varchar(30)
);
/* Trigger despues de eliminar un usuario con datos del usuario eliminado,email eliminado,fecha,usuario y accion*/
create trigger `UsuarioEliminado`
after delete on `usuario`
for each row
insert into `UsuariosEliminados`(Usuario_eliminado,email_Eliminado,fecha,usuario,accion) values (old.nombre_usuario,old.email,now(),system_user(),'delete');

select * from usuario;
delete from usuario where id=55;
select * from UsuariosEliminados;

INSERT INTO usuario VALUES(null,"usuarioNuevo3","123456","usuarioNuevo1@gmail.com"),(null,"usuarioNuevo4","asd123","usuarioNuevo2_email@gmail.com");

select * from NuevosUsuarios;
select * from usuario;

/* Creacion trigger para evitar crear un usuario con id <= 0*/
DELIMITER $$
CREATE TRIGGER trigger_check_usuario_before_insert
BEFORE INSERT ON usuario 
FOR EACH ROW
BEGIN
	
  IF new.id <= -1 THEN
   set NEW.id = null;
  END IF;
END$$


INSERT INTO usuario VALUES(-2,"NUEVO","123456","dario_email@gmail.com");

/* Creacion trigger para evitar crear un producto con id <= 0*/
DELIMITER $$
CREATE TRIGGER trigger_check_producto_before_insert
BEFORE INSERT ON producto 
FOR EACH ROW
BEGIN
	
  IF new.id <= -1 THEN
   set NEW.id = null;
  END IF;
END$$

INSERT INTO producto VALUES(0,1,"nvidia3032320",30,250000);
select * from producto;

/* tabla de usuarios eliminados*/
create table ProductosEliminados(
producto_eliminado varchar(60),
precio int,
fecha date,
usuario varchar(30),
accion varchar(30)
);

/* Trigger despues de eliminar un producto con datos del producto eliminado,fecha,usuario y accion*/
create trigger `ProductoEliminado`
after delete on `producto`
for each row
insert into `ProductosEliminados`(producto_eliminado,precio,fecha,usuario,accion) values (old.nombre,old.precio,now(),system_user(),'delete');
select * from producto;
delete from producto where nombre='NuevoProducto';
select * from producto;
select * from ProductosEliminados;

DROP TRIGGER ProductoEliminado;
DROP TRIGGER trigger_check_producto_before_insert;
DROP TRIGGER trigger_check_usuario_before_insert;
drop trigger NuevosUsuarios;
