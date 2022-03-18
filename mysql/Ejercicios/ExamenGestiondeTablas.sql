/*   PARTE 1

Crea las BDs para los dos siguientes esquemas.

  TABLAS DEL DISEÑO 1
====================================================================================
  
• PROVINCIA(id, nombre)
• LOCALIDAD(id, nombre, id_provincia)
  – id_provincia: FK de PROVINCIA(id)
• LIBRO(id, título, isbn, año_publicación, descripción, tipo)
• LIBRO_PAPEL(id, fecha_impresión, lugar_impresión, precio)
  – id: FK de LIBRO(id)
• LIBRO_EBOOK(id, tamaño_archivo, precio)
  – id: FK de LIBRO(id)
• CLIENTE(id, nombre, apellido1, apellido2, dirección, email, teléfono, id_localidad)
  – id_localidad: FK de LOCALIDAD(id)
• AUTOR(id, nombre, apellido1, apellido2, url, dirección, teléfono, id_localidad)
  – id_localidad: FK de LOCALIDAD(id)
• EDITORIAL(id, nombre, dirección, url, teléfono, id_localidad)
  – id_localidad: FK de LOCALIDAD(id)
• ALMACÉN(id, dirección, teléfono, id_localidad)
  – id_localidad: FK de LOCALIDAD(id)
• CESTA(id, fecha_compra, id_cliente)
  – id_cliente: FK de CLIENTE(id)
• AUTOR_ESCRIBE_LIBRO(id_autor, id_libro)
  – id_autor: FK de AUTOR(id)
  – id_libro: FK de LIBRO(id)
• EDITORIAL_PUBLICA_LIBRO(id_editorial, id_libro)
  – id_editorial: FK de EDITORIAL(id)
  – id_libro: FK de LIBRO(id)
• ALMACÉN_ALMACENA_LIBRO(id_almacen, id_libro, stock)
  – id_almacen: FK de ALMACEN(id)
  – id_libro: FK de LIBRO(id) 

==================================================================================== */
 

-- Crear la base de datos si no existe en caso de existir la borramos y la seleccionamoos
drop database if exists diseno1;
create database diseno1;
use diseno1;

-- Crear la tabla provincia si no existe
create table if not exists provincia(
    id int primary key not null,
    nombre varchar(20) not null
);

-- Crear la tabla localidad si no existe FK: provincia(id)
create table if not exists localidad(
    id int primary key not null,
    nombre varchar(20) not null,
    id_provincia int,
    constraint fk_id_localidad foreign key (id_provincia) references provincia(id)
);

-- Crear la tabla libro si no existe
create table if not exists libro(
    id int primary key not null,
    titulo varchar(25) not null,
	isbn varchar(25) not null,
    ano_publicacion date,
    descripcion varchar (30),
    tipo varchar(20)
    );
    
-- Crear la tabla libro_papel si no existe FK: libro(id)
create table if not exists libro_papel(
    id int primary key not null,
    fecha_impresion date not null,
	lugar_impresion varchar(20),
    precio decimal (5,2) not null,
    constraint fk_libro_papel foreign key (id) references libro(id)
);

-- Crear la tabla libro_ebook si no existe FK: libro(id)
create table if not exists libro_ebook(
    id int primary key not null,
    tamano_archivo decimal(9,3),
    precio decimal (5,2) not null,
    constraint fk_libro_ebook foreign key (id) references libro(id)
);

