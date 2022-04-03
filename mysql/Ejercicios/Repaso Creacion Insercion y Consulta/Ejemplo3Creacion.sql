-- Crear la base de datos
drop database if exists revista;
create database revista;
use revista;

-- Crear la tabla sucursal si no existe
create table if not exists sucursal(
    codigo int,
    direccion varchar(50),
    telefono int,
    ciudad varchar(10),
    provincia varchar(10),
    constraint pk1 primary key (codigo)
);

-- Crear la tabla empleado si no existe
create table if not exists empleado(
    id int,
    nif varchar(15),
    nombre varchar(15),
    apellido1 varchar(15),
    apellido2 varchar(15),
    telefono int,
    codigo_sucursal int,
    constraint pk2 primary key (id),
    constraint fk1 foreign key (codigo_sucursal) references sucursal(codigo) ON UPDATE CASCADE
);

-- Crear la tabla revista si no existe
create table if not exists revista(
    numero_registro int,
    titulo varchar(15),
    tipo varchar(10),
    periodicidad varchar(10),
    constraint pk3 primary key (numero_registro)
);

-- Crear la tabla sucursal_publica_revista si no existe
create table if not exists sucursal_publica_revista(
    codigo_sucursal int,
    numero_registro_revista int,
    constraint pk4 primary key (codigo_sucursal,numero_registro_revista),
    constraint fk2 foreign key (codigo_sucursal) references sucursal(codigo) ON UPDATE CASCADE,
    constraint fk3 foreign key (numero_registro_revista) references revista(numero_registro) ON UPDATE CASCADE
);

-- Crear la tabla periodista si no existe
create table if not exists periodista(
    id int,
    nombre varchar(15),
    apellido1 varchar(15),
    apellido2 varchar(15),
    telefono int,
    especialidad varchar(10),
    constraint pk5 primary key (id)
);

-- Crear la tabla preiodista_escribe_revista si no existe
create table if not exists periodista_escribe_revista(
    id_periodista int,
    numero_registro_revista int,
    constraint pk6 primary key (id_periodista,numero_registro_revista),
    constraint fk4 foreign key (id_periodista) references periodista(id) ON UPDATE CASCADE,
    constraint fk5 foreign key (numero_registro_revista) references revista(numero_registro) ON UPDATE CASCADE
);

-- Crear la tabla seccion si no existe
create table if not exists seccion(
    id int,
    titulo varchar(15),
    extension varchar(15),
    numero_registro_revista int,
    constraint pk7 primary key (id),
    constraint fk6 foreign key (numero_registro_revista) references revista(numero_registro) ON UPDATE CASCADE
);

-- Crear la tabla ejemplar si no existe
create table if not exists ejemplar(
    id int,
    numero_ejemplares int,
    numero_paginas int,
    fecha date,
    numero_registro_revista int,
    constraint pk8 primary key (id),
    constraint fk7 foreign key (numero_registro_revista) references revista(numero_registro) ON UPDATE CASCADE
);
