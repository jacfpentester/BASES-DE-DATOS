-- Crear la base de datos
drop database if exists alquileres;
create database alquileres;
use alquileres;

-- Crear la tabla agencia si no existe
create table if not exists agencia(
    id int,
    direccion varchar(50),
    telefono int,
    cif varchar(10),
    constraint pk1 primary key (id)
);

-- Crear la tabla propietario si no existe
create table if not exists propietario(
    id int,
    nif varchar(15),
    nombre varchar(15),
    apellido1 varchar(15),
    apellido2 varchar(15),
    telefono int,
    direccion varchar(50),
    email varchar(30),
    constraint pk2 primary key (id)
);

-- Crear la tabla vivienda si no existe
create table if not exists vivienda(
    id int,
    calle varchar(30),
    numero int,
    codigo_postal char(5),
    piso varchar(10),
    poblacion varchar(10),
    descripcion varchar(50),
    id_agencia int,
    id_propietario int,
    constraint pk3 primary key (id),
    constraint fk1 foreign key (id_agencia) references agencia(id) ON UPDATE CASCADE,
    constraint fk2 foreign key (id_propietario) references propietario(id) ON UPDATE CASCADE
);

-- Crear la tabla inquilino si no existe
create table if not exists inquilino(
    id int,
    nif varchar(15),
    nombre varchar(15),
    apellido1 varchar(15),
    apellido2 varchar(15),
    telefono int,
    fecha_nacimiento date,
    constraint pk4 primary key (id)
);

-- Crear la tabla alquiler si no existe
create table if not exists alquiler(
    id int,
    fecha_inicio date,
    fecha_fin date,
    importe DECIMAL(5,2),
    fianza DECIMAL(5,2),
    fecha_firma date,
    id_inquilino int,
    id_vivienda int,
    id_alquiler_renovado int,
    constraint pk4 primary key (id),
    constraint fk3 foreign key (id_inquilino) references inquilino(id) ON UPDATE CASCADE,
    constraint fk4 foreign key (id_vivienda) references vivienda(id) ON UPDATE CASCADE,
    constraint fk5 foreign key (id_alquiler_renovado) references alquiler(id) ON UPDATE CASCADE
);
