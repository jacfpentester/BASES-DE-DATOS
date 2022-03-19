-- Crear la base de datos si no existe en caso de existir la borramos y la seleccionamoos
drop database if exists examen1;
create database examen1;
use examen1;

-- Crear la tabla empleado si no existe
create table if not exists empleado(
    id int primary key not null unique,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    telefono int(12),
    direccion varchar(30),
    tipo varchar(20) not null
);

-- Crear la tabla curso si no existe
create table if not exists curso(
    id int primary key not null unique,
    nombre varchar(20) not null,
    descripcion varchar(20),
    duracion decimal (5,2) not null, -- lo designo para horas y minutos
    coste decimal (6,2) not null
);

-- Crear la tabla curso_tiene_prerrequisito_curso si no existe
create table if not exists curso_tiene_prerrequisito_curso(
    id_curso int not null,
    id_curso_prerrequisito int not null,
    es_obligatorio varchar(50) not null, -- Este campo esta especificado y me faltan datos
	primary key (id_curso, id_curso_prerrequisito),
    constraint fk_idcurso foreign key (id_curso) references curso(id),
    constraint fk_id_curso_prerrequisito foreign key (id_curso_prerrequisito) references curso(id)
);

-- Crear la tabla edicion si no existe FK: curso(id), empleado(id)
create table if not exists edicion(
    id int primary key not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    horario varchar(30) not null, -- en este caso me faltan datos para poder especificar los rangos de tiempo
    lugar varchar(50) not null,
    id_curso int not null,
    id_empleado_capacitado int not null,
    constraint fk_idcurso_edicion foreign key (id_curso) references curso(id),
    constraint fk_id_empleado_capacitado foreign key (id_empleado_capacitado) references empleado(id)
);

-- Crear la tabla empleado_recibe_edicion si no existe FK: empleado(id), edicion(id)
create table if not exists empleado_recibe_edicion(
	id_empleado int not null,
	id_edicion int not null,
	primary key (id_empleado, id_edicion),
	constraint fk_id_empleado_recibe_edicion foreign key (id_empleado) references empleado(id),
	constraint fk_id_edicion_recibe_edicion foreign key (id_edicion) references edicion(id)
);