/*   PARTE 1

Crea las BDs para los dos siguientes esquemas.

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
  
  */

/*   TABLAS DEL DISEÑO 2

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

*/


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


*/
