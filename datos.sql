use placas;
INSERT INTO usuario VALUES(null,"usuarioDario","123456","dario_email@gmail.com"),(null,"usuarioMaria","asd123","maria_email@gmail.com"),(null,"usuarioMarcelo","abc123","marcelo_email@gmail.com"),
(null,"usuarioAgustina","123456","agustina_email@gmail.com"),(null,"usuariobelen","dsad2323","belen_gmail@gmail.com"),(null,"usuarioNicolas","777ttthg","nico@hotmail.com");

INSERT INTO cliente VALUES(337575625,"dario","gonzales",1),(257357562,"maria","ledesma",2),(157575625,"marcelo","gutierrez",3),(407547565,"agustina","salas",4),(2233764,"belen","torrez",5),(15323444,"nicolas","paes",6);
INSERT INTO pedido VALUES(null,1,"231111"),(null,2,"221111"),(null,3,"211111"),(null,4,"001111"),(null,1,"211213");
INSERT INTO proveedor VALUES(1,"criptoVentas","calle 20 numero 2323");
INSERT INTO producto VALUES(null,1,"nvidia3060",30,250000),(null,1,"nvidia3090",10,350000),(null,1,"amd5700",25,120000),(null,1,"amd6700xt",5,450000);
INSERT INTO detalle_pedido VALUES(null,1,2,3,1050000);
INSERT INTO detalle_pedido VALUES(null,2,3,5,600000);
INSERT INTO detalle_pedido VALUES(null,3,4,5,2250000);
INSERT INTO detalle_pedido VALUES(null,4,1,5,1250000);
INSERT INTO detalle_pedido VALUES(null,5,2,1,350000);


INSERT INTO chat VALUES(null,1,"hola necesito hacer una consulta sobre la placa xxx",231111);
INSERT INTO chat VALUES(null,1,"muchas gracias por todo",231111);
INSERT INTO chat VALUES(null,2,"hola como puedo saber cuanto cuesta el envio",221111);
INSERT INTO chat VALUES(null,2,"abrazos",221111);
INSERT INTO chat VALUES(null,3,"necesito que me contacten",201111);
INSERT INTO chat VALUES(null,3,"por favor urgente gracias",201111);
INSERT INTO rol VALUES(null,1,"admin","lectura y escritura");
INSERT INTO rol VALUES(null,2,"moderador","lectura y escritura");
INSERT INTO rol VALUES(null,3,"admin","lectura y escritura");
INSERT INTO rol VALUES(null,4,"admin","lectura y escritura");
INSERT INTO rol VALUES(null,5,"usuario","lectura");
INSERT INTO rol VALUES(null,6,"usuario","lectura");
INSERT INTO factura VALUES(null,337575625,1,"calle 21 numero 2222",241211),(null,257357562,2,"calle 22 numero 3333",221211);
INSERT INTO factura VALUES(null,257357562,2,"calle 22 numero 3333",221211);




