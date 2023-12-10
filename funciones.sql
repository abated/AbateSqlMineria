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
select * from producto;
 
 delimiter //
create function agregarCliente(
nombreUsuario varchar(30),contraseniaUsuario varchar(30),emailUsuario varchar(30))
   returns varchar(30)
   deterministic
   begin
   INSERT INTO usuario(nombre_usuario,contrasenia_usuario,email) VALUES(nombreUsuario,contraseniaUsuario,emailUsuario);
   
   return "Usuario agregado correctamente";

end//
use placas;
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



      

 
 
 
 
 
 

