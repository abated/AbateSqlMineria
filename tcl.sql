USE placas;
SET AUTOCOMMIT = 0;


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

-- select * from cliente;
-- delete from cliente;
delete from producto where nombre ='producto8';
use placas;
start transaction;
INSERT INTO producto VALUES(null,1,"producto1",10,10000);
INSERT INTO producto VALUES(null,1,"producto2",10,10000);
INSERT INTO producto VALUES(null,1,"producto3",10,10000);
INSERT INTO producto VALUES(null,1,"producto4",10,10000);
savepoint productos_1;
INSERT INTO producto VALUES(null,1,"producto5",10,10000);
INSERT INTO producto VALUES(null,1,"producto6",10,10000);
INSERT INTO producto VALUES(null,1,"producto7",10,10000);
INSERT INTO producto VALUES(null,1,"producto8",10,10000);
savepoint productos_2;
select * from producto;
rollback to productos_1;
-- rollback;
-- commit; 
-- RELEASE savepoint productos_1;

