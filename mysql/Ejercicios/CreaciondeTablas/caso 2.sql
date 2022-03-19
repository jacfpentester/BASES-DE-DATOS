-- Crear la base de datos si no existe en caso de existir la borramos y la seleccionamoos
drop database if exists educacion;
create database educacion;
use educacion;

-- Crear la tabla practica si no existe
create table if not exists practica(
    id int primary key not null unique,
    titulo varchar(50) not null,
    dificultad varchar(20) not null
);

-- Crear la tabla alumno si no existe
create table if not exists alumno(
    id int not null primary key unique,
    nif varchar(10) not null unique,
    grupo varchar(20) not null,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20)
);

-- Crear la tabla realizapractica si no existe FK: alumno(id), practica(id)
create table if not exists realizarpractica(
    id_alumno int not NULL ,
    id_practica int not NULL ,
    fecha date not NULL,
    nota decimal(3,1)unsigned not NULL,
    constraint fk_id_alumno foreign key (id_alumno) references alumno(id),
    constraint fk_id_realiza_practica foreign key (id_practica) references practica(id),
    primary key (id_alumno, id_practica)
);

-- Crear tabla profesor
create table if not exists profesor(
	id_profesor int not null primary key unique,
    nif varchar(10) not null unique,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20)
    );
    
-- Crear tabla examen_teorico FK: profesor(id_profesor)
create table if not exists examen_teorico(
	id_examen_teorico int not null unique,
    titulo varchar(20) not null,
    num_preguntas int not null,
    fecha date not null,
    id_profesor int not null,
    constraint fk_profesor foreign key (id_profesor) references profesor(id_profesor),
    primary key (id_examen_teorico, id_profesor)
    );
    
-- Crear tabla alumno_hace_examen FK: alumno(id), examen_teorico(id_examen_teorico)
create table if not exists alumno_hace_examen(
	id_alumno int not null,
    id_examen_teorico int not null,
    nota decimal(3,1)unsigned not NULL,
    constraint fk_alumno foreign key (id_alumno) references alumno(id),
    constraint fk_id_examen_teorico foreign key (id_examen_teorico) references examen_teorico(id_examen_teorico),
	primary key (id_alumno, id_examen_teorico)
    );
 
-- Crear tabla profesor_disena_practica FK: profesor(id_profesor), practica(id)
create table if not exists profesor_disena_practica (
	id_profesor int not null,
	id_practica int not null,
    fecha date not null,
    constraint fk_profesor_practica foreign key (id_profesor) references profesor(id_profesor),
    constraint fk_id_practica foreign key (id_practica) references practica(id),
    primary key (id_profesor, id_practica)
	);