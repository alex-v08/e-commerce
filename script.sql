-- Active: 1675285288439@@127.0.0.1@3306@db

CREATE TABLE categoria (
    id_categoria INTEGER auto_increment PRIMARY KEY
   ,descripcion VARCHAR(255));

CREATE TABLE proveedor (
    id_proveedor INTEGER auto_increment PRIMARY KEY
   ,empresa VARCHAR(255)
   ,contacto VARCHAR(255)
   ,direccion VARCHAR(255));

CREATE TABLE proveedor_categoria (
    id_proveedor_categoria INTEGER auto_increment PRIMARY KEY
   ,id_proveedor INTEGER
   ,id_categoria INTEGER);
ALTER TABLE proveedor_categoria ADD FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor);
ALTER TABLE proveedor_categoria ADD FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria);


CREATE TABLE producto (
    id_producto INTEGER auto_increment PRIMARY KEY
   ,descripcion VARCHAR(255)
   ,id_proveedor INTEGER
   ,id_categoria INTEGER
   ,precio_unitario DOUBLE
   ,unidades_stock INTEGER
   ,unidades_stock_minimo INTEGER
   ,unidades_stock_maximo INTEGER
   ,flg_discontinuo INTEGER);
ALTER TABLE producto ADD FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor);
ALTER TABLE producto ADD FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria);


CREATE TABLE reposicion(
            id_reposicion INTEGER auto_increment PRIMARY KEY
           ,id_producto INTEGER
           ,cantidad INTEGER
           ,fecha DATE);
ALTER TABLE reposicion ADD FOREIGN KEY (id_producto) REFERENCES producto (id_producto);

CREATE TABLE promocion (
            id_promocion INTEGER auto_increment PRIMARY KEY
           ,descripcion VARCHAR(255));


CREATE TABLE promocion_vigencia (
            id_promocion_vigencia INTEGER auto_increment PRIMARY KEY
           ,id_promocion INTEGER
           ,fecha_inicio DATE
           ,fecha_fin DATE);
ALTER TABLE promocion_vigencia ADD FOREIGN KEY (id_promocion) REFERENCES promocion (id_promocion);

CREATE TABLE promocion_producto (
            id_promocion_producto INTEGER auto_increment PRIMARY KEY
           ,id_producto INTEGER
           ,id_promocion_vigencia INTEGER 
           ,descuento DOUBLE);
ALTER TABLE promocion_producto ADD FOREIGN KEY (id_producto) REFERENCES producto (id_producto);
ALTER TABLE promocion_producto ADD FOREIGN KEY (id_promocion_vigencia) REFERENCES promocion_vigencia (id_promocion_vigencia);



-- USUARIO
CREATE TABLE usuario (
            id_usuario INTEGER auto_increment PRIMARY KEY
           ,username VARCHAR(255)
           ,password VARCHAR(255));


-- ORDEN / DETALLE / CLIENTE / EMPLEADO
CREATE TABLE tipo_cliente (
            id_tipo_cliente INTEGER auto_increment PRIMARY KEY
           ,descripcion VARCHAR(255));

CREATE TABLE cliente (    
            id_cliente INTEGER auto_increment PRIMARY KEY
           ,id_usuario INTEGER
           ,nombre VARCHAR(255)
           ,direccion VARCHAR(255)
           ,id_tipo_cliente INTEGER);
ALTER TABLE cliente ADD FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario);
ALTER TABLE cliente ADD FOREIGN KEY (id_tipo_cliente) REFERENCES tipo_cliente (id_tipo_cliente);
           

CREATE TABLE empleado (    
            id_empleado INTEGER auto_increment PRIMARY KEY
           ,nombre VARCHAR(255)
           ,id_jefe INTEGER);
ALTER TABLE empleado ADD FOREIGN KEY (id_jefe) REFERENCES empleado (id_empleado);


CREATE TABLE orden (
    id_orden INTEGER auto_increment PRIMARY KEY
   ,id_cliente INTEGER
   ,id_empleado INTEGER
   ,fecha_generada DATE
   ,fecha_entregada DATE);
ALTER TABLE orden ADD FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente);
ALTER TABLE orden ADD FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado);


CREATE TABLE detalle_orden (
    id_detalle_orden INTEGER auto_increment PRIMARY KEY
   ,id_orden INTEGER
   ,id_producto INTEGER
   ,cantidad INTEGER);
ALTER TABLE detalle_orden ADD FOREIGN KEY (id_orden) REFERENCES orden (id_orden);
ALTER TABLE detalle_orden ADD FOREIGN KEY (id_producto) REFERENCES producto (id_producto);



