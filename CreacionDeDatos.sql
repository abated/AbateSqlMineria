CREATE SCHEMA placas;
USE placas;

CREATE TABLE usuario(
	id INT NOT NULL UNIQUE AUTO_INCREMENT, 
    nombre_usuario VARCHAR(30) NOT NULL UNIQUE,
    contrasenia_usuario VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY(id)
);


CREATE TABLE chat(
	id INT NOT NULL AUTO_INCREMENT UNIQUE, 
	id_usuario INT NOT NULL,
    mensaje VARCHAR(200) NOT NULL,
    fecha date NOT NULL,
    PRIMARY KEY(id),
	FOREIGN KEY(id_usuario) references usuario(id)
);

CREATE TABLE rol(
	id INT NOT NULL AUTO_INCREMENT UNIQUE, 
	id_usuario INT NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    permisos VARCHAR(100),
    PRIMARY KEY(id),
	FOREIGN KEY(id_usuario) references usuario(id)
);


CREATE TABLE pedido(
	id INT NOT NULL AUTO_INCREMENT, 
    id_usuario INT NOT NULL,
    fecha date,
    PRIMARY KEY(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE cliente(
    dni INT NOT NULL UNIQUE,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY(dni),
    FOREIGN KEY(id_usuario) references usuario(id)
);

CREATE TABLE proveedor(
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre VARCHAR(60) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE producto(
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
	id_proveedor INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    stock INT NOT NULL,
    precio INT NOT NULL,
    FOREIGN KEY(id_proveedor) references proveedor(id),
    PRIMARY KEY(id)
);

CREATE TABLE detalle_pedido(
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    subtotal INT NOT NULL,
    PRIMARY KEY(id),
	FOREIGN KEY(id_pedido) references pedido(id),
    FOREIGN KEY(id_producto) references producto(id)
);
CREATE TABLE factura(
	id INT NOT NULL AUTO_INCREMENT UNIQUE, 
	dni_cliente INT NOT NULL,
	id_detalle_pedido INT NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    fecha date NOT NULL,
    PRIMARY KEY(id),
	FOREIGN KEY(id_detalle_pedido) references detalle_pedido(id),
	FOREIGN KEY(dni_cliente) references cliente(dni)
);

/* Creacion tabla de auditoria para nuevos productos*/

create table NuevosProductos(
id_producto int primary key,
nombre_producto varchar(60),
precio int,
fecha date,
usuario varchar(30),
accion varchar(30)
);
/* Creacion tabla de auditoria para nuevos usuarios*/
create table NuevosUsuarios(
id_usuario int primary key,
nombre_usuario varchar(60),
email_usuario varchar(60),
fecha date,
usuario varchar(30),
accion varchar(30)
);
/* tabla de usuarios eliminados*/
create table UsuariosEliminados(
Usuario_eliminado varchar(60),
email_Eliminado varchar(60),
fecha date,
usuario varchar(30),
accion varchar(30)
);

/* tabla de usuarios eliminados*/
create table ProductosEliminados(
producto_eliminado varchar(60),
precio int,
fecha date,
usuario varchar(30),
accion varchar(30)
);

create or replace view listaPrecios AS
(select NOMBRE,PRECIO FROM producto);


create or replace view datosCliente AS
(select nombre,apellido,dni FROM cliente);


create or replace view usuarioCliente AS
select * 
from usuario
inner join cliente
on usuario.id = cliente.id_usuario;


create or replace view productoProveedor AS
select p.nombre as nombreProducto,pr.nombre as nombreproveedor
from producto p
inner join proveedor as pr
on p.id_proveedor = pr.id;


create or replace view PedidoUsuario AS
select u.nombre_usuario,u.email, p.id as idPedido, p.fecha
from pedido p
inner join usuario as u
on p.id = u.id;




 delimiter //
create function totalDescuentoId30(
valor1 int,valor2 int)
   returns int
   deterministic
   begin
      declare total int default 0;
      declare precio1 int;
      declare precio2 int;
      select precio into precio1 from producto where id=valor1;
	  select precio into precio2 from producto where id=valor2;
      
 set total = (precio1+precio2)*(1-0.3);

return total;
end//


delimiter //
create function PreciosId(
   idProducto int)
   returns int
   deterministic

begin
      declare precios int default 0;
      select precio into precios from producto where id=idProducto;

      return precios;
      
 
 end //
 
 
 delimiter //
create function agregarCliente(
nombreUsuario varchar(30),contraseniaUsuario varchar(30),emailUsuario varchar(30))
   returns varchar(30)
   deterministic
   begin
   INSERT INTO usuario(nombre_usuario,contrasenia_usuario,email) VALUES(nombreUsuario,contraseniaUsuario,emailUsuario);
   
   return "Usuario agregado correctamente";

end//



DELIMITER $$
CREATE PROCEDURE `ordenarTabla`(IN campo varchar(30))
BEGIN
	IF campo <> '' THEN
		SET @orderProducto = concat('ORDER BY ', campo);
	ELSE
		SET @orderProducto = '';
	END IF;
    
    SET @clausula = concat('SELECT * FROM producto ', @orderProducto);
	PREPARE runSQL FROM @clausula;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END
$$


DELIMITER //

CREATE PROCEDURE `actualizarPrecio`(IN productoActualizar varchar(30),in porcentaje int)
BEGIN
		
		SET @productos = concat('update producto set precio = precio*1.',porcentaje,' where nombre = ',"'", productoActualizar,"'");
		
	PREPARE runSQL FROM @productos;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END//


DELIMITER //
create trigger `NuevosProductos`
after insert on `producto`
for each row
insert into `NuevosProductos`(id_producto,nombre_producto,precio,fecha,usuario,accion) values (new.id,new.nombre,new.precio,now(),system_user(),'insert');
//




DELIMITER $$
create trigger `UsuarioEliminado`
after delete on `usuario`
for each row
insert into `UsuariosEliminados`(Usuario_eliminado,email_Eliminado,fecha,usuario,accion) values (old.nombre_usuario,old.email,now(),system_user(),'delete');
$$
DELIMITER $$
create trigger `NuevosUsuarios`
after insert on `usuario`
for each row
insert into `NuevosUsuarios`(id_usuario,nombre_usuario,email_usuario,fecha,usuario,accion) values (new.id,new.nombre_usuario,new.email,now(),system_user(),'insert');
$$

DELIMITER $$
CREATE TRIGGER trigger_check_usuario_before_insert
BEFORE INSERT ON usuario 
FOR EACH ROW
BEGIN
	
  IF new.id <= -1 THEN
   set NEW.id = null;
  END IF;
END$$


DELIMITER $$
CREATE TRIGGER trigger_check_producto_before_insert
BEFORE INSERT ON producto 
FOR EACH ROW
BEGIN
	
  IF new.id <= -1 THEN
   set NEW.id = null;
  END IF;
END$$


DELIMITER $$
create trigger `ProductoEliminado`
after delete on `producto`
for each row
insert into `ProductosEliminados`(producto_eliminado,precio,fecha,usuario,accion) values (old.nombre,old.precio,now(),system_user(),'delete');
$$

