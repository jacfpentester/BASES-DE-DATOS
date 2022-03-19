-- Crear la base de datos si no existe en caso de existir la borramos y la seleccionamoos
drop database if exists examen2;
create database examen2;
use examen2;

-- Crear la tabla profesor si no existe
create table if not exists profesor(
    id int primary key not null unique,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    despacho varchar(20),
    telefono int(12),
    tipo varchar(20) not null
);

-- Crear la tabla proyecto_investigacion si no existe FK: profesor(id)
create table if not exists proyecto_investigacion(
    id int not null unique,
    nombre varchar(20) not null,
	programa_id int not null,
    descripcion varchar(50),
    fecha_inicio date,
    fecha_fin date,
    presupuesto varchar(50),
    id_doctor int not null,
    primary key (id, id_doctor),
    constraint fk_id_doctor_proyecto foreign key (id_doctor) references profesor(id)
);

-- Crear la tabla profesor_trabaja_proyecto si no existe FK: profesor(id), proyecto_investigacion(id)
create table if not exists profesor_trabaja_proyecto(
    id_profesor int not null,
    id_proyecto int not null,
    fecha_inicio date,
    fecha_fin date,
    primary key (id_profesor, id_proyecto),
    constraint fk_id_doctor_trabaja_proyecto foreign key (id_profesor) references profesor(id),
    constraint fk_id_trabaja_proyecto foreign key (id_proyecto) references proyecto_investigacion(id)
);

-- Crear la tabla doctor_supervisa_no_doctor si no existe FK: profesor(id) x 2
create table if not exists doctor_supervisa_no_doctor(
    id_doctor int not null,
    id_no_doctor int not null,
    fecha_inicio date,
    fecha_fin date,
    primary key (id_doctor, id_no_doctor),
    constraint fk_id_doctor_supervisa foreign key (id_doctor) references profesor(id),
    constraint fk_id_no_doctor_supervisa foreign key (id_no_doctor) references profesor(id)
);

-- Crear la tabla publicacion si no existe
create table if not exists publicacion(
    id int primary key not null,
	titulo varchar(20) not null,
    tipo varchar(20) not null
);

-- Crear la tabla revista si no existe FK: publicacion(id)
create table if not exists revista(
    id int primary key not null,
	volumen varchar(20),
    numero int,
    pagina_inicio int,
    pagina_fin int,
    constraint fk_publicacion_revista foreign key (id) references publicacion(id)
);

-- Crear la tabla congreso si no existe FK: publicacion(id)
create table if not exists congreso(
    id int primary key not null,
	tipo varchar(20) not null,
    ciudad varchar(20) not null,
    pais varchar(20) not null,
	fecha_inicio date not null,
    fecha_fin date not null,
    constraint fk_publicacion_congreso foreign key (id) references publicacion(id)
);

-- Crear la tabla profesor_escribe_publicacion si no existe FK: profesor(id), publicacion(id)
create table if not exists profesor_escribe_publicacion(
    id_profesor int not null,
	id_publicacion int not null,
    primary key (id_profesor, id_publicacion),
    constraint fk_profesor_escribe_publicacion foreign key (id_profesor) references profesor(id),
    constraint fk_publicacion_escribe_publicacion foreign key (id_publicacion) references publicacion(id)
);