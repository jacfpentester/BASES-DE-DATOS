-- Crear la base de datos si no existe en caso de existir la borramos y la seleccionamoos
drop database if exists agencia;
create database agencia;
use agencia;

-- Crear la tabla agencia si no existe
create table if not exists agencia(
    id int primary key not null unique,
    cif varchar(15) not null,
    direccion varchar(20) not null,
    telefono int(10) not null
);

-- Crear la tabla propietario si no existe
create table if not exists propietario(
    id int primary key not null unique,
    nif varchar(15) not null,
	nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    direccion varchar(20) not null,
    email varchar(30) 
);

-- Crear la tabla inquilino si no existe
create table if not exists inquilino(
    id int primary key not null unique,
    nif varchar(15) not null,
	nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    telefono int(12) not null,
    fecha_nacimiento date
);

-- Crear la tabla vivienda si no existe FK: agencia(id), propietario(id)
create table if not exists vivienda(
    id int not null unique,
    calle varchar(25) not null,
	numero int not null,
    codigo_postal int(10) not null,
    piso varchar(10), -- esta configuracion por si necesita especificar algo
    poblacion varchar(20) not null,
    descripcion varchar(30),
    id_agencia int not null,
    id_propietario int not null,
    primary key ( id, id_agencia, id_propietario),
    constraint fk_id_agencia foreign key (id_agencia) references agencia(id),
    constraint fk_id_propietario foreign key (id_propietario) references propietario(id)
);

-- Crear la tabla alquiler si no existe
create table if not exists alquiler(
    id int primary key not null unique,
    fecha_inicio date not null, -- deveriamos capturar que fecha inicio no sea inferior a fecha fin....
    fecha_fin date not null,
	importe decimal unsigned not null, -- Aqui podriamos definir el prefijo de la moneda
	fianza decimal unsigned not null, -- Aqui podriamos definir el prefijo de la moneda
    fecha_firma date not null,
    id_inquilino int not null,
    id_vivienda int not null,
	id_alquiler_renovado int not null,
    constraint fk_id_inquilino foreign key (id_inquilino) references inquilino(id),
    constraint fk_id_vivienda foreign key (id_vivienda) references vivienda(id),
    constraint fk_id_alquiler_renovado foreign key (id_alquiler_renovado) references alquiler(id) -- aqui tenemos una retroalimentacion
);