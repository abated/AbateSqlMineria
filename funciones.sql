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

      

 
 
 
 
 
 

