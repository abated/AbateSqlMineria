CREATE SCHEMA placas;
USE placas;

CREATE TABLE usuario(
	id INT NOT NULL AUTO_INCREMENT, 
    nombre_usuario VARCHAR(30) NOT NULL,
    contrasenia_usuario VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE pedido(
	id INT NOT NULL AUTO_INCREMENT, 
    id_usuario INT NOT NULL,
    fecha date,
    PRIMARY KEY(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE cliente(
    dni INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    id_usuario INT NOT NULL,
    PRIMARY KEY(dni),
    FOREIGN KEY(id_usuario) references usuario(id)
);

CREATE TABLE proveedor(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    direccion VARCHAR(120) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE producto(
    id INT NOT NULL AUTO_INCREMENT,
	id_proveedor INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    cantidad INT NOT NULL,
    stock INT NOT NULL,
    precio INT NOT NULL,
    FOREIGN KEY(id_proveedor) references proveedor(id),
    PRIMARY KEY(id)
);

CREATE TABLE detalle_pedido(
    id INT NOT NULL AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    subtotal INT NOT NULL,
    PRIMARY KEY(id),
	FOREIGN KEY(id_pedido) references pedido(id),
    FOREIGN KEY(id_producto) references producto(id)
);



