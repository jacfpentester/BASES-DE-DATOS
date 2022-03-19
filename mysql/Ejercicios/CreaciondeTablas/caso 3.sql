-- Crear la base de datos si no existe en caso de existir la borramos y la seleccionamoos
drop database if exists editorial;
create database editorial;
use editorial;

-- Crear la tabla sucursal si no existe
create table if not exists sucursal(
    codigo int primary key not null unique,
    direccion varchar(20) not null,
    telefono int(10) not null,
    ciudad varchar(20) not null,
	provincia varchar(20) not null
);

-- Crear la tabla revista si no existe
create table if not exists revista(
    numero_registro int primary key not null unique,
    titulo varchar(20) not null,
    tipo varchar(20) not null,
	perodicidad int not null -- tomo la fecha como entero de dias
);

-- Crear la tabla sucursal_publica_revista si no existe FK: sucursal(codigo), revista(numero_registro)
create table if not exists sucursal_publica_revista(
	codigo_sucursal int not null,
	numero_registro_revista int not null,
	primary key (codigo_sucursal, numero_registro_revista),
    constraint fk_codigo_sucursal_publica foreign key (codigo_sucursal) references sucursal(codigo),
    constraint fk_numero_registro_revista_publica foreign key (numero_registro_revista) references revista(numero_registro)

);

-- Crear la tabla periodista si no existe
create table if not exists periodista(
    id int primary key not null unique,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    telefono int(10),
    especialidad varchar(20)    
);

-- Crear la tabla periodista_escribe_revista si no existe FK: periodista(id), revista(numero_registro)
create table if not exists periodista_escribe_revista(
	id_periodista int not null,
	numero_registro_revista int not null,
	primary key (id_periodista, numero_registro_revista),
    constraint fk_idperiodista_escribe foreign key (id_periodista) references periodista(id),
    constraint fk_numero_registro_revista_escribe foreign key (numero_registro_revista) references revista(numero_registro)
);

-- Crear la tabla empleado si no existe FK: sucursal(codigo) 
create table if not exists empleado(
	id int not null,
    nif varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    telefono int(10),
    codigo_sucursal int not null,
    primary key (id),
	constraint fk_codigo_sucursal foreign key (codigo_sucursal) references sucursal(codigo) 
);

-- Crear la tabla seccion si no existe FK: revista(numero_registro) 
create table if not exists seccion(
	id int primary key not null,
    titulo varchar(20) not null,
    extension varchar(20) not null,
    numero_registro_revista int(10),
	constraint fk_numero_registro_revista foreign key (numero_registro_revista) references revista(numero_registro) 
);

-- Crear la tabla ejemplar si no existe FK: revista(numero_registro) 
create table if not exists ejemplar(
	id int primary key not null,
    numero_ejemplares int,
    numero_paginas int,
    fecha date,
    numero_registro_revista int(10),
	constraint fk2_numero_registro_revista foreign key (numero_registro_revista) references revista(numero_registro) 
);