
use revista;

-- INSERCIÓN DE DATOS TABLA SUCURSAL:
INSERT INTO sucursal (codigo, direccion, telefono, ciudad, provincia) VALUES (001, "Calle 1", "888888888", "Almería", "Almeria");
INSERT INTO sucursal (codigo, direccion, telefono, ciudad, provincia) VALUES (002, "Calle 2", "777777777", "Madrid", "Madrid");
INSERT INTO sucursal (codigo, direccion, telefono, ciudad, provincia) VALUES (003, "Calle 3", "123546789", "Murcia", "Murcia");
INSERT INTO sucursal (codigo, direccion, telefono, ciudad, provincia) VALUES (004, "Calle 4", "978957567", "Linares", "Jaén");
-- INSERCIÓN DE DATOS TABLA EMPLEADO:
INSERT INTO empleado (id, nif, nombre, apellido1, apellido2, telefono, codigo_sucursal) VALUES (101, "00506784G", "Jaime", "Judo", "Noa", "123134789", 001);
INSERT INTO empleado (id, nif, nombre, apellido1, apellido2, telefono, codigo_sucursal) VALUES (102, "07567246L", "Lola", "Dina", "Lopan", "888567388", 002);
INSERT INTO empleado (id, nif, nombre, apellido1, apellido2, telefono, codigo_sucursal) VALUES (103, "02345871I", "Andrés", "Fiaah", "Romina", "773456777", 003);
INSERT INTO empleado (id, nif, nombre, apellido1, apellido2, telefono, codigo_sucursal) VALUES (104, "12570672S", "Ramón", "Juabe", "Aljarafe", "661234666", 004);
-- INSERCIÓN DE DATOS TABLA REVISTA:
INSERT INTO revista (numero_registro, titulo, tipo, periodicidad) VALUES (201, "La vida de la pantoja", "Corazón", "Anual");
INSERT INTO revista (numero_registro, titulo, tipo, periodicidad) VALUES (202, "Guerra en Ucrania", "Análisis Internacional", "Mensual");
INSERT INTO revista (numero_registro, titulo, tipo, periodicidad) VALUES (203, "Una nueva cartelera de fútbol", "Deportes", "Semanal");
INSERT INTO revista (numero_registro, titulo, tipo, periodicidad) VALUES (204, "Una extrema muy derecha", "Política", "Anual");
-- INSERCIÓN DE DATOS TABLA SUCURSAL_PUBLICA_REVISTA:
INSERT INTO sucursal_publica_revista (codigo_sucursal, numero_registro_revista) VALUES (001, 201);
INSERT INTO sucursal_publica_revista (codigo_sucursal, numero_registro_revista) VALUES (002, 202);
INSERT INTO sucursal_publica_revista (codigo_sucursal, numero_registro_revista) VALUES (003, 203);
INSERT INTO sucursal_publica_revista (codigo_sucursal, numero_registro_revista) VALUES (004, 204);
-- INSERCIÓN DE DATOS TABLA PERIODISTA:
INSERT INTO periodista (id, nombre, apellido1, apellido2, telefono, especialidad) VALUES (401, "Pedro", "Luis", "Vives", "123456789", "Política");
INSERT INTO periodista (id, nombre, apellido1, apellido2, telefono, especialidad) VALUES (402, "Antonio", "Finn", "Pajares", "888888888", "Corazón");
INSERT INTO periodista (id, nombre, apellido1, apellido2, telefono, especialidad) VALUES (403, "Maria", "Duran", "Jimeno", "777777777", "Deportes");
INSERT INTO periodista (id, nombre, apellido1, apellido2, telefono, especialidad) VALUES (404, "Ramona", "Andujar", "Borras", "666666666", "Análisis Internacional");
-- INSERCIÓN DE DATOS TABLA PERIODISTA_ESCRIBE_REVISTA:
INSERT INTO periodista_escribe_revista (id_periodista, numero_registro_revista) VALUES (401, 201);
INSERT INTO periodista_escribe_revista (id_periodista, numero_registro_revista) VALUES (402, 202);
INSERT INTO periodista_escribe_revista (id_periodista, numero_registro_revista) VALUES (403, 203);
INSERT INTO periodista_escribe_revista (id_periodista, numero_registro_revista) VALUES (404, 204);
-- INSERCIÓN DE DATOS TABLA SECCION:
INSERT INTO seccion (id, titulo, extension, numero_registro_revista) VALUES (601, "Crítica del corazón", "C1", 201);
INSERT INTO seccion (id, titulo, extension, numero_registro_revista) VALUES (602, "Crítica deportiva", "D1", 202);
INSERT INTO seccion (id, titulo, extension, numero_registro_revista) VALUES (603, "Crítica Internacional", "I1", 203);
INSERT INTO seccion (id, titulo, extension, numero_registro_revista) VALUES (604, "Crítica política", "P1", 204);
-- INSERCIÓN DE DATOS TABLA EJEMPLAR:
INSERT INTO ejemplar (id, numero_ejemplares, numero_paginas, fecha, numero_registro_revista) VALUES (501, "100", "120", "12/01/21", 201);
INSERT INTO ejemplar (id, numero_ejemplares, numero_paginas, fecha, numero_registro_revista) VALUES (502, "20", "360", "01/03/20", 202);
INSERT INTO ejemplar (id, numero_ejemplares, numero_paginas, fecha, numero_registro_revista) VALUES (503, "15", "89", "06/08/22", 203);
INSERT INTO ejemplar (id, numero_ejemplares, numero_paginas, fecha, numero_registro_revista) VALUES (504, "19", "234", "10/08/21", 204);

