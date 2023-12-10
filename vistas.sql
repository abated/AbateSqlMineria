create or replace view listaPrecios AS
(select NOMBRE,PRECIO FROM producto);


create or replace view datosCliente AS
(select nombre,apellido,dni FROM cliente);


create or replace view usuarioCliente AS
select * 
from usuario
inner join cliente
on usuario.id = cliente.id_usuario;

create or replace view roles AS
select r.id_usuario, u.nombre_usuario
from rol r
inner join usuario as u
on r.id = u.id;

select * from roles;


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


create or replace view facturaCliente AS
select f.fecha, c.nombre, c.apellido, c.dni,dp.id_producto, dp.cantidad, dp.subtotal
from factura f
inner join cliente c
on f.dni_cliente = c.dni
INNER JOIN detalle_pedido dp
ON f.id_detalle_pedido = dp.id;














