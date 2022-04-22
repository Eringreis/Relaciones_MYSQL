

CREATE DATABASE register;
USE register;

##  Cambio de Zona de horario  ##
SET time_zone = "-03:00";

## Crear Tablas ##
CREATE TABLE usuario(
id_usuario int auto_increment not null,
nombre varchar(30),
apellido varchar(30),
password char(4) not null,
zona_horaria  TIMESTAMP DEFAULT NOW() NOT NULL,
genero varchar(10),
telefono varchar(20),
CONSTRAINT pk_id_usuario PRIMARY KEY(id_usuario)
);

CREATE TABLE registro(
id_ingreso int auto_increment not null,
id_usuario int not null,
fecha_hora TIMESTAMP DEFAULT NOW() NOT NULL,
CONSTRAINT pk_id_ingreso PRIMARY KEY(id_ingreso),
CONSTRAINT fk_id_usuario FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario)
);

## Cambio de Zona de horario ##
SET time_zone = "-02:00";

## Insertar registros ##

INSERT INTO usuario ( nombre, apellido, password, genero, telefono ) values ('JULIANA', 'GAVIRIA', '8541', 'Feminina', '+56959895644');
INSERT INTO registro ( id_usuario ) values(1);

CREATE TABLE contacto(
id_contacto int auto_increment not null,
id_usuario int not null,
telefono varchar(20),
email varchar(20) not null,
CONSTRAINT pk_id_contacto PRIMARY KEY(id_contacto)
);

ALTER TABLE contacto ADD CONSTRAINT fk_telefono FOREIGN KEY(id_usuario) references usuario(id_usuario);



##Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?##
# Con respecto al uso de varchar y char se usa correctamente ya que son datos de tipo string que no va generar ningun tipo de operacion de calculo.
# El tipo de Int se usar en cada uno de las primary key para facilitar la identificacion del registro.
# La fecha de registro en la tabla de Usuario y Registro se usa el formato TIMESTAMP para determinar la fecha y hora del registro ya que entrega mas detalles cronologicos.






 


