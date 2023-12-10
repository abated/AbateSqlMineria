

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

call placas.ordenarTabla('nombre');
call placas.ordenarTabla('id');
DELIMITER //

CREATE PROCEDURE `actualizarPrecio`(IN productoActualizar varchar(30),in porcentaje int)
BEGIN
		
		SET @productos = concat('update producto set precio = precio*1.',porcentaje,' where nombre = ',"'", productoActualizar,"'");
		
	PREPARE runSQL FROM @productos;
	EXECUTE runSQL;
	DEALLOCATE PREPARE runSQL;
END//

call placas.actualizarPrecio('nvidia3060', 50);
select precio from producto;



-- si no hay datos en la tabla cliente, se inserta 	INSERT INTO cliente VALUES(357575625,"dario","abate",1) ; 
-- si hay datos en la tabla cliente se elimina el cliente con el dni 157575625
use placas;
INSERT INTO cliente VALUES(35575622,"dario","abate",1),(257357562,"maria","ledesma",2),(157575625,"marcelo","gutierrez",3),(407547565,"agustina","salas",4);

DELIMITER $$
CREATE PROCEDURE `eliminar_o_insertar`()
BEGIN
start transaction;
	  IF exists(select * from cliente)
    THEN
    DELETE FROM
		cliente
		WHERE 
		dni = 157575625;

	ELSE
		INSERT INTO cliente VALUES(357575625,"dario","abate",1) ;
	END IF;
    
END
$$
call placas.eliminar_o_insertar();
-- si ejecutamos rollback y el store elimino a el registro con el dni 157575625, la eliminacion se anula
-- rollback;
-- si ejecutamos commit y el store elimino a el registro con el dni 157575625, la eliminacion se realiza
-- commit;

select * from cliente;
delete from cliente;
