-- Crear la base de datos si no existe en caso de existir la borramos y la seleccionamoos
drop database if exists matriculacion;
create database matriculacion;
use matriculacion;

-- Crear la tabla alumno si no existe
create table if not exists alumno(
    numero_matricula int primary key not null unique,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    fecha_nacimiento date not null,
    telefono int(12)
);

-- Crear la tabla curso_escolar si no existe
create table if not exists curso_escolar(
    id int primary key not null unique,
    ano_inicio date not null,
	ano_fin date not null
);

-- Crear la tabla profesor si no existe
create table if not exists profesor(
    id int primary key not null unique,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    especialidad varchar(20) not null,
    telefono int(12)
);

-- Crear la tabla asignatura si no existe FK: profesor(id)
create table if not exists asignatura(
    codigo int not null unique,
    nombre varchar(20) not null,
	numero_horas int not null,
	id_profesor int not null,
    primary key (codigo, id_profesor),
    constraint fk_idprofesor foreign key (id_profesor) references profesor(id)
);

-- Crear la tabla matricula si no existe FK: profesor(id)
create table if not exists matricula(
    numero_matricula int not null,
    id_curso_escolar int not null,
	codigo_asignatura int not null,
    primary key (numero_matricula, id_curso_escolar, codigo_asignatura),
    constraint fk_numero_matricula foreign key (numero_matricula) references alumno(numero_matricula),
    constraint fk_id_curso_escolar foreign key (id_curso_escolar) references curso_escolar(id),
    constraint fk_codigo_asignatura foreign key (codigo_asignatura) references asignatura(codigo)
);