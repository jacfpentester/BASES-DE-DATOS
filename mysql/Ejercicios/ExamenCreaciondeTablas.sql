--  TABLAS DEL DISEÑO 1
/*
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
  */
