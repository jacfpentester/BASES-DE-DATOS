use revista;

-- Pon “corazón” en la especialidad de los periodistas
UPDATE periodista set especialidad="Corazón";

-- ¿Qué periodistas están en una sucursal de Almería?
SELECT empleado.* from empleados where codigo_sucursal in (select codigo from sucursal where provincia="Almería");

-- Comprueba si hay revistas escritas por más de 1 periodista
SELECT numero_registro_revista, count(*)as total from periodista_escribe_revista group by numero_registro_revista having total>1;

-- Borra los periodistas que no han escrito nada
DELETE FROM periodista where id not in (select distinct id_periodista from periodista_escribe_revista);
