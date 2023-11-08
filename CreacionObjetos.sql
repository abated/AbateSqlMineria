use placas;
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
