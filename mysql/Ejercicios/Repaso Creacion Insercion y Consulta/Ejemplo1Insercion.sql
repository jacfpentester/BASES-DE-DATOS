use instituto;

-- INSERCIÓN DE DATOS TABLA PRACTICA:
INSERT INTO practica (id, titulo, dificultad) VALUES ("PR-001", "1FN GBD", "Fácil");
INSERT INTO practica (id, titulo, dificultad) VALUES ("PR-002", "2FN GBD", "Medio");
INSERT INTO practica (id, titulo, dificultad) VALUES ("PR-003", "3FN GBD", "Difícil");
INSERT INTO practica (id, titulo, dificultad) VALUES ("PR-004", "4FN GBD", "Muy Difícil");
-- INSERCIÓN DE DATOS TABLA ALUMNO:
INSERT INTO alumno (id, nif, grupo, nombre, apellido1, apellido2) VALUES ("AL-001", "00504302G", "A", "Pedro", "Luis", "Vives");
INSERT INTO alumno (id, nif, grupo, nombre, apellido1, apellido2) VALUES ("AL-002", "07410246Z", "B", "Antonio", "Finn", "Pajares");
INSERT INTO alumno (id, nif, grupo, nombre, apellido1, apellido2) VALUES ("AL-003", "02065871B", "C", "Maria", "Duran", "Jimeno");
INSERT INTO alumno (id, nif, grupo, nombre, apellido1, apellido2) VALUES ("AL-004", "64450672A", "D", "Ramona", "Andujar", "Borras");
-- INSERCIÓN DE DATOS TABLA ALUMNO_REALIZA_PRACTICA:
INSERT INTO alumno_realiza_practica (id_alumno, id_practica, fecha, nota) VALUES ("AL-001", "PR-001", "03/30/11", "6");
INSERT INTO alumno_realiza_practica (id_alumno, id_practica, fecha, nota) VALUES ("AL-002", "PR-002", "04/02/04", "7");
INSERT INTO alumno_realiza_practica (id_alumno, id_practica, fecha, nota) VALUES ("AL-003", "PR-003", "07/03/20", "9");
INSERT INTO alumno_realiza_practica (id_alumno, id_practica, fecha, nota) VALUES ("AL-004", "PR-004", "02/03/22", "10");
-- INSERCIÓN DE DATOS TABLA PROFESOR:
INSERT INTO profesor (id, nif, nombre, apellido1, apellido2) VALUES ("PROF-001", "50036853P", "Sonia", "Perico", "Granado");
INSERT INTO profesor (id, nif, nombre, apellido1, apellido2) VALUES ("PROF-002", "48430135R", "Pepe", "Dante", "Pue");
INSERT INTO profesor (id, nif, nombre, apellido1, apellido2) VALUES ("PROF-003", "97755747C", "Andrés", "San", "Sarin");
INSERT INTO profesor (id, nif, nombre, apellido1, apellido2) VALUES ("PROF-004", "14947940X", "Juan", "Sánchez", "Mestes");
-- INSERCIÓN DE DATOS TABLA EXAMEN_TEORICO:
INSERT INTO examen_teorico (id, titulo, numero_preguntas, fecha, id_profesor) VALUES ("TEO-001", "Examen GBD", "15", "03/04/20", "PROF-001");
INSERT INTO examen_teorico (id, titulo, numero_preguntas, fecha, id_profesor) VALUES ("TEO-002", "Examen PRL", "20", "12/10/19", "PROF-002");
INSERT INTO examen_teorico (id, titulo, numero_preguntas, fecha, id_profesor) VALUES ("TEO-003", "Examen ISO", "10", "20/08/21", "PROF-003");
INSERT INTO examen_teorico (id, titulo, numero_preguntas, fecha, id_profesor) VALUES ("TEO-004", "Examen FH", "16", "06/05/19", "PROF-004");
-- INSERCIÓN DE DATOS TABLA ALUMNO_HACE_EXAMEN_TEORICO:
INSERT INTO alumno_hace_examen_teorico (id_alumno, id_examen_teorico, nota) VALUES ("AL-001", "TEO-001", "5");
INSERT INTO alumno_hace_examen_teorico (id_alumno, id_examen_teorico, nota) VALUES ("AL-002", "TEO-002", "2");
INSERT INTO alumno_hace_examen_teorico (id_alumno, id_examen_teorico, nota) VALUES ("AL-003", "TEO-003", "10");
INSERT INTO alumno_hace_examen_teorico (id_alumno, id_examen_teorico, nota) VALUES ("AL-004", "TEO-004", "6");
-- INSERCIÓN DE DATOS TABLA PROFESOR_DISEÑA_PRACTICA:
INSERT INTO profesor_diseña_practica (id_profesor, id_practica, fecha) VALUES ("PROF-001", "PR-001", "07/10/18");
INSERT INTO profesor_diseña_practica (id_profesor, id_practica, fecha) VALUES ("PROF-002", "PR-002", "05/04/20");
INSERT INTO profesor_diseña_practica (id_profesor, id_practica, fecha) VALUES ("PROF-003", "PR-003", "15/06/21");
INSERT INTO profesor_diseña_practica (id_profesor, id_practica, fecha) VALUES ("PROF-004", "PR-004", "08/08/16");
