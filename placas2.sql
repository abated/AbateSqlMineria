INSERT INTO usuario VALUES(null,"usuarioDario","123456","dario_email@gmail.com"),(null,"usuarioMaria","asd123","maria_email@gmail.com"),(null,"usuarioMarcelo","abc123","marcelo_email@gmail.com"),
(null,"usuarioAgustina","123456","agustina_email@gmail.com");

INSERT INTO cliente VALUES(35757565,"dario","abate",1),(25757562,"maria","ledesma",2),(15757565,"marcelo","gutierrez",3),(40757565,"agustina","salas",4);

INSERT INTO pedido VALUES(null,1,"231111"),(null,2,"221111"),(null,3,"211111"),(null,4,"001111");
INSERT INTO proveedor VALUES(1,"criptoVentas","calle 20 numero 2323");
INSERT INTO producto VALUES(null,);

CREATE TABLE producto(
    id INT NOT NULL AUTO_INCREMENT,
	id_proveedor INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    stock INT NOT NULL,
    precio INT NOT NULL,
    FOREIGN KEY(id_proveedor) references proveedor(id),
    PRIMARY KEY(id)
);



