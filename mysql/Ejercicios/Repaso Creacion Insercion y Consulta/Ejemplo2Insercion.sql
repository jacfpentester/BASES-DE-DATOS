use alquileres;

-- INSERCIÓN DE DATOS TABLA AGENCIA:
INSERT INTO agencia (id, direccion, telefono, cif) VALUES ("001", "Calle 1", "123456789", "ALU-1234");
INSERT INTO agencia (id, direccion, telefono, cif) VALUES ("002", "Calle 2", "666666666", "ISO-3456");
INSERT INTO agencia (id, direccion, telefono, cif) VALUES ("003", "Calle 3", "555555555", "NAU-7890");
INSERT INTO agencia (id, direccion, telefono, cif) VALUES ("004", "Calle 4", "444444444", "ORI-1256");
-- INSERCIÓN DE DATOS TABLA PROPIETARIO:
INSERT INTO propietario (id, nif, nombre, apellido1, apellido2, telefono, direccion, email) VALUES ("101", "00504302G", "Pedro", "Luis", "Vives", "123456789", "Cr.1", "mail1@mail.com");
INSERT INTO propietario (id, nif, nombre, apellido1, apellido2, telefono, direccion, email) VALUES ("102", "07410246Z", "Antonio", "Finn", "Pajares", "888888888", "Cr.2", "mail2@mail.com");
INSERT INTO propietario (id, nif, nombre, apellido1, apellido2, telefono, direccion, email) VALUES ("103", "02065871B", "Maria", "Duran", "Jimeno", "777777777", "Cr.3", "mail3@mail.com");
INSERT INTO propietario (id, nif, nombre, apellido1, apellido2, telefono, direccion, email) VALUES ("104", "64450672A", "Ramona", "Andujar", "Borras", "666666666", "Cr.4", "mail4@mail.com");
-- INSERCIÓN DE DATOS TABLA VIVIENDA:
INSERT INTO vivienda (id, calle, numero, codigo_postal, piso, poblacion, descripcion, id_agencia, id_propietario) VALUES ("201", "Carretera 1", "3", "13456", "6", "Granada", "Mu fea la casa", "001", "101");
INSERT INTO vivienda (id, calle, numero, codigo_postal, piso, poblacion, descripcion, id_agencia, id_propietario) VALUES ("202", "Carretera 2", "2", "09876", "7", "Almeria", "Trazado oblicuo del jardin", "002", "102");
INSERT INTO vivienda (id, calle, numero, codigo_postal, piso, poblacion, descripcion, id_agencia, id_propietario) VALUES ("203", "Carretera 3", "8", "56734", "9", "Jerez", "En mita un llano", "003", "103");
INSERT INTO vivienda (id, calle, numero, codigo_postal, piso, poblacion, descripcion, id_agencia, id_propietario) VALUES ("204", "Carretera 4", "10", "31456", "10", "Rota", "Cerca de la playa", "004", "104");
-- INSERCIÓN DE DATOS TABLA INQUILINO:
INSERT INTO inquilino (id, nif, nombre, apellido1, apellido2, telefono, fecha_nacimiento) VALUES ("301", "50036853P", "Sonia", "Perico", "Granado", "789543678", "01/05/1945");
INSERT INTO inquilino (id, nif, nombre, apellido1, apellido2, telefono, fecha_nacimiento) VALUES ("302", "48430135R", "Pepe", "Dante", "Pue", "780456234", "12/12/1978");
INSERT INTO inquilino (id, nif, nombre, apellido1, apellido2, telefono, fecha_nacimiento) VALUES ("303", "97755747C", "Andrés", "San", "Sarin", "999000123", "11/03/1980");
INSERT INTO inquilino (id, nif, nombre, apellido1, apellido2, telefono, fecha_nacimiento) VALUES ("304", "14947940X", "Juan", "Sánchez", "Mestes", "990899765", "02/01/1990");
-- INSERCIÓN DE DATOS TABLA ALQUILER:
INSERT INTO alquiler (id, fecha_inicio, fecha_fin, importe, fianza, fecha_firma, id_inquilino, id_vivienda, id_alquiler_renovado) VALUES ("401", "03/04/20", "01/01/22", "1200", "100", "12/01/21", "301", "201", NULL);
INSERT INTO alquiler (id, fecha_inicio, fecha_fin, importe, fianza, fecha_firma, id_inquilino, id_vivienda, id_alquiler_renovado) VALUES ("402", "12/10/19", "02/07/20", "980", "150", "01/03/20", "302", "202", "401");
INSERT INTO alquiler (id, fecha_inicio, fecha_fin, importe, fianza, fecha_firma, id_inquilino, id_vivienda, id_alquiler_renovado) VALUES ("403", "20/08/21", "06/12/22", "2000", "200", "06/08/22", "303", "203", "402");
INSERT INTO alquiler (id, fecha_inicio, fecha_fin, importe, fianza, fecha_firma, id_inquilino, id_vivienda, id_alquiler_renovado) VALUES ("404", "06/05/19", "10/10/21", "1500", "350", "10/08/21", "304", "204", "403");
