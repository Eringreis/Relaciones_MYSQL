
   ##Crear Dase de datos
CREATE DATABASE TeLoVendo;

use TeLoVendo;

   ##Crear Tablas
CREATE TABLE proveedor (
	id int auto_increment,
    representante varchar(50),
    nombre_corporativo varchar(50),
    telefono varchar(20),
    categoria_id int not null,
    correo_electronico varchar(20) not null,
    CONSTRAINT pk_id_proveedor primary key(id)
    );
    
CREATE TABLE categoria(
id int auto_increment not null,
nombre varchar(100),
 CONSTRAINT pk_id_categoria primary key(id)
 );
 
 create TABLE cliente(
 id int auto_increment not null,
 nombre varchar(50),
 apellido varchar(50),
 direccion varchar(50),
  CONSTRAINT pk_id_cliente primary key(id)
  );
  

  create TABLE producto(
	id int auto_increment not null,
	nombre varchar(50) not null,
    precio float,
    color varchar(100),
    categoria_id int not null,
    stock int not null,
    proveedor_id int not null,
    CONSTRAINT pk_id_producto primary key(id),
    CONSTRAINT fk_categoria_id foreign key(categoria_id) references categoria(id),
    CONSTRAINT fk_proveedor_id foreign key(proveedor_id) references proveedor(id)
  );
  
  
   ##Insertar Registros a las tablas
  INSERT INTO categoria values(null, 'seguro');
  INSERT INTO proveedor values(null, 'IVÁN CORAL', 'Cisco Chile', '+5684529145', 4, 'CruzBlanca@gmail.com');
  INSERT INTO cliente values(null, 'OSCAR', 'CASTELLANOS', 'Estacion central 985');
  INSERT INTO producto values(null, 'ampolleta', 22000, 'blanco', 4, 2);
  
  
  Select * from cliente;
  select * from proveedor;
  select * from producto;
  select * from categoria;
  
  ##Cuál es la categoría de productos que más se repite
  select  categoria.nombre as 'Categoria', COUNT(producto.id) as 'Cantidad de productos' from categoria inner join producto ON categoria.id = producto.categoria_id GROUP BY categoria.nombre LIMIT 1;
  
  ##Cuáles son los productos con mayor stock
  select * from producto ORDER BY stock desc LIMIT 5;
  
  ##Qué color de producto es más común en nuestra tienda.
  select color, COUNT(id) from producto GROUP BY color ORDER BY COUNT(id) desc limit 1;
  
  ##Cual o cuales son los proveedores con menor stock de productos. 
  select proveedor.nombre_corporativo, SUM(producto.stock) from proveedor inner join producto ON proveedor.id = producto.proveedor_id GROUP BY proveedor.nombre_corporativo ORDER BY SUM(producto.stock) asc LIMIT 2;
  
  ##Cambien la categoría de productos más popular por ‘Electrónica y computación’.
  select categoria.nombre as 'Categoria' from producto inner join categoria ON producto.categoria_id= categoria.id Group By categoria.nombre limit 1;
  select  id from categoria where nombre = 'alimentos'; 
  UPDATE categoria set nombre = 'Electrónica y computación' where id = 2;
  select * from categoria;
  
  
  
  
  
  
  
  
  