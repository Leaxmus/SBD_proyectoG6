create database transporte;
use transporte;

create table gerentes_almacen(
	cedula int PRIMARY KEY,
    primer_nombre varchar(50),
    segundo_nombre varchar(50),
    primer_apellido varchar(50),
    segundo_apellido varchar(50),
    telefono varchar(20),
    correo varchar(100)
);

-- TABLA DE GERENTE DE OPERACION
CREATE TABLE Gerentes_operaciones (
    cedula INT PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100)
);

CREATE TABLE Gerentes_ventas (
    cedula INT PRIMARY KEY,
    primer_nombre VARCHAR(50),
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50),
    segundo_apellido VARCHAR(50),
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

create table proveedores(
	id_proveedor int PRIMARY KEY,
    razon_social varchar(255),
    direccion varchar(255),
    telefono varchar(20),
    correo varchar(100)
);

-- TABLA DE PROOVEEDOR DE SEGURO 
CREATE TABLE Proveedores_seguro (
    ID_p_seguro INT PRIMARY KEY,
    razon_social VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    correo VARCHAR(100)
);

-- Tabla Conductor --
CREATE TABLE Conductores (
    cedula INT PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100) UNIQUE,
    licencia VARCHAR(50),
    experiencia VARCHAR(50)
);

-- Tabla Auxiliar --
CREATE TABLE Auxiliares (
    cedula INT PRIMARY KEY,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50),
    primer_apellido VARCHAR(50) NOT NULL,
    segundo_apellido VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100) UNIQUE
);

-- TABLA DE SEGURO
CREATE TABLE Seguros (
    ID_seguro INT PRIMARY KEY,
    valor DOUBLE NOT NULL,
    costo DOUBLE NOT NULL,
    ID_p_seguro INT, 
    FOREIGN KEY (ID_p_seguro) REFERENCES Proveedores_seguro(ID_p_seguro)
);

-- TABLA DE VEHICULO
CREATE TABLE Vehículos (
    placa VARCHAR(10) PRIMARY KEY,
    capacidad DOUBLE,
    datalogger VARCHAR(50),
    F_U_Mantenimiento DATETIME,
    ID_seguro INT, -- Clave foránea hacia Seguro
    FOREIGN KEY (ID_seguro) REFERENCES Seguros(ID_seguro)
);
-- TABLA DE VEHICULO REFRIGERADO (corregida)
CREATE TABLE Vehículos_Refrigerados (
    placa VARCHAR(10) PRIMARY KEY,
    capacidad DOUBLE,
    datalogger VARCHAR(50),
    F_U_Mantenimiento DATETIME,
    temperatura_max DOUBLE,
    temperatura_min DOUBLE,
    ID_seguro INT, -- Clave foránea hacia Seguro
    FOREIGN KEY (ID_seguro) REFERENCES Seguros(ID_seguro)
);

create table almacenes(
	id_almacen int PRIMARY KEY,
    capacidad double,
    direccion varchar(255),
    cedula int,
    constraint fk_cedula foreign key (cedula) references gerentes_almacen(cedula)
);

create table productos(
	id_producto int PRIMARY KEY,
    nombre varchar(255),
    descripcion varchar(255),
    tipo varchar(255),
    valor double(255,2),
    id_proveedor int,
    constraint fk_id_proveedor foreign key (id_proveedor) references proveedores(id_proveedor)
);

create table movimientos(
	id_ralmacen int primary key,
    fecha datetime,
    cantidad int,
    salida bit,
    id_almacen int,
    id_producto int,
    constraint id_almacen foreign key (id_almacen) references almacenes(id_almacen),
    constraint id_producto foreign key (id_producto) references productos(id_producto)
);

create table inventario(
	id_almacen int,
    id_producto int,
    cantidad int default 0,
    primary key(id_almacen, id_producto),
    foreign key (id_almacen) references almacenes(id_almacen),
    foreign key (id_producto) references productos(id_producto)
);

CREATE TABLE Clientes (
    ID_cliente INT PRIMARY KEY,
    razon_social VARCHAR(255),
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    correo VARCHAR(100),
    cedula INT,
    FOREIGN KEY (cedula) REFERENCES Gerentes_ventas(cedula)
);

create table unidades_trabajo(
	cedula_c int,
    cedula_a int,
    placa VARCHAR(10) null,
    placa_r VARCHAR(10) null,
    unique(cedula_c, cedula_a, placa, placa_r),
    foreign key (cedula_c) references conductores(cedula),
    foreign key (cedula_a) references auxiliares(cedula),
    foreign key (placa) references vehículos(placa),
    foreign key (placa_r) references vehículos_refrigerados(placa)
);

-- Tabla Ruta --
CREATE TABLE Rutas (
    ID_ruta INT PRIMARY KEY,
    hora_inicio DATETIME NOT NULL,
    hora_final DATETIME NOT NULL,
    distancia DOUBLE,
    estado bit default 0,
    cedula_c INT,
    cedula_a int,
    placa VARCHAR(10),
    placa_r varchar(10),
    cedula_operaciones INT,
    FOREIGN KEY (cedula_c, cedula_a, placa, placa_r) REFERENCES unidades_trabajo(cedula_c, cedula_a, placa, placa_r),
    FOREIGN KEY (cedula_operaciones) REFERENCES Gerentes_Operaciones(cedula)
);

-- Tabla Rutas_alternativas --
CREATE TABLE Rutas_alternativas (
    ID_ruta INT,
    ID_ruta_a INT,
    PRIMARY KEY (ID_ruta, ID_ruta_a),
    FOREIGN KEY (ID_ruta) REFERENCES Rutas(ID_ruta),
    FOREIGN KEY (ID_ruta_a) REFERENCES Rutas(ID_ruta)
);

CREATE TABLE Puntos_entrega (
    ID_p_entrega INT PRIMARY KEY,
    dirección VARCHAR(255)
);

CREATE TABLE Entregas (
    ID_entrega INT PRIMARY KEY,
    estado BIT,
    fecha_entrega DATETIME,
    firma BLOB,
    valor_total DOUBLE,
    ID_cliente INT,
    ID_p_entrega INT,
    ID_ruta int null,
    FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente),
    FOREIGN KEY (ID_p_entrega) REFERENCES Puntos_entrega(ID_p_entrega),
    foreign key (ID_ruta) references rutas(ID_ruta)
);

CREATE TABLE Detalles_entrega (
    ID_entrega INT,
    ID_producto INT,
    cantidad INT,
    PRIMARY KEY (ID_entrega, ID_producto),
    FOREIGN KEY (ID_entrega) REFERENCES Entregas(ID_entrega),
    FOREIGN KEY (ID_producto) REFERENCES Productos(ID_producto)
);

CREATE TABLE Reclamos (
    ID_entrega INT,
    ID_cliente INT,
    descripción VARCHAR(255),
    PRIMARY KEY (ID_entrega, ID_cliente),
    FOREIGN KEY (ID_entrega) REFERENCES Entregas(ID_entrega),
    FOREIGN KEY (ID_cliente) REFERENCES Clientes(ID_cliente)
);

-- Tabla Incidente --
CREATE TABLE Incidentes (
    ID_incidente INT PRIMARY KEY,
    fecha DATETIME NOT NULL,
    descripcion VARCHAR(255),
    ID_ruta int,
    cedula_c INT null,
    cedula_a int null,
    FOREIGN KEY (cedula_c) REFERENCES Conductores(cedula),
    foreign key (cedula_a) references auxiliares(cedula),
    foreign key (ID_ruta) references rutas(ID_ruta)
);
