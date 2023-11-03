

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


