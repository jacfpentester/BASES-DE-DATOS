-- Crear la base de datos si no existe en caso de existir la borramos y la seleccionamoos
drop database if exists examen3;
create database examen3;
use examen3;

-- Crear la tabla provincia si no existe
create table if not exists provincia(
    id int primary key not null unique,
    nombre varchar(20) not null
);

-- Crear la tabla localidad si no existe FK: provincia(id)
create table if not exists localidad(
    id int primary key not null unique,
    nombre varchar(20) not null,
    id_provincia int,
    constraint fk_id_provincia_localidad foreign key (id_provincia) references provincia(id)
);

-- Crear la tabla libro si no existe
create table if not exists libro(
    id int primary key not null unique,
    titulo varchar(20) not null,
	isbn varchar(20) not null,
    ano_publicacion date,
    descripcion varchar (50),
    tipo varchar(20)
);

-- Crear la tabla libro_papel si no existe FK: libro(id)
create table if not exists libro_papel(
    id int primary key not null unique,
    fecha_impresion date not null,
	lugar_impresion varchar(20),
    precio decimal (5,2) not null,
    constraint fk_libro_papel foreign key (id) references libro(id)
);

-- Crear la tabla libro_ebook si no existe FK: libro(id)
create table if not exists libro_ebook(
    id int primary key not null unique,
    tamano_archivo decimal(9,3), -- Necesitaria saber en que unidad se especificaara es decir MB, KB...
    precio decimal (5,2) not null,
    constraint fk_libro_ebook foreign key (id) references libro(id)
);

-- Crear la tabla cliente si no existe FK: localidad(id)
create table if not exists cliente(
	id int primary key not null,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    direccion varchar(30) not null,
    email varchar(20),
    telefono int(12),
    id_localidad int,
    constraint fk_id_localidad_cliente foreign key (id_localidad)  references localidad(id)
);

-- Crear la tabla autor si no existe FK: localidad(id)
create table if not exists autor(
	id int primary key not null,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    url varchar(30),
    direccion varchar(30) not null,
    telefono int(12),
    id_localidad int,
    constraint fk_id_localidad_autor foreign key (id_localidad)  references localidad(id)
);

-- Crear la tabla editorial si no existe FK: localidad(id)
create table if not exists editorial(
	id int primary key not null,
    nombre varchar(20) not null,
    direccion varchar(30) not null,
	url varchar(30),
    telefono int(12),
    id_localidad int,
    constraint fk_id_localidad_editorial foreign key (id_localidad)  references localidad(id)
);

-- Crear la tabla almacen si no existe FK: localidad(id)
create table if not exists almacen(
	id int primary key not null,
    direccion varchar(30) not null,
    telefono int(12),
    id_localidad int,
    constraint fk_id_localidad_almacen foreign key (id_localidad)  references localidad(id)
);

-- Crear la tabla cesta si no existe FK: cliente(id)
create table if not exists cesta(
	id int primary key not null,
	fecha_compra date not null,
    id_cliente int,
    constraint fk_id_cliente_cesta foreign key (id_cliente)  references cliente(id)
);

-- Crear la tabla autor_escribe_libro si no existe FK: autor(id), libro(id)
create table if not exists autor_escribe_libro(
	id_autor int not null,
	id_libro int not null,
    primary key (id_autor, id_libro),
    constraint fk_id_autor_autor_escribe_libro foreign key (id_autor)  references autor(id),
    constraint fk_id_libro_autor_escribe_libro foreign key (id_libro)  references libro(id)    
);

-- Crear la tabla editorial_publica_libro si no existe FK: editorial(id), libro(id)
create table if not exists editorial_publica_libro(
	id_editorial int not null,
	id_libro int not null,
    primary key (id_editorial, id_libro),
    constraint fk_id_editorial_editorial_publica_libro foreign key (id_editorial)  references editorial(id),
    constraint fk_id_libro_editorial_publica_libro  foreign key (id_libro)  references libro(id)    
);

-- Crear la tabla almacen_almacena si no existe FK: almacen(id), libro(id)
create table if not exists almacen_almacena(
	id_almacen int not null,
	id_libro int not null,
    primary key (id_almacen, id_libro),
    constraint fk_id_almacen_almacen_almacena foreign key (id_almacen)  references almacen(id),
    constraint fk_id_libro_almacen_almacena foreign key (id_libro)  references libro(id)    
);