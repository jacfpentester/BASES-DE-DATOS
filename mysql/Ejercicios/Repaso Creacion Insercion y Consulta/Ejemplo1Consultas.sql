use instituto;
-- ¿Qué alumnos han aprobado el examen de GBD?
SELECT id_alumno from alumno_hace_examen_teorico where id_examen_teorico="TEO-001" AND nota>=5;

-- ¿Qué profesor hace las prácticas de FOL?
Select profesor.* from profesor inner join profesor_diseña_practica p ON p.id_profesor=profesor.id INNER JOIN practica on practica.id=p.id_profesor where practica.titulo like "%FOL%";

-- ¿Cambia el profesor de prácticas de FOL por el de REDES?
UPDATE profesor_diseña_practica set id_profesor 7 where id_practica=(select id from practica where titulo like "%FOL%");

-- Borra los alumnos del grupo de tarde
DELETE FROM alumno_realiza_practica where id_alumno in (select id from alumno where grupo="C");
DELETE FROM alumno_hace_examen_teorico where id_alumno in (select id from alumno where grupo="C");
DELETE FROM alumno where id in (3, 7, 15...); -- ELIMINAR TODO DE LA TABLA "ALUMNO" A PARTIR DE UNA SECUENCIA DE "ID"

-- UPDATE CASCADE EJEMPLO
UPDATE alumno set id=5 WHERE nombre="Miguel";
