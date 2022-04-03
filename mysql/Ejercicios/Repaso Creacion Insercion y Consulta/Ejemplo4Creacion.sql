-- Crear la base de datos
drop database if exists formacion
create database formacion;
use formacion;

-- Crear la tabla empleado si no existe
create table if not exists empleado(
    id int,
    nombre varchar(15),
    apellido1 varchar(15),
    apellido2 varchar(15),
    telefono int,
    direccion varchar(50),
    tipo varchar(10),
    constraint pk1 primary key (id)
);

-- Crear la tabla curso si no existe
create table if not exists curso(
    id int,
    nombre varchar(15),
    descripcion varchar(15),
    duracion varchar(10),
    coste decimal(5,2),
    constraint pk2 primary key (id)
);

-- Crear la tabla curso_tiene_prerrequisito_curso si no existe
create table if not exists curso_tiene_prerrequisito_curso(
    id_curso int,
    id_curso_prerrequisito int,
    es_obligatorio varchar(4),
    constraint pk3 primary key (id_curso,id_curso_prerrequisito),
    constraint fk1 foreign key (id_curso) references curso(id) ON UPDATE CASCADE,
    constraint fk2 foreign key (id_curso_prerrequisito) references curso(id) ON UPDATE CASCADE
);

-- Crear la tabla edicion si no existe
create table if not exists edicion(
    id int,
    fecha_inicio varchar(15),
    fecha_fin int,
    horario DATETIME,
    lugar varchar(10),
    id_curso int,
    id_empleado_capacitado int,
    constraint pk4 primary key (id),
    constraint fk3 foreign key (id_curso) references curso(id) ON UPDATE CASCADE,
    constraint fk4 foreign key (id_empleado_capacitado) references empleado(id) ON UPDATE CASCADE
);

-- Crear la tabla empleado_recibe_edicion si no existe
create table if not exists empleado_recibe_edicion(
    id_empleado int,
    id_edicion int,
    constraint pk5 primary key (id_empleado,id_edicion),
    constraint fk5 foreign key (id_empleado) references empleado(id) ON UPDATE CASCADE,
    constraint fk6 foreign key (id_edicion) references edicion(id) ON UPDATE CASCADE
);
