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