-- Crear la tabla cliente si no existe FK: localidad(id)
create table if not exists cliente(
	id int primary key not null,
    nombre varchar(20) not null,
    apellido1 varchar(20) not null,
    apellido2 varchar(20),
    direccion varchar(30),
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
    url varchar(20),
    direccion varchar(35),
    telefono int(15),
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

/*   TABLAS DEL DISEÑO 2
====================================================================================

• USUARIO(id, email, password, nombre, apellido1, apellido2, tipo)
• USUARIO_PREMIUM(id, teléfono, fecha_renovación)
  – id: FK de USUARIO(id)
• SERIE(id, nombre)
• VÍDEO(id, título, sinopsis, imagen, vídeo, duración, tipo)
• EPISODIO(id, temporada, número, id_serie)
  – id: FK de VÍDEO(id)
  – id_serie: FK de SERIE(id)
• PELÍCULA(id, puntuación_imdb, director)
  – id: FK de VÍDEO(id)
• GÉNERO(id, nombre)
• USUARIO_VE_VÍDEO(id_usuario, id_vídeo, fecha_hora)
  – id_usuario: FK de USUARIO(id)
  – id_vídeo: FK de VÍDEO(id)

====================================================================================*/

-- Crear la base de datos si no existe en caso de existir la borramos y la seleccionamoos
drop database if exists diseno2;
create database diseno2;
use diseno2;

-- Crear la tabla usuario  si no existe
create table if not exists usuario(
    id int primary key not null,
    email varchar(30),
    pass varchar(70) not null,
    nombre varchar(20) not null,
    apellido1 varchar(20),
    apellido2 varchar(20),
    tipo varchar(10)    
);

-- Crear la tabla usuario_premium si no existe FK: usuario(id)
create table if not exists usuario_premium(
    id int primary key not null,
    telefono int(12),
    fecha_renovacion date,
    constraint fk_id_usuario_usuariopremium foreign key (id) references usuario(id)
);

-- Crear la tabla serie si no existe
create table if not exists serie(
    id int primary key not null,
    nombre varchar(20)
);

-- Crear la tabla video  si no existe
create table if not exists video(
    id int primary key not null,
    titulo varchar(20) not null,
    sinopsis varchar(100),
    imagen varchar(50),
    video varchar(50),
    duracion int(10), -- nos referimos a minutos
    tipo varchar(10)    
);

-- Crear la tabla episodio si no existe FK video(id), serie(id)
create table if not exists episodio(
    id int primary key not null,
    temporada int(2),
    numero int(5),
    id_serie int,
    constraint fk_id_episodio_video foreign key (id) references video(id),
    constraint fk_id_episodio_serie foreign key (id) references serie(id)
);

-- Crear la tabla pelicula si no existe FK: video(id)
create table if not exists pelicula(
    id int primary key not null,
    puntuacion_imdb int(5),
    director varchar(15),
    constraint fk_pelicula_video foreign key (id) references video(id)
);

-- Crear la tabla genero  si no existe
create table if not exists genero(
    id int primary key not null,
    nombre varchar(20) not null  
);

-- Crear la tabla usuario_ve_video si no existe FK video(id), usuario(id)
create table if not exists usuario_ve_video(
    id_usuario int not null,
	id_video int not null,
    fecha_hora date,
    primary key (id_usuario,id_video),
    constraint fk_usuario_ve_video foreign key (id_usuario) references usuario(id),
    constraint fk_video_usuario_ve_video foreign key (id_video) references video(id)
);

/*   PARTE 2

Sobre la base de datos del diseño 1 realiza los siguientes cambios:
➢ Crea una copia de la tabla libro_ebook que se llame libro_pdf
➢ Añade un nuevo campo a la tabla Localidad llamado cod_postal de tipo char(4) y con las siguientes restricciones:
➔ No puede tomar valor NULL
➔ Por defecto tomará el valor ‘0000’
➔ Se colocará después del campo nombre
➢ Elimina en el orden correcto la tabla Libro (Hay 2 formas de hacerlo)
➢ Elimina la restricción de clave externa de id_provincia de la tabla Cesta
➢ Crea un índice en la tabla Cliente sobre los campos id y email
➢ Crea una vista de la tabla Almacén
➢ Crea la tabla T1 siguiente y añade después la clave primaria a la columna col1

CREATE TABLE t1 (
 col1 VARCHAR(10),
 col2 VARCHAR(20)
);

====================================================================================*/

use diseno1;

create table libro_pdf as select * from libro_ebook;

alter table localidad add cod_postal char(4) not null default'0000' after nombre;

-- para borrar la tabla primero le quitamos las referencias 
alter table libro_papel drop foreign key fk_libro_papel;
alter table libro_ebook drop foreign key fk_libro_ebook;
alter table almacen_almacena drop foreign key fk_id_libro_almacen_almacena;
alter table editorial_publica_libro drop foreign key fk_id_libro_editorial_publica_libro;
alter table autor_escribe_libro drop foreign key fk_id_libro_autor_escribe_libro;
drop table libro;

alter table cesta drop foreign key fk_id_cliente_cesta;

create index i_cliente on cliente (id,email);

-- Creamos la vista 
create view vista_almacen as 
select * from almacen;

-- Creaos la tabla

CREATE TABLE t1 (
 col1 VARCHAR(10),
 col2 VARCHAR(20)
);

-- Asignamos clave primaria
alter table t1 add primary key (col1);

--====================================================================================
