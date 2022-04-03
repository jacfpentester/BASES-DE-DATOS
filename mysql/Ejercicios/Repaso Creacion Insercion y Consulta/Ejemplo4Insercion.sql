use formacion;

-- INSERCIÓN DE DATOS TABLA EMPLEADO:
INSERT INTO empleado (id, nombre, apellido1, apellido2, telefono, direccion, tipo) VALUES (001, "Jaime", "Judo", "Noa", "123134789", "Carretera Almeria", "Capacitado");
INSERT INTO empleado (id, nombre, apellido1, apellido2, telefono, direccion, tipo) VALUES (002, "Lola", "Dina", "Lopan", "888567388", "Carretera Madrid", "No capacitado");
INSERT INTO empleado (id, nombre, apellido1, apellido2, telefono, direccion, tipo) VALUES (003, "Andrés", "Fiaah", "Romina", "773456777", "Carretera Murcia", "No capacitado");
INSERT INTO empleado (id, nombre, apellido1, apellido2, telefono, direccion, tipo) VALUES (004, "Ramón", "Juabe", "Aljarafe", "661234666", "Carretera Jaén", "Capacitado");
-- INSERCIÓN DE DATOS TABLA CURSO:
INSERT INTO curso (id, nombre, descripcion, duracion, coste) VALUES (101, "Cirujía Láser", "Un curso de cirujía avanzado", "360h", "7000€");
INSERT INTO curso (id, nombre, descripcion, duracion, coste) VALUES (102, "Medios de desarrollo mediambiental", "Por y para el mediambiente", "400h", "3000€");
INSERT INTO curso (id, nombre, descripcion, duracion, coste) VALUES (103, "Soldadura TIC", "Empezando a soldar con la herramienta TIC", "200h", "5000€");
INSERT INTO curso (id, nombre, descripcion, duracion, coste) VALUES (104, "Medicina avanzada", "Aprendiendo sobre medicina", "600h", "9000€");
-- INSERCIÓN DE DATOS TABLA CURSO_TIENE_PRERREQUISITO_CURSO:
INSERT INTO curso_tiene_prerrequisito_curso (id_curso, id_curso_prerrequisito, es_obligatorio) VALUES (101, 101, "Sí");
INSERT INTO curso_tiene_prerrequisito_curso (id_curso, id_curso_prerrequisito, es_obligatorio) VALUES (102, 101, "Sí");
INSERT INTO curso_tiene_prerrequisito_curso (id_curso, id_curso_prerrequisito, es_obligatorio) VALUES (103, 101, "No");
INSERT INTO curso_tiene_prerrequisito_curso (id_curso, id_curso_prerrequisito, es_obligatorio) VALUES (104, 101, "Sí");
-- INSERCIÓN DE DATOS TABLA EDICION:
INSERT INTO edicion (id, fecha_inicio, fecha_fin, horario, lugar, id_curso, id_empleado_capacitado) VALUES (301, "01/01/2020", "10/10/2020", "L-V(8-14h)", "Puerta trinidad, 1", 101, 001);
INSERT INTO edicion (id, fecha_inicio, fecha_fin, horario, lugar, id_curso, id_empleado_capacitado) VALUES (302, "08/02/2020", "16/08/2020", "M-X(7-13h)", "Calle enmedio, 12", 102, 004);
INSERT INTO edicion (id, fecha_inicio, fecha_fin, horario, lugar, id_curso, id_empleado_capacitado) VALUES (303, "11/03/2020", "10/06/2020", "L-X(8-15h)", "Rotonda la girafa, 7", 103, 004);
INSERT INTO edicion (id, fecha_inicio, fecha_fin, horario, lugar, id_curso, id_empleado_capacitado) VALUES (304, "09/05/2020", "01/11/2020", "X-V(9-13h)", "Palacio sanroque, 21", 104, 001);
-- INSERCIÓN DE DATOS TABLA EMPLEADO_RECIBE_EDICION:
INSERT INTO empleado_recibe_edicion (id_empleado, id_edicion) VALUES (001, 301);
INSERT INTO empleado_recibe_edicion (id_empleado, id_edicion) VALUES (002, 302);
INSERT INTO empleado_recibe_edicion (id_empleado, id_edicion) VALUES (003, 303);
INSERT INTO empleado_recibe_edicion (id_empleado, id_edicion) VALUES (004, 304);
