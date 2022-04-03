use formacion;

-- ¿Qué cursos ha impartido el empleado Pepe?
SELECT curso.* from curso,edicion,empleado where curso.id=edicion.id_curso and edicion.id_empleado_capacitado=empleado.id and empleado.nombre="Pepe";

-- ¿Cuántos cursos tiene cada edición?
SELECT COUNT(id_curso), id_edicion from edicion group by id_edicion;

-- Cambiar la fecha de fin a mañana del curso GBD
UPDATE edicion set from fecha_fin ="2022-04-02" where id_curso=(select id from curso where nombre="GBD");

-- Borra los cursos con coste inferior a 50€
DELETE FROM curso_tiene_prerrequisito where id_curso = "";
DELETE FROM edicion where id_curso="";
DELETE from curso where coste<50;
