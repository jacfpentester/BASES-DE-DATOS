-- Crear la base de datos si no existe en caso de existir la borramos y la seleccionamoos
drop database if exists taller;
create database taller;
use taller;

-- Crear la tabla proveedor si no existe
create table if not exists proveedor(
    codigo int primary key not null unique,
    direccion varchar(50) not null,
    ciudad varchar(20) not null,
    provincia varchar (30) not null
);

-- Crear la tabla categoría si no existe
create table if not exists categoria(
    codigo int not null primary key unique,
    direccion varchar(50)
);

-- Crear la tabla pieza si no existe FK: categoria(codigo)
create table if not exists pieza(
    codigo int not NULL primary key unique,
    nombre varchar(50) not NULL,
    color varchar(10),
    precio decimal(5,2) not NULL,
	cod_categoria int not Null,
    constraint fk_categoria foreign key (cod_categoria) references categoria(codigo)
);

-- Crear la tabla proveedorSuministraPieza si no existe FK: proveedor(codigo) y pieza(codigo)
create table if not exists proveedorSuministraPieza(
    codigo_proveedor int not null,
    codigo_pieza int not null,
    fecha date not null,
    cantidad int,
	primary key (codigo_proveedor, codigo_pieza, fecha),
    constraint fk_proveedor foreign key (codigo_proveedor) references proveedor(codigo),
    constraint fk_pieza foreign key (codigo_pieza) references pieza(codigo)
);
