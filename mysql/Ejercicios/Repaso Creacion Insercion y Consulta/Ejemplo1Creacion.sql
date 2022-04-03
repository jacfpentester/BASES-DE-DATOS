-- Crear la base de datos
drop database if exists instituto;
create database instituto;
use instituto;

-- Crear la tabla practica si no existe
create table if not exists practica(
    id varchar(10),
    titulo varchar(50),
    dificultad varchar(20),
    constraint pk1 primary key (id)
);

-- Crear la tabla alumno si no existe
create table if not exists alumno(
    id varchar(10),
    nif varchar(15),
    grupo varchar(10),
    nombre varchar(15),
    apellido1 varchar(15),
    apellido2 varchar(15),
    constraint pk2 primary key (id)
);

-- Crear la tabla alumno_realiza_practica si no existe
create table if not exists alumno_realiza_practica(
    id_alumno varchar(10),
    id_practica varchar(10),
    fecha date,
    nota decimal(2,2),
    constraint pk3 primary key (id_alumno,id_practica),
    constraint fk1 foreign key (id_alumno) references alumno(id) ON UPDATE CASCADE, 
    constraint fk2 foreign key (id_practica) references practica(id) ON UPDATE CASCADE
);

-- Crear la tabla profesor si no existe
create table if not exists profesor(
    id varchar(10),
    nif varchar(15),
    nombre varchar(15),
    apellido1 varchar(15),
    apellido2 varchar(15),
    constraint pk4 primary key (id)
);

-- Crear la tabla examen_teorico si no existe
create table if not exists examen_teorico(
    id varchar(10),
    titulo varchar(50),
    numero_preguntas int,
    fecha date,
    id_profesor varchar(10),
    constraint pk5 primary key (id),
    constraint fk3 foreign key (id_profesor) references profesor(id) ON UPDATE CASCADE
);

-- Crear la tabla alumno_hace_examen_teorico si no existe
create table if not exists alumno_hace_examen_teorico(
    id_alumno varchar(10),
    id_examen_teorico varchar(10),
    nota int,
    constraint pk6 primary key (id_alumno,id_examen_teorico),
    constraint fk4 foreign key (id_alumno) references alumno(id) ON UPDATE CASCADE,
    constraint fk5 foreign key (id_examen_teorico) references examen_teorico(id) ON UPDATE CASCADE
);

-- Crear la tabla profesor_diseña_practica si no existe
create table if not exists profesor_diseña_practica(
    id_profesor varchar(10),
    id_practica varchar(10),
    fecha date,
    constraint pk7 primary key (id_profesor,id_practica),
    constraint fk6 foreign key (id_profesor) references profesor(id) ON UPDATE CASCADE,
    constraint fk7 foreign key (id_practica) references practica(id) ON UPDATE CASCADE
);
