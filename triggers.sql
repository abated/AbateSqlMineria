create table NuevosUsuarios(
id_usuario int primary key,
nombre_usuario varchar(60),
email_usuario varchar(60)
);
create trigger `NuevosUsuarios`
after insert on `usuario`
for each row
insert into `NuevosUsuarios`(id_usuario,nombre_usuario,email_usuario) values (new.id,new.nombre_usuario,new.email);

INSERT INTO usuario VALUES(null,"usuarioNuevo3","123456","usuarioNuevo1@gmail.com"),(null,"usuarioNuevo4","asd123","usuarioNuevo2_email@gmail.com");
INSERT INTO usuario VALUES(-2,"NUEVO","123456","dario_email@gmail.com");
select * from NuevosUsuarios;
select * from usuario;


DELIMITER $$
CREATE TRIGGER trigger_check_usuario_before_insert
BEFORE INSERT ON usuario 
FOR EACH ROW
BEGIN
	
  IF new.id <= -1 THEN
  
   set NEW.id = null;
  END IF;
END$$

DROP TRIGGER trigger_check_usuario_before_insert;